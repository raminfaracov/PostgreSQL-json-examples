# PostgreSQL-json-examples
Useful and interesting examples for JSON type on PostgreSQL

1. PostgreSQL has a recursive function for deleting recursively null objects from the JSON string (jsonb_strip_nulls). But sometimes we are needed to remove empty objects from the JSON string. For example: ({"user":{}, "id":100}) in this JSON string "user" object is empty. For this I wrote recursive function which removed null and empty objects. 
select remove_null_empty_objects_from_json(t1.jsonb_data) from t1;  - Input parameter: JSONB, Return: JSONB
Function source code file:  -  remove_null_empty_objects_from_json.sql



