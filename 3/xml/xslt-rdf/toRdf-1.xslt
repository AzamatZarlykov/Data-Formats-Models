<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />

    <xsl:template match="universities">
    @base &lt;http://newbase.com/&gt; .
    @prefix aiiso: &lt;http://purl.org/vocab/aiiso/schema#&gt; .
    @prefix dcterms: &lt;http://purl.org/dc/terms/&gt; .
    @prefix dbpediaowl: &lt;https://dbpedia.org/ontology/&gt; .
    @prefix ov: &lt;http://open.vocab.org/terms/&gt; .
    @prefix juso: &lt;http://rdfs.o/juso/&gt; .
    @prefix swc: &lt;http://data.semanticweb.org/ns/swc/ontology#&gt; .
    @prefix vcard: &lt;http://www.w3.org/2006/vcard/ns#&gt; .
    @prefix schema: &lt;http://schema.org/&gt; .
    @prefix mv: &lt;http://schema.mobivoc.org/&gt; .
    @prefix crsw: &lt;http://courseware.rkbexplorer.com/ontologies/courseware#&gt; .
    @prefix disco: &lt;http://rdf-vocabulary.ddialliance.org/discovery#&gt; .
    @prefix lsc: &lt;http://linkedscience.org/lsc/ns#&gt; .
    @prefix mads: &lt;http://www.loc.gov/mads/rdf/v1#&gt; .
    @prefix teach: &lt;http://linkedscience.org/teach/ns#&gt; .
    @prefix vivo: &lt;http://vivoweb.org/ontology/core#&gt; .
    @prefix foaf: &lt;http://xmlns.com/foaf/spec/#&gt; .
    @prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
    @prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
    @prefix disco: &lt;http://rdf-vocabulary.ddialliance.org/discovery#&gt; .
    <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="university">
    &lt;<xsl:apply-templates mode="NamesForUnis" select="name"/>&gt;
        a vivo:University ;
        dcterms:title "<xsl:value-of select="name[@xml:lang='en']"/>"@en ;
        ov:phoneNumber "<xsl:value-of select="phoneNumber[@xml:lang='en']"/>"@en ;
        vcard:street-address "<xsl:value-of select="address[@xml:lang='en']|address[@xml:lang='cz']"/>"@cz ;
        dbpediaowl:numberOfStudents "<xsl:value-of select="numberOfStudents"/>"^^xsd:nonNegativeInteger ;
        dbpediaowl:ranking "<xsl:value-of select="ranking"/>"^^xsd:positiveInteger ;
        ex:constitutes &lt;<xsl:apply-templates mode="UniConstitutes" select="name"/>&gt; .
    <xsl:apply-templates/>
    </xsl:template>
    

    <xsl:template match="professor">
    &lt;<xsl:value-of select="firstName[@xml:lang='en']"/><xsl:value-of select="lastName[@xml:lang='en']"/>&gt;
        a ex:Professor ;
        foaf:firstName "<xsl:value-of select="firstName[@xml:lang='en']"/>"@en ;
        foaf:lastName "<xsl:value-of select="lastName[@xml:lang='en']"/>"@en ;
        ov:phoneNumber "<xsl:value-of select="phoneNumber[@xml:lang='en']"/>"@en ;
        vcard:bday "<xsl:value-of select="dateOfBirth"/>"^^xsd:dateTime ;
        ex:officeHours "<xsl:value-of select="officeHours"/>"^^xsd:time ;
       <xsl:apply-templates mode="NamesForPaperProf" select="firstName"/>
       <xsl:apply-templates mode="NamesForPaperProf2" select="firstName"/>
        <xsl:for-each select="research">
        ex:participatesIn  &lt;<xsl:value-of select="translate(name[@xml:lang='en'], ' ', '')"/>&gt; ;
        </xsl:for-each>
        ex:isPartOf &lt;<xsl:apply-templates mode="NamesForStudentIsPartOf" select="firstName"/>&gt; .

    <!--<xsl:apply-templates select="professor[str[@name = 'officeHours'] = '09:00:00']"/>-->

    <xsl:apply-templates select="paper"/>
    <xsl:apply-templates select="research"/>
    <xsl:apply-templates select="officeHours[text() = '09:00:00']"/>
    
    </xsl:template>
    <xsl:template mode="NamesForCourse" match="id">
    <xsl:choose>
    <xsl:when test="text() = 'a1fom'">Anatomy</xsl:when>
    <xsl:when test="text() = 'e1fos'">Economics</xsl:when>
    <xsl:when test="text() = 'ma1fomp'">MathematicalAnalysis</xsl:when>
    </xsl:choose>

        </xsl:template>

     <xsl:template mode="NamesForPaper" match="name">
    <xsl:choose>
    <xsl:when test="text() = 'Interesting paper about Mathematical Analysis'">PaperAboutMathematicalAnalysis</xsl:when>
    <xsl:when test="text() = 'Interesting paper about Linear Algebra'">PaperAboutLinearAlgebra</xsl:when>
    <xsl:when test="text() = 'Interesting paper about Discrete Mathematics'">PaperAboutDiscreteMathematics</xsl:when>
    </xsl:choose>
        </xsl:template>


     <xsl:template mode="NamesForUnis" match="name">
    <xsl:choose>
    <xsl:when test="text() = 'king''s college london'">King'sCollegeLondon</xsl:when>
    <xsl:when test="text() = 'Charles University'">CharlesUniversity</xsl:when>
    <xsl:when test="text() = 'Massachusetts Institute of Technology'">MassachusettsInstituteofTechnology</xsl:when>
    </xsl:choose>

        </xsl:template>
      <xsl:template mode="NamesForFacultiyTeach" match="name">
    <xsl:choose>
    <xsl:when test="text() = 'faculty of social sciences'">Economics</xsl:when>
    <xsl:when test="text() = 'faculty of mathematics and physics'">MathematicalAnalysis</xsl:when>
    <xsl:when test="text() = 'faculty of medicine'">Anatomy</xsl:when>
    </xsl:choose>

        </xsl:template>

     <xsl:template mode="NamesForFacultiy" match="name">
    <xsl:choose>
    <xsl:when test="text() = 'faculty of mathematics and physics'">FacultyOfMathematicsAndPhysics</xsl:when>
    <xsl:when test="text() = 'faculty of social sciences'">facultyOfSocialSciences</xsl:when>
    <xsl:when test="text() = 'faculty of medicine'">FacultyOfMedicine</xsl:when>
    </xsl:choose>
    </xsl:template>

     <xsl:template mode="UniConstitutes" match="name">
    <xsl:choose>
    <xsl:when test="text() = 'Charles University'">FacultyOfMathematicsAndPhysics</xsl:when>
    <xsl:when test="text() = 'faculty of social sciences'">facultyOfSocialSciences</xsl:when>
    <xsl:when test="text() = 'faculty of medicine'">FacultyOfMedicine</xsl:when>
    </xsl:choose>
    </xsl:template>

     <xsl:template mode="NamesForPaperProf" match="firstName">
    <xsl:choose>
    <xsl:when test="text() = 'Alex'">ex:isAuthorOf &lt;PaperAboutMathematicalAnalysis&gt; ;</xsl:when>
    <xsl:when test="text() = 'Sam'">ex:isAuthorOf &lt;PaperAboutLinearAlgebra&gt; ;</xsl:when>
    </xsl:choose>
    </xsl:template>

    <xsl:template mode="NamesForPaperProf2" match="firstName">
    <xsl:choose>
    <xsl:when test="text() = 'Sam'">ex:isAuthorOf &lt;PaperAboutDiscreteMathematics&gt; ;</xsl:when>
    </xsl:choose>
    </xsl:template>

     <xsl:template mode="NamesForStudentIsPartOf" match="firstName">
    <xsl:choose>
    <xsl:when test="text() = 'Jim'">MassachusettsInstituteofTechnology</xsl:when>
    <xsl:when test="text() = 'Nick'">King'sCollegeLondon</xsl:when>
    <xsl:when test="text() = 'Mark'">CharlesUniversity</xsl:when>
    <xsl:when test="text() = 'Sam'">King'sCollegeLondon</xsl:when>
    <xsl:when test="text() = 'Alex'">CharlesUniversity</xsl:when>
    </xsl:choose>
    </xsl:template>

    <xsl:template match="officeHours">
    ex:Professor
    a rdfs:Class ;
        rdfs:subClassOf foaf:Person ;
        rdfs:subClassOf dbpediaowl:professor ;
        rdfs:label "professor"@en ;
        rdfs:comment "a proffesor in a university"@en .
    
    ex:officeHours
        a rdfs:Property ;
        rdfs:label "office hours"@en ;
        rdfs:comment "time and date when the office is open"@en ;
        rdfs:domain ex:professor ;
        rdfs:range xsd:time .

    ex:isAuthorOf 
        a rdfs:Property ;
        rdfs:label "is author of"@en ;
        rdfs:comment "relates professor and paper"@en ; 
        rdfs:domain ex:Professor ;
        rdfs:range ex:Paper .

    ex:isPartOf
        a rdfs:Property ;
        rdfs:label "is part of"@en ;
        rdfs:comment "relates person and univesity"@en ;
        rdfs:domain foaf:Person ;
        rdfs:range vivo:University .

    ex:participatesIn 
        a rdfs:Property ;
        rdfs:label "participates in"@en ;
        rdfs:comment "relates professor and research"@en ;
        rdfs:domain ex:Professor ;
        rdfs:range lsc:Research .

    </xsl:template>
    

    <xsl:template match="student">
    &lt;<xsl:value-of select="firstName[@xml:lang='en']"/><xsl:value-of select="lastName[@xml:lang='en']"/>&gt;
        a ex:Student ;
        foaf:firstName "<xsl:value-of select="firstName[@xml:lang='en']"/>"@en ;
        foaf:lastName  "<xsl:value-of select="lastName[@xml:lang='en']"/>"@en ;
        ov:phoneNumber  "<xsl:value-of select="phoneNumber[@xml:lang='en']"/>"@en ;
        vcard:bday  "<xsl:value-of select="dateOfBirth"/>"^^xsd:dateTime ;
        ex:yearOfStudy  "<xsl:value-of select="yearOfStudy"/>"^^xsd:positiveInteger ;
        ex:gpa "<xsl:value-of select="gpa"/>"^^xsd:double ;
        ex:studies  &lt;<xsl:value-of select="translate(studyProgram/name[@xml:lang='en'], ' ', '')"/>&gt; ;
        ex:isPartOf &lt;<xsl:apply-templates mode="NamesForStudentIsPartOf" select="firstName"/>&gt; .
    
    <xsl:apply-templates select="studyProgram"/>
    <xsl:apply-templates select="dateOfBirth[text() = '1999-11-28T13:20:00']"/>
    </xsl:template>
    
    <xsl:template match="dateOfBirth">
    ex:Student
        a rdfs:Class ;
        rdfs:subClassOf foaf:Person ;
        rdfs:subClassOf teach:Student ;
        rdfs:label "student"@en ;
        rdfs:comment "a student in a university"@en .

    ex:yearOfStudy
        a rdfs:Property ;
        rdfs:label "year of study"@en ;
        rdfs:comment "the year of students study"@en ;
        rdfs:domain ex:student ;
        rdfs:range xsd:positiveInteger . 

    ex:gpa
        a rdfs:Property ;
        rdfs:label "GPA"@en ;
        rdfs:comment "grade point average"@en ;
        rdfs:domain ex:student ;
        rdfs:range xsd:double .
    

    ex:studies
        a rdfs:Property ;
        rdfs:label "studies"@en ;
        rdfs:comment "relates student and studyProgram"@en ;
        rdfs:domain ex:student ;
        rdfs:range ex:studyProgram .

    ex:StudyProgram
        a rdfs:Class ;
        rdfs:label "study program"@en ;
        rdfs:comment "a program studied by a student"@en .

    ex:teaches
        a rdfs:Property ;
        rdfs:label "teaches"@en ;
        rdfs:comment "relatesfaculty and course"@en ;
        rdfs:domain aiiso:Faculty ;
        rdfs:range schema:Course .

    </xsl:template>
    
    <xsl:template match="faculty">
    &lt;<xsl:apply-templates mode="NamesForFacultiy" select="name"/>&gt;
        a aiiso:Faculty ;
        dcterms:title "<xsl:value-of select="name[@xml:lang='en']"/>"@en ;
        ex:establishDate "<xsl:value-of select="establishmentYear"/>"^^xsd:date ;
        dbpediaowl:budget "<xsl:value-of select="budget"/>"^^xsd:double ;
        ex:teaches &lt;<xsl:apply-templates mode="NamesForFacultiyTeach" select="name"/>&gt; .
    
    <xsl:apply-templates select="course"/>
    <xsl:apply-templates select="establishmentYear[text() = '1680-02-20']"/>
    </xsl:template>

    <xsl:template match="course">
    &lt;<xsl:apply-templates mode="NamesForCourse" select="id"/>&gt;
        a schema:Course ;
        mv:id "<xsl:value-of select="id[@xml:lang='en']"/>"@en ;
        ex:numberOfCredits "<xsl:value-of select="numberOfCredits"/>"^^xsd:nonNegativeInteger ;
        dbpediaowl:capacity "<xsl:value-of select="maxCapacity"/>"^^xsd:nonNegativeInteger .

    <xsl:apply-templates select="numberOfCredits[text() = '4']"/>
    </xsl:template>

    <xsl:template match="paper">
    &lt;<xsl:apply-templates mode="NamesForPaper" select="name"/>&gt;
        a ex:Paper ;
        dcterms:title "<xsl:value-of select="name[@xml:lang='en']"/>"@en ;
        ex:numberOfPeopleInPaper "<xsl:value-of select="numberOfPeople"/>"^^xsd:positiveInteger ;
        disco:startDate "<xsl:value-of select="startDate"/>"^^xsd:date .
    </xsl:template>

    <xsl:template match="research">
    &lt;<xsl:value-of select="translate(name[@xml:lang='en'], ' ', '')"/>&gt;
        a ex:Paper ;
        dcterms:title "<xsl:value-of select="name[@xml:lang='en']"/>"@en ;
        ex:numberOfPeopleInPaper "<xsl:value-of select="numberOfPeople"/>"^^xsd:positiveInteger ;
        disco:startDate "<xsl:value-of select="startDate"/>"^^xsd:date .

    <xsl:apply-templates select="numberOfPeople[text() = '10']"/>
    </xsl:template>

    <xsl:template match="studyProgram">
    &lt;<xsl:value-of select="translate(name[@xml:lang='en'], ' ', '')"/>&gt;
        a ex:StudyProgram ;
        dcterms:title "<xsl:value-of select="name[@xml:lang='en']"/>"@en ;
        dbpediaowl:numberOfStudents "<xsl:value-of select="numberOfStudents"/>"^^xsd:nonNegativeInteger ;
        ex:courseList "course1 course2 course3"@en .

    <!-- <xsl:apply-templates select="numberOfStudents[text() = '65']"/> -->
    </xsl:template>

    <!-- <xsl:template match="numberOfStudents">
    ex:StudyProgram
        a rdfs:Class ;
        rdfs:label "study program"@en ;
        rdfs:comment "a program studied by a student"@en .

    ex:teaches
        a rdfs:Property ;
        rdfs:label "teaches"@en ;
        rdfs:comment "relatesfaculty and course"@en ;
        rdfs:domain aiiso:Faculty ;
        rdfs:range schema:Course .

    </xsl:template> -->

    <xsl:template match="numberOfPeople">
    ex:Research
        a rdfs:Class;
        rdfs:subClassOf lsc:Research ;
        rdfs:label "research"@en ;
        rdfs:comment "research conducted by someone"@en .

    ex:numberOfPeopleInResearch
        a rdfs:Property ;
        rdfs:label "number of people"@en ;
        rdfs:comment "number of people involved in some scientific research"@en ;
        rdfs:domain ex:Research ;
        rdfs:range xsd:positiveInteger . 

    ex:Paper
        a rdfs:Class;
        rdfs:label "paper"@en ;
        rdfs:comment "a scientific paper that is created/published by someone"@en .

    ex:numberOfPeopleInPaper
        a rdfs:Property ;
        rdfs:label "number of people"@en ;
        rdfs:comment "number of people involved in some scientific paper"@en ;
        rdfs:domain ex:Paper ;
        rdfs:range xsd:positiveInteger . 

    </xsl:template>

    <xsl:template match="establishmentYear">
    ex:courseList
        a rdfs:Property ;
        rdfs:label "course list"@en ;
        rdfs:comment "list of courses in a study program"@en ;
        rdfs:domain ex:studyProgram ;
        rdfs:range rdfs:literal .

    ex:establishDate 
        a rdfs:Property ;
        rdfs:label "establish date"@en ;
        rdfs:comment "date when something was established"@en ;
        rdfs:domain aiiso:Faculty ;
        rdfs:range xsd:date .

    ex:constitutes 
        a rdfs:Property ;
        rdfs:label "constitutes"@en ;
        rdfs:comment "relates university and faculty"@en ;
        rdfs:domain dbpediaowl:university ;
        rdfs:range aiiso:Faculty .

    </xsl:template>

    <xsl:template match="numberOfCredits">
    ex:numberOfCredits
        a rdfs:Property ;
        rdfs:label "number of credits"@en ;
        rdfs:comment "number of credits that course grants upon completion"@en ;
        rdfs:domain schema:Course ;
        rdfs:range xsd:nonNegativeInteger .

    </xsl:template>

    
    <xsl:template match="text()"/>


</xsl:stylesheet>
