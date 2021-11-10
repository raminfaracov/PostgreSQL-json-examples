# PostgreSQL-json-examples
Useful and interesting examples for JSON type on PostgreSQL

1. PostgreSQL has a recursive function for deleting recursively null objects from the JSON string (jsonb_strip_nulls). But sometimes we are needed to remove empty objects from the JSON string. For example: ({"user":{}, "id":100}) in this JSON string "user" object is empty. For this I wrote recursive function: 
Please view the remove_null_empty_objects_from_json.sql file


