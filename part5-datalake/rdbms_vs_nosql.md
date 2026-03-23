part2-nosql/rdbms_vs_nosql.md

Database Recommendation

For a healthcare pms, MySQL over MongoDB is good.
Patient data — such as medical history, prescriptions, and billing records — require UpToDate information. 
anything goes wrong here lead to human life will be in trouble
MySQL's ACID helps every transaction is complete, consistent, and permanent. 
For example, if doctor is writing a or suggesting medicine and if anything happens to customer ,MySQL assures the data roll back rather than saving wrong information.

According to the CAP theorem, MySQL prioritizes Consistency and Partition Tolerance, 

MongoDB's BASE model, while highly flexible and scalable, allows temporary inconsistency — so chances that medical professional can ready wrong information

However, if the startup also needs a fraud detection module, the answer changes partially.

Fraud detection requires analysing large information of unstructured, fast-moving data — login patterns,in real time

MongoDB helps here as it is flexible schema and horizontal scalability. Therefore, the ideal architecture would be a hybrid approach: MySQL for core patient records and clinical data where ACID compliance is non-negotiable, and MongoDB for the fraud detection module where speed, flexibility, and scalability matter more than strict consistency.


