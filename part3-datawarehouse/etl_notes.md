3 Under section ## ETL Decisions, describe 3 specific transformation decisions you made while cleaning the raw data before loading into the warehouse. For each decision, explain what the problem was and how you resolved it. Use the format:

## ETL Decisions

### Decision 1 — Standardizing date format 
Problem: ...Different date format identified in date column
Resolution: I search on internet and found MYSQL STR_TO_DATE() function with pattern matching using like operator to identify and convert it all in one format 

I did it all DIM table and then in retail transaction table

### Decision 2 — Category case to proper 
Problem: ...Category spellings were mentioned in upper & lower case.
Resolution: I search on internet and found & use Update, set, case statements to ensure all title case in same format
 

I did it all DIM table and then in retail transaction table


### Decision 3 — Store city is blank or null 
Problem: ...store city for few rows were blank or null.
Resolution: I search on internet and found & use Update, set, case statements to ensure rows in store city is updated with information.
 

I did it all DIM table and then in retail transaction table



