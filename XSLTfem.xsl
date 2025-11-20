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
                <link rel="stylesheet" type="text/css" href="../style.css"/>
                <!-- first title element -->
                <title>
                    <xsl:value-of select="(//title)[1]"/>
                </title>    
            </head>
            <body>
                <nav>
                    <ul>
                        <li><a href="../index.html">Main</a></li>
                        <li><a href="../methodology.html">Methodology</a></li>
                        <li><a href="../texts.html">Texts</a></li>
                        <li><a href="../analysis.html">Analysis</a></li>
                    </ul>
                </nav>
                <h1>
                    <xsl:value-of select="(//title)[1]"/>
                </h1>
                <xsl:apply-templates select="//main"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="structure[@p]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="power_system">
         <span class="tooltip">
            <xsl:apply-templates/>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@p_patriarchy"></xsl:apply-templates></span>
             <span class="tooltiptext" role="tooltip">
                 <xsl:apply-templates select="@p_social"></xsl:apply-templates></span>
             <span class="tooltiptext" role="tooltip">
                 <xsl:apply-templates select="@p_religion"></xsl:apply-templates></span>
    </span> 
    </xsl:template>
</xsl:stylesheet>