-- How many tables do you have?

select * FROM user_tables 
WHERE table_name like 'STG\_%' ESCAPE '\'
OR table_name like 'R\_%' ESCAPE '\'
OR table_name like 'H\_%' ESCAPE '\'
OR table_name like 'L\_%' ESCAPE '\'
OR table_name like 'S\_%' ESCAPE '\'
OR table_name like 'D\_%' ESCAPE '\'
OR table_name like 'F\_%' ESCAPE '\'
ORDER BY table_name;
