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

    <xsl:template match="student">
    &lt;<xsl:value-of select="firstName[@xml:lang='en']"/><xsl:value-of select="lastName[@xml:lang='en']"/>&gt;
        a ex:Student ;
        foaf:firstName "<xsl:value-of select="firstName[@xml:lang='en']"/>"@en ;
        foaf:lastName  "<xsl:value-of select="lastName[@xml:lang='en']"/>"@en ;
        ov:phoneNumber  "<xsl:value-of select="phoneNumber[@xml:lang='en']"/>"@en ;
        vcard:bday  "<xsl:value-of select="dateOfBirth"/>"^^xsd:dateTime ;
        ex:yearOfStudy  "<xsl:value-of select="yearOfStudy"/>"^^xsd:positiveInteger ;
        ex:gpa "<xsl:value-of select="gpa"/>"^^xsd:double ;
        ex:studies  &lt;<xsl:value-of select="studyProgram/name[@xml:lang='en']"/>&gt; ;
        ex:isPartOf  .

        
    </xsl:template>
    
    <xsl:template match="text()"/>

    <!--<xsl:template match="properties">-->
    <!--    # Properties:-->
    <!--</xsl:template>-->

    <!--<xsl:template match="data">-->
    <!--    Data-->
    <!--</xsl:template>-->


</xsl:stylesheet>