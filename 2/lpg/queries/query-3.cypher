// Third year students eligible for ma1fomp
MATCH
    (s:Student)-[:IS_PART_OF]->(u:University)-[:CONSTITUTES]->(f:Faculty)-[:TEACHES]->(:Course {id:"ma1fomp"})
WHERE
    s.yearOfStudy = 3
RETURN s