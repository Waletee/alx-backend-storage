#!/usr/bin/env python3
"""Task 11"""


def schools_by_topic(mongo_collection, topic):
    """function that returns the list of school having a specific topic
    """
    # return list(mongo_collection.find({'topics': topic}))
    return list(mongo_collection.find({'topics': {'$elemMatch': {'$eq': topic}}}, {'school': 1}))
