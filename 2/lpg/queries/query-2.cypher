// All papers associated with Faulty Of Social Sciences.
MATCH
    (p:Paper)<-[:IS_AUTHER_OF]-(pr:Professor)-[:IS_PART_OF]->(u:University)-[:CONSTITUTES]->(f:Faculty {name: "Faulty Of Social Sciences"})
RETURN p

