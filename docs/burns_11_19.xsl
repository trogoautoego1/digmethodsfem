<?xml version="1.0" encoding="UTF-8"?>
<!--
  XSLT 1.0 stylesheet for generating an SVG bar chart
  showing the percentage of the popular vote
  won by the Democratic candidate in the 2012 US election.
  
  Designed to satisfy all requirements of SVG Assignment #2:
  - meaningful comments
  - upward-growing bars (negative Y)
  - valid SVG output
  - viewBox revealing upper-right quadrant
  - axes, labels, and calculated percentages
  - readable and clean SVG using <rect>, <text>, and <line>
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2000/svg"
    version="1.0">
    
    <!-- ==========================================================
       GLOBAL CONSTANTS FOR LAYOUT
       ========================================================== -->
    <xsl:variable name="bar-width" select="20"/>
    <xsl:variable name="bar-gap"   select="10"/>
    <xsl:variable name="y-scale"   select="4"/> 
    <!-- 4px per percent point → max bar ~400px for 100% -->
    
    
    <!-- ==========================================================
       MAIN TEMPLATE: produces full SVG document
       ========================================================== -->
    <xsl:template match="/">
        
        <!--
      Hard-coded viewBox so the upper-right quadrant is visible.
      Bars extend upward with negative Y, so minimum Y must be negative.
      Width depends on number of bars (50 states + DC = 51).
      Manually oversizing to ensure labels fit.
    -->
        <svg width="1200" height="600"
            viewBox="0 -500 1200 550"
            xmlns="http://www.w3.org/2000/svg">
            
            <!-- ======================== TITLE ======================== -->
            <text x="20" y="-470"
                font-size="24"
                text-anchor="start">
                Democratic Vote Percentage by State (2012)
            </text>
            
            <!-- ======================== AXES ========================= -->
            <!-- X-axis -->
            <line x1="50" y1="0" x2="1150" y2="0"
                stroke="black" stroke-width="2"/>
            
            <!-- Y-axis -->
            <line x1="50" y1="0" x2="50" y2="-450"
                stroke="black" stroke-width="2"/>
            
            <!-- ========================================================
           Y-AXIS TICKS (manual: 10,20,...,90)
           No EXSLT and no XSLT 2.0 features needed.
           Use a recursive template to loop.
           ======================================================== -->
            <xsl:call-template name="draw-ticks">
                <xsl:with-param name="value" select="10"/>
            </xsl:call-template>
            
            <!-- ========================================================
           DRAW BARS FOR EACH STATE
           Sorted by descending Democratic percentage
           ======================================================== -->
            <xsl:for-each select="/election/state">
                <xsl:sort select="number(candidate[@party='Democrat']) 
                    div 
                    sum(candidate)"
                    data-type="number"
                    order="descending"/>
                
                <!-- Democratic votes -->
                <xsl:variable name="dem"
                    select="number(candidate[@party='Democrat'])"/>
                
                <!-- Total votes (explicit numeric conversion needed for XSLT 1.0) -->
                <xsl:variable name="total"
                    select="
                    number(candidate[@party='Democrat']) +
                    number(candidate[@party='Republican']) +
                    number(candidate[@party='Libertarian']) +
                    number(candidate[@party='Green'])
                    "/>
                
                <!-- Democratic percentage -->
                <xsl:variable name="pct"
                    select="100 * $dem div $total"/>
                
                <!-- Bar height -->
                <xsl:variable name="height"
                    select="$pct * $y-scale"/>
                
                
                <!-- Scaled bar height -->
                <xsl:variable name="height" select="$pct * $y-scale"/>
                
                <!-- Horizontal bar position -->
                <xsl:variable name="xpos"
                    select="50 + (position() - 1) * ($bar-width + $bar-gap)"/>
                
                <!-- ============ DRAW THE BAR ============ -->
                <rect x="{$xpos}"
                    y="-{$height}"
                    width="{$bar-width}"
                    height="{$height}"
                    fill="#3366cc"/>
                
                <!-- ========== STATE LABEL under bar ========== -->
                <text x="{$xpos + $bar-width div 2}"
                    y="20"
                    text-anchor="middle"
                    font-size="10">
                    <xsl:value-of select="@acro"/>
                </text>
                
                <!-- ========== PERCENT LABEL above bar ========== -->
                <text x="{$xpos + $bar-width div 2}"
                    y="-{$height - 5}"
                    text-anchor="middle"
                    font-size="10">
                    <xsl:value-of select="format-number($pct,'0.0')"/>%
                </text>
                
            </xsl:for-each>
            
        </svg>
    </xsl:template>
    
    
    
    <!-- ==========================================================
       TEMPLATE draw-ticks
       Recursively draws ticks at 10%, 20%, ..., 90%.
       ========================================================== -->
    <xsl:template name="draw-ticks">
        <xsl:param name="value"/>
        
        <xsl:if test="$value &lt;= 90">
            
            <!-- Draw gridline -->
            <line x1="50"
                y1="-{$value * $y-scale}"
                x2="1150"
                y2="-{$value * $y-scale}"
                stroke="gray"
                stroke-dasharray="4,4"
                stroke-width="0.5"/>
            
            <!-- Tick label -->
            <text x="40"
                y="-{$value * $y-scale}"
                text-anchor="end"
                font-size="10">
                <xsl:value-of select="$value"/>%
            </text>
            
            <!-- Recurse to next tick -->
            <xsl:call-template name="draw-ticks">
                <xsl:with-param name="value" select="$value + 10"/>
            </xsl:call-template>
            
        </xsl:if>
        
    </xsl:template>
    
</xsl:stylesheet>
