// All courses that Mark can TA for based on research experience.
MATCH 
    (c:Course)<-[:TEACHES]-(f:Faculty)<-[:CONSTITUTES]-(u:University)<-[:IS_PART_OF]-(p:Professor)-[:PARTICIPATES_IN]->(r:Research)<-[:PARTICIPATES_IN]-(p:Person {name: "MarkBlue"}) 
RETURN c
