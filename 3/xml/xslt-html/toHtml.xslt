<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    Universities' Professors
                </title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="university">
        <h1>
            <xsl:value-of select="name[@xml:lang='en']"/>
        </h1>
        <b>Ranking: </b><xsl:value-of select="ranking"/>
        <br/>
        <b>Number of students: </b><xsl:value-of select="numberOfStudents"/>
        <h2>Professors</h2>
        <xsl:apply-templates select="professor"/>
        <hr/>
    </xsl:template>

    <xsl:template match="professor">
        <b>
            <xsl:value-of select="lastName[@xml:lang='en']" />
        </b>
        <br/>
        <b>Research</b>
        <br/>
        <ul>
        <xsl:apply-templates select="research"/>
        </ul>
        <b>Papers</b>
        <br/>
        <ul>
        <xsl:apply-templates select="papers"/>
        </ul>
    </xsl:template>

    <xsl:template match="research">
        <li><xsl:value-of select="name[@xml:lang='en']"/></li>
    </xsl:template>
    
    <xsl:template match="paper">
        <li><xsl:value-of select="name[@xml:lang='en']"/></li>
    </xsl:template>

</xsl:stylesheet>