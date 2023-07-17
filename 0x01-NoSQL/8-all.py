#!/usr/bin/env python3
"""task 8"""
# import pymongo


def list_all(mongo_collection):
    """lists all documents in a collection:
    """
    return list(mongo_collection.find())
