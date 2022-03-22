// Students that have GPA < 2 and study in university that is in top 45
MATCH 
    s:Student)-[:IS_PART_OF]->(u:University)
WHERE
    u.ranking <= 45 and s.GPA < 2
RETURN s