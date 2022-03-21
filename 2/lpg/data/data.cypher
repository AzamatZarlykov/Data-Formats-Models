CREATE(u:University {
    name: 'Charles University',
    phoneNumber: '224 491 111',
    address: 'Opletalova 38',
    numberOfStudents: 46000,
    ranking: 1
})
CREATE(f:Faculty {
    name: 'Mathematics and Physics',
    establishmentYear: 1952,
    budget: 150000
})
CREATE(c:Course {
    id: 'NPRG036',
    numberOfCredits: 5,
    maxCapacity: 20
})
CREATE(st:Person :Student {
    firstName: 'John',
    lastName: 'Johnson',
    yearOfStudy: 3,
    GPA: 2.1
})
CREATE(sp:StudyProgram{
        name: 'Artificial Intelligence',
    numberOfStudents: 140,
    courseList: [
    'Introduction to Machine Learning',
    'Automata and Grammars'
    ]
})
CREATE(pf:Person :Professor{
    firstName: 'Jakub',
    lastName: 'Klimek',
    officeHours: 'Tuesday, 13:00 - 15:30'
})
CREATE(pr:Paper {
    name: 'AI in stochastic card swiss game Jass',
    numberOfPeople: 5,
    startDate: '2015-11-02'
})
CREATE(r:Research {
    name: 'Czech Diacritization',
    numberOfPeople: 4,
    startDate: '2016-02-15'
})
CREATE
(st)-[:IS_INVOLVED_IN {since: '2020-09-01'}]->(sp),
(st)-[:IS_PART_OF {since: '2019-09-01'}]->(u),
(f)-[:CONSTITUTES {since: '1952-09-01'}]->(u),
(f)-[:TEACHES {since: '2008-11-16'}]->(c),
(pf)-[:IS_PART_OF {since: '2013-07-15'}]->(u),
(pf)-[:HAS]->(pr),
(pf)-[:IS_PART_OF {since: '2021-02-10'}]->(r)