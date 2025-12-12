<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" 
        doctype-public="-//W3C//DTD SVG 1.1//EN"
        doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"/>
    
    <!-- Main template -->
    <xsl:template match="/document">
        <svg width="1400" height="1600" viewBox="0 0 1400 1600">
            
            <!-- Embedded styles -->
            <defs>
                <style type="text/css">
                    <![CDATA[
                    .chart-title {
                        font-family: Arial, sans-serif;
                        font-size: 24px;
                        font-weight: bold;
                        fill: #2c3e50;
                        text-anchor: middle;
                    }
                    .section-title {
                        font-family: Arial, sans-serif;
                        font-size: 16px;
                        font-weight: bold;
                        fill: #34495e;
                    }
                    .doc-label {
                        font-family: Arial, sans-serif;
                        font-size: 10px;
                        fill: #555;
                        text-anchor: start;
                    }
                    .value-label {
                        font-family: Arial, sans-serif;
                        font-size: 10px;
                        fill: #333;
                        text-anchor: start;
                    }
                    .bar {
                        stroke: none;
                        opacity: 0.85;
                        cursor: pointer;
                    }
                    .bar:hover {
                        opacity: 1;
                        stroke: #000;
                        stroke-width: 2;
                    }
                    .tooltip {
                        pointer-events: none;
                        opacity: 0;
                    }
                    .tooltip-box {
                        fill: #333;
                        stroke: #000;
                        stroke-width: 1;
                        rx: 5;
                        ry: 5;
                    }
                    .tooltip-text {
                        fill: white;
                        font-family: Arial, sans-serif;
                        font-size: 12px;
                    }
                    ]]>
                </style>
            </defs>
            
            <!-- Background -->
            <rect width="1400" height="1600" fill="#f8f9fa"/>
            
            <!-- Title -->
            <text x="700" y="30" class="chart-title">Feminist Theory Analysis by Document</text>
            
            <!-- Process f_theory_counts -->
            <g transform="translate(50, 60)">
                <text x="0" y="0" class="section-title">Feminist Theory Counts</text>
                <xsl:call-template name="create-bars">
                    <xsl:with-param name="data" select="f_theory_counts/document"/>
                    <xsl:with-param name="yOffset" select="20"/>
                    <xsl:with-param name="barColor" select="'#3498db'"/>
                    <xsl:with-param name="categoryName" select="'Feminist Theory'"/>
                </xsl:call-template>
            </g>
            
            <!-- Process power_system_counts -->
            <g transform="translate(50, 260)">
                <text x="0" y="0" class="section-title">Power System Counts</text>
                <xsl:call-template name="create-bars">
                    <xsl:with-param name="data" select="power_system_counts/document"/>
                    <xsl:with-param name="yOffset" select="20"/>
                    <xsl:with-param name="barColor" select="'#e74c3c'"/>
                    <xsl:with-param name="categoryName" select="'Power Systems'"/>
                </xsl:call-template>
            </g>
            
            <!-- Process religion_counts -->
            <g transform="translate(50, 460)">
                <text x="0" y="0" class="section-title">Religion Counts</text>
                <xsl:call-template name="create-bars">
                    <xsl:with-param name="data" select="religion_counts/document"/>
                    <xsl:with-param name="yOffset" select="20"/>
                    <xsl:with-param name="barColor" select="'#9b59b6'"/>
                    <xsl:with-param name="categoryName" select="'Religion'"/>
                </xsl:call-template>
            </g>
            
            <!-- Process class_counts -->
            <g transform="translate(50, 660)">
                <text x="0" y="0" class="section-title">Class Counts</text>
                <xsl:call-template name="create-bars">
                    <xsl:with-param name="data" select="class_counts/document"/>
                    <xsl:with-param name="yOffset" select="20"/>
                    <xsl:with-param name="barColor" select="'#f39c12'"/>
                    <xsl:with-param name="categoryName" select="'Class'"/>
                </xsl:call-template>
            </g>
            
            <!-- Process identity_counts -->
            <g transform="translate(50, 860)">
                <text x="0" y="0" class="section-title">Identity Counts</text>
                <xsl:call-template name="create-bars">
                    <xsl:with-param name="data" select="identity_counts/document"/>
                    <xsl:with-param name="yOffset" select="20"/>
                    <xsl:with-param name="barColor" select="'#2ecc71'"/>
                    <xsl:with-param name="categoryName" select="'Identity'"/>
                </xsl:call-template>
            </g>
            
            <!-- Process s_theory_counts -->
            <g transform="translate(50, 1060)">
                <text x="0" y="0" class="section-title">Social Theory Counts</text>
                <xsl:call-template name="create-bars">
                    <xsl:with-param name="data" select="s_theory_counts/document"/>
                    <xsl:with-param name="yOffset" select="20"/>
                    <xsl:with-param name="barColor" select="'#1abc9c'"/>
                    <xsl:with-param name="categoryName" select="'Social Theory'"/>
                </xsl:call-template>
            </g>
            
            <!-- Tooltip -->
            <g id="tooltip" class="tooltip">
                <rect id="tooltip-box" class="tooltip-box" x="0" y="0" width="250" height="60"/>
                <text id="tooltip-doc" class="tooltip-text" x="10" y="20" font-weight="bold"/>
                <text id="tooltip-category" class="tooltip-text" x="10" y="40"/>
                <text id="tooltip-total" class="tooltip-text" x="10" y="55"/>
            </g>
            
        </svg>
    </xsl:template>
    
    <!-- Template to create bars for each document -->
    <xsl:template name="create-bars">
        <xsl:param name="data"/>
        <xsl:param name="yOffset"/>
        <xsl:param name="barColor"/>
        <xsl:param name="categoryName"/>
        
        <xsl:for-each select="$data">
            <xsl:variable name="docIndex" select="position() - 1"/>
            <xsl:variable name="yPos" select="$yOffset + ($docIndex * 15)"/>
            
            <!-- Document label (truncated to fit) -->
            <text x="0" y="{$yPos + 10}" class="doc-label">
                <xsl:choose>
                    <xsl:when test="string-length(@id) &gt; 35">
                        <xsl:value-of select="concat(substring(@id, 1, 32), '...')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@id"/>
                    </xsl:otherwise>
                </xsl:choose>
            </text>
            
            <!-- Calculate total for this document -->
            <xsl:variable name="total">
                <xsl:call-template name="sum-attributes">
                    <xsl:with-param name="node" select="."/>
                </xsl:call-template>
            </xsl:variable>
            
            <!-- Create bar -->
            <xsl:if test="$total &gt; 0">
                <rect x="300" y="{$yPos}" 
                    width="{$total * 8}" 
                    height="10" 
                    fill="{$barColor}"
                    class="bar">
                    <title><xsl:value-of select="@id"/> - <xsl:value-of select="$categoryName"/>: <xsl:value-of select="$total"/></title>
                </rect>
                
                <!-- Value label -->
                <text x="{310 + ($total * 8)}" y="{$yPos + 9}" class="value-label">
                    <xsl:value-of select="$total"/>
                </text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Template to sum all attribute values -->
    <xsl:template name="sum-attributes">
        <xsl:param name="node"/>
        <xsl:value-of select="sum($node/attribute)"/>
    </xsl:template>
    
</xsl:stylesheet>