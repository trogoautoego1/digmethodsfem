<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Letters on the Equality of the Sexes and the Condition of Women</title>
                <!-- <link rel="stylesheet" type="text/css" href="../style.css"/> -->
            </head>
            <body>
                <h1>Letters on the Equality of the Sexes and the Condition of Women</h1>
                <xsl:apply-templates select="//main"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="structure[@p]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
</xsl:stylesheet>