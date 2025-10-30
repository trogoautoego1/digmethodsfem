<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title> XSLT 3 </title>
                <link rel="stylesheet" type="text/css" href="burns1027.css" />
            </head>
            <body>
                <xsl:apply-templates select="//body"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="body">
        <div><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="paragraph">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="QuestEvent">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
    
    <xsl:template match="QuestItem">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    
    <xsl:template match="character">
        <span class="character"
            ><xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="epithet">
        <span class="epithet">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="faction">
        <span class="faction">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="location">
        <span class="location">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>