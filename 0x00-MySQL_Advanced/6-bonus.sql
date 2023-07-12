--  creates a stored procedure AddBonus that adds a new correction for a student.
-- ALternative:
-- DROP PROCEDURE IF EXISTS AddBonus;
-- DELIMITER $$
-- CREATE PROCEDURE AddBonus(
--     IN user_id INT, 
--     IN project_name varchar(255), 
--     IN score FLOAT)
--     BEGIN
--         DECLARE project_id INT;
--         IF (SELECT COUNT(*) FROM projects WHERE name = project_name) = 0
--         THEN
--             INSERT INTO projects (name) VALUES (project_name);
--         END IF;
--         SET project_id = (SELECT id FROM projects WHERE name = project_name LIMIT 1);
--         INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
--     END $$
-- DELIMITER ;
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
CREATE PROCEDURE AddBonus(
    IN user_id INT, 
    IN project_name varchar(255), 
    IN score FLOAT)
    BEGIN
        DECLARE project_id INT;
        SELECT id INTO project_id FROM projects WHERE name = project_name LIMIT 1;
        IF project_id IS NULL 
        THEN
            INSERT INTO projects (name) VALUES (project_name);
            SET project_id = LAST_INSERT_ID();
        END IF;
        INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
    END $$
DELIMITER ;
