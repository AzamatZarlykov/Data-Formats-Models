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
    &lt;<xsl:value-of select="translate(name[@xml:lang='en'], ' ', '')"/>&gt;
        a vivo:University ;
        dcterms:title "<xsl:value-of select="name[@xml:lang='en']"/>"@en ;
        ov:phoneNumber "<xsl:value-of select="phoneNumber[@xml:lang='en']"/>"@en ;
        vcard:street-address "<xsl:value-of select="address[@xml:lang='en']|address[@xml:lang='cz']"/>"@cz ;
        dbpediaowl:numberOfStudents "<xsl:value-of select="numberOfStudents"/>"^^xsd:nonNegativeInteger ;
        dbpediaowl:ranking "<xsl:value-of select="ranking"/>"^^xsd:positiveInteger ;
        ex:constitutes &lt;FacultyOfMathematicsAndPhysics&gt; .
        
    <xsl:apply-templates/>
    </xsl:template>
    
    <!--<xsl:template match="professor[str[@name = 'firstName '] = 'Alex0']">-->
    <!--ex:officeHours-->
    <!--    a rdfs:Property ;-->
    <!--    rdfs:label "office hours"@en ;-->
    <!--    rdfs:comment "time and date when the office is open"@en ;-->
    <!--    rdfs:domain ex:professor ;-->
    <!--    rdfs:range xsd:time .-->
    <!--</xsl:template>-->
    
    <xsl:template match="professor">
    &lt;<xsl:value-of select="firstName[@xml:lang='en']"/><xsl:value-of select="lastName[@xml:lang='en']"/>&gt;
        a ex:Professor ;
        foaf:firstName "<xsl:value-of select="firstName[@xml:lang='en']"/>"@en ;
        foaf:lastName "<xsl:value-of select="lastName[@xml:lang='en']"/>"@en ;
        ov:phoneNumber "<xsl:value-of select="phoneNumber[@xml:lang='en']"/>"@en ;
        vcard:bday "<xsl:value-of select="dateOfBirth"/>^^xsd:dateTime ;
        ex:officeHours "09:00:00"^^xsd:time ;
        <xsl:for-each select="paper">
        ex:isAuthorOf &lt;<xsl:value-of select="translate(name[@xml:lang='en'], ' ', '')"/>&gt; ;
        </xsl:for-each>
        <xsl:for-each select="research">
        ex:participatesIn  &lt;<xsl:value-of select="translate(name[@xml:lang='en'], ' ', '')"/>&gt; ;
        </xsl:for-each>
        ex:isPartOf &lt;<xsl:value-of select="translate(../name[@xml:lang='en'], ' ', '')"/>&gt; .

    <!--<xsl:apply-templates select="professor[str[@name = 'officeHours'] = '09:00:00']"/>-->

    <xsl:apply-templates select="paper"/>
    <xsl:apply-templates select="research"/>
    
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
        ex:isPartOf &lt;<xsl:value-of select="translate(../name[@xml:lang='en'], ' ', '')"/>&gt; .
    
    <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="faculty">
    &lt;<xsl:value-of select="translate(name[@xml:lang='en'], ' ', '')"/>&gt;
        a aiiso:Faculty ;
        dcterms:title "<xsl:value-of select="name[@xml:lang='en']"/>"@en ;
        ex:establishDate "<xsl:value-of select="establishmentYear"/>"^^xsd:date ;
        dbpediaowl:budget "<xsl:value-of select="budget"/>"^^xsd:double ;
        ex:teaches &lt;&gt; .
    
    <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="course">
    &lt;&gt;
        a schema:Course ;
        mv:id "<xsl:value-of select="id[@xml:lang='en']"/>"@en ;
        ex:numberOfCredits "<xsl:value-of select="numberOfCredits"/>^^xsd:nonNegativeInteger ;
        dbpediaowl:capacity "<xsl:value-of select="maxCapacity"/>"^^xsd:nonNegativeInteger .

    </xsl:template>

    <xsl:template match="paper">
    &lt;<xsl:value-of select="translate(name[@xml:lang='en'], ' ', '')"/>&gt;
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

    </xsl:template>

    <xsl:template match="studyProgram">
    &lt;<xsl:value-of select="translate(name[@xml:lang='en'], ' ', '')"/>&gt;
        a ex:StudyProgram ;
        dcterms:title "<xsl:value-of select="name[@xml:lang='en']"/>@en ;
        dbpediaowl:numberOfStudents "<xsl:value-of select="numberOfStudents"/>^^xsd:nonNegativeInteger ;
        ex:courseList "course1 course2 course3"@en .

    </xsl:template>
    
    <xsl:template match="text()"/>


</xsl:stylesheet>