CREATE(Cuni:University {
    name: 'Charles University',
    phoneNumber: '224 491 111',
    address: 'Opletalova 38',
    numberOfStudents: 1000,
    ranking: 50
})

CREATE(Kcl:University {
    name: 'King\'s College London',
    phoneNumber: '+44 20 7836 5454',
    address: 'Strand, London WC2R 2LS, United Kingdom',
    numberOfStudents: 1200,
    ranking: 40
})

CREATE(Mit:University {
    name: 'Massachusetts Institute of Technology',
    phoneNumber: '+1 617-253-1000',
    address: '77 Massachusetts Ave, Cambridge, MA 02139, United States',
    numberOfStudents: 1300,
    ranking: 3
})

CREATE(FacultyOfMedicine: Faculty {
    name: 'FacultyOfMedicine',
    establishDate : '1800-11-04',
    budget: 999999
})

CREATE(FacultyOfSocialSciences: Faculty {
    name: 'Faulty Of Social Sciences',
    establishDate : '1750-03-10',
    budget: 1000000
})

CREATE(FacultyOfMathematicsAndPhysics: Faculty {
    name: 'Faculty of Mathematics and Physics',
    establishDate : '1680-02-20',
    budget: 2222222
})

CREATE(a1fom: Course {
    name: 'Anatomy',
    id: 'a1fom',
    numberOfCredits: 4,
    capacity: 50
})

CREATE(e1fos: Course {
    name: 'Economics',
    id: 'e1fos',
    numberOfCredits: 6,
    capacity: 60
})

CREATE(ma1fomp: Course {
    name: 'Mathematical Analysis',
    id: 'ma1fomp',
    numberOfCredits: 6,
    capacity: 30
})

CREATE(AlexGreen:Person :Professor {
    firstName: 'Alex',
    lastName: 'Green',
    phoneNumber: '+12345467',
    birthday: '1980-05-30T09:00:00',
    officeHours: '09:00:00'
})

CREATE(SamRed:Person :Professor {
    firstName: 'Sam',
    lastName: 'Red',
    phoneNumber: '+7654321',
    birthday: '1990-03-10T07:00:00',
    officeHours: '10:30:00'
})

CREATE(JimPurple:Person :Student {
    firstName: 'Jim',
    lastName: 'Purple',
    phoneNumber: '+2534545467',
    birthday: '2002-05-30T09:00:00',
    yearOfStudy: 2,
    GPA: 2.5
})

CREATE(NickOrange:Person :Student {
    firstName: 'Nick',
    lastName: 'Orange',
    phoneNumber: '+12373472457',
    birthday: '2000-10-12T10:30:00',
    yearOfStudy: 1,
    GPA: 1.2
})

CREATE(MarkBlue:Person :Student {
    firstName: 'Mark',
    lastName: 'Blue',
    phoneNumber: '+76444321',
    birthday: '1999-11-28T13:20:00',
    yearOfStudy: 3,
    GPA: 1.8
})

CREATE(ComputerScience: StudyProgram {
    name: 'Computer Science',
    numberOfStudents: 100,
    courseList: ['course1', 'course2', 'course3']
})

CREATE(Philosophy: StudyProgram {
    name: 'Philosophy',
    numberOfStudents: 70,
    courseList: ['course1', 'course2', 'course3']
})

CREATE(Economics: StudyProgram {
    name: 'Economics',
    numberOfStudents: 65,
    courseList: ['course1', 'course2', 'course3']
})

CREATE(PaperAboutDiscreteMathematics: Paper {
    name: 'Interseting paper about Discrete Mathematics',
    numberOfPeople: 7,
    startDate: '1990-08-17'
})

CREATE(PaperAboutMathematicalAnalysis: Paper {
    name: 'Interseting paper about Mathematical Analysis',
    numberOfPeople: 3,
    startDate: '1999-06-15'
})

CREATE(PaperAboutLinearAlgebra: Paper {
    name: 'Interseting paper about Linear Algebra',
    numberOfPeople: 5,
    startDate: '1997-05-10'
})

CREATE(ResearchAboutConvexHulls: Research {
    name: 'Research About Convex Hulls',
    numberOfPeople: 12,
    startDate: '2003-08-05'
})

CREATE(ResearchAboutDeterministicAlgorithms: Research {
    name: 'Research About Determinisitc Algorithms',
    numberOfPeople: 10,
    startDate: '2001-05-15'
})

CREATE(ResearchAboutRandomizedAlgorithms: Research {
    name: 'Research About Randomized Algorithms',
    numberOfPeople: 16,
    startDate: '2004-07-03'
})

CREATE
(NickOrange)-[:IS_INVOLVED_IN]->(Philosophy),
(NickOrange)-[:IS_PART_OF]->(Kcl),

(JimPurple)-[:IS_INVOLVED_IN]->(ComputerScience),
(JimPurple)-[:IS_PART_OF]->(Mit),

(MarkBlue)-[:IS_INVOLVED_IN]->(Economics),
(MarkBlue)-[:IS_PART_OF]->(Cuni),

(AlexGreen)-[:IS_PART_OF]->(Cuni),
(AlexGreen)-[:RESEARCH]->(ResearchAboutDeterministicAlgorithms),
(AlexGreen)-[:RESEARCH]->(ResearchAboutConvexHulls),
(AlexGreen)-[:HAS]->(PaperAboutMathematicalAnalysis),

(SamRed)-[:IS_PART_OF]->(Kcl),
(SamRed)-[:HAS]->(PaperAboutLinearAlgebra),
(SamRed)-[:HAS]->(PaperAboutDiscreteMathematics),
(SamRed)-[:RESEARCH]->(ResearchAboutRandomizedAlgorithms),

(FacultyOfMathematicsAndPhysics)-[:TEACHES]->(ma1fomp),
(FacultyOfMedicine)-[:TEACHES]->(a1fom),
(FacultyOfSocialSciences)-[:TEACHES]->(e1fos),

(FacultyOfMathematicsAndPhysics)-[:CONSTITUTES]->(Cuni),
(FacultyOfSocialSciences)-[:CONSTITUTES]->(Kcl),
(FacultyOfMedicine)-[:CONSTITUTES]-> (Mit)
