## Storage Systems
(Which databases/storage systems did you choose for each of the 4 goals and why)

GoalPrimary StorageHowGoal 1 — Readmission predictionData Lake + DuckDBDuckDB reads Parquet feature tables directly from the lake; XGBoost trains on them
Goal 2 — NL doctor queriesVector DB + MongoDBClinical notes from MongoDB are embedded → Vector DB; LLM+RAG answers questions
Goal 3 — Monthly reportsDuckDB + Data WarehouseStar-schema models built with dbt over DuckDB; Metabase renders dashboards
Goal 4 — Real-time ICU vitals MongoDB  Change Streams trigger alerts; TTL index auto-expires old readings


## OLTP vs OLAP Boundary
(Where does the transactional system end and the analytical system begin in your design)



## Trade-offs
(Identify one significant trade-off in your design and how you would mitigate it)