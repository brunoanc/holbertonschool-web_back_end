#!/usr/bin/env python3
"""Module to list schools with a specific topic"""

def schools_by_topic(mongo_collection, topic):
    """List schools with a specific topic"""
    return mongo_collection.find({"topics": topic})
