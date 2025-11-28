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


<!-- Formatting material; paragraphs, headings, quotes, ect. -->
    </xsl:template>
    <xsl:template match="structure[@p]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="structure[@page]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="structure[@l]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="structure[@po]">
        <section style="font-family: 'Georgia', 'Palatino Linotype', serif; font-style: italic; font-size: 1.2em; line-height: 1.6; color: #4b0082;"><xsl:apply-templates/></section>
    </xsl:template>
    <xsl:template match="structure[@header]">
    <span style="font-size: 1.5em; font-weight: bold; color: #4b0082;"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="structure[@subhead]">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="structure[@date]">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    <xsl:template match="structure[@letter]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="structure[@page]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="structure[@sig]">
        <p style="font-family: 'Edwardian Script ITC', 'Lucida Calligraphy', 'Palace Script MT', cursive; font-size: 1.6em; color: #2a1f14;"><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="structure[@fnote]">
        <sup style="font-size: 0.8em; vertical-align: super; color: #4b0082;"><xsl:apply-templates/></sup>
    </xsl:template>
    
    
<!-- power system match and tag -->   
    <xsl:template match="power_system">
        <span class="tooltip power-tooltip">
            <xsl:apply-templates/>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@p_patriarchy"></xsl:apply-templates></span>
             <span class="tooltiptext" role="tooltip">
                 <xsl:apply-templates select="@p_social"></xsl:apply-templates></span>
             <span class="tooltiptext" role="tooltip">
                 <xsl:apply-templates select="@p_religion"></xsl:apply-templates></span>
             <span class="tooltiptext" role="tooltip">
                 <xsl:apply-templates select="@p_class"></xsl:apply-templates></span>
             <span class="tooltiptext" role="tooltip">
                 <xsl:apply-templates select="@p_matriarchy"></xsl:apply-templates></span>
             <span class="tooltiptext" role="tooltip">
                 <xsl:apply-templates select="@p_political"></xsl:apply-templates></span>
             <span class="tooltiptext" role="tooltip">
                 <xsl:apply-templates select="@p_race"></xsl:apply-templates></span>
    </span> 
    </xsl:template>
    
<!-- feminist theory match and tag -->     
    <xsl:template match="f_theory">
        <span class="tooltip fem-tooltip">
            <xsl:apply-templates/>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@f_marxist"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@f_rad_fem"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@f_terf"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@f_liberal"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@f_praxis"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@f_political_lesbian"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@f_abolitionist"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@f_enlightenment_individualism"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@f_antifeminist"></xsl:apply-templates></span>
        </span> 
    </xsl:template>
    
    
    <xsl:template match="religion">
        <span class="tooltip religion-tooltip">
            <xsl:apply-templates/>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_christianity"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_non_western"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_islam"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_protestentism"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_catholicism"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_judaism"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_indigenous"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_greekmyth"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_quaker"></xsl:apply-templates></span>
            <span class="tooltiptext" role="tooltip">
                <xsl:apply-templates select="@r_anglican"></xsl:apply-templates></span>
        </span> 
    </xsl:template>
</xsl:stylesheet>