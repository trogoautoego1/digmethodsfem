<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/corpus">
        <s_theory_counts>
            <xsl:for-each select="document">
                <document id="{@id}">
                    <attribute name="s_freud">
                        <xsl:value-of select="count(.//s_theory[@s_freud])"/>
                    </attribute>
                    <attribute name="s_rights_of_man">
                        <xsl:value-of select="count(.//s_theory[@s_rights_of_man])"/>
                    </attribute>
                    <attribute name="s_enlightenment_individualism">
                        <xsl:value-of select="count(.//s_theory[@s_enlightenment_individualism])"/>
                    </attribute>
                    <attribute name="s_natural_rights">
                        <xsl:value-of select="count(.//s_theory[@s_natural_rights])"/>
                    </attribute>
                </document>
            </xsl:for-each>
        </s_theory_counts>
    </xsl:template> 
  
    
    <!--
    <xsl:template match="/corpus">
        <f_theory_counts>
            <xsl:for-each select="document">
                <document id="{@id}">
                    <attribute name="f_rad_fem">
                        <xsl:value-of select="count(.//f_theory[@f_rad_fem])"/>
                    </attribute>
                    <attribute name="f_terf">
                        <xsl:value-of select="count(.//f_theory[@f_terf])"/>
                    </attribute>
                    <attribute name="f_liberal">
                        <xsl:value-of select="count(.//f_theory[@f_liberal])"/>
                    </attribute>
                    <attribute name="f_antifeminist">
                        <xsl:value-of select="count(.//f_theory[@f_antifeminist])"/>
                    </attribute>
                    <attribute name="f_political_lesbian">
                        <xsl:value-of select="count(.//f_theory[@f_political_lesbian])"/>
                    </attribute>
                    <attribute name="f_enlightenment_individualism">
                        <xsl:value-of select="count(.//f_theory[@f_enlightenment_individualism])"/>
                    </attribute>
                </document>
            </xsl:for-each>
        </f_theory_counts>
    </xsl:template>
    <xsl:template match="/corpus">
        <power_system_counts>
            <xsl:for-each select="document">
                <document id="{@id}">
                    <attribute name="p_patriarchy">
                        <xsl:value-of select="count(.//power_system[@p_patriarchy])"/>
                    </attribute>
                    <attribute name="p_religion">
                        <xsl:value-of select="count(.//power_system[@p_religion])"/>
                    </attribute>
                    <attribute name="p_class">
                        <xsl:value-of select="count(.//power_system[@p_class])"/>
                    </attribute>
                    <attribute name="p_race">
                        <xsl:value-of select="count(.//power_system[@p_race])"/>
                    </attribute>
                    <attribute name="p_political">
                        <xsl:value-of select="count(.//power_system[@p_political])"/>
                    </attribute>
                    <attribute name="p_social">
                        <xsl:value-of select="count(.//power_system[@p_social])"/>
                    </attribute>
                    <attribute name="p_matriarchy">
                        <xsl:value-of select="count(.//power_system[@p_matriarchy])"/>
                    </attribute>
                </document>
            </xsl:for-each>
        </power_system_counts>
    </xsl:template>
    <xsl:template match="/corpus">
        <religion_counts>
            <xsl:for-each select="document">
                <document id="{@id}">
                    <attribute name="r_non_western">
                        <xsl:value-of select="count(.//religion[@r_non_western])"/>
                    </attribute>
                    <attribute name="r_catholicism">
                        <xsl:value-of select="count(.//religion[@r_catholicism])"/>
                    </attribute>
                    <attribute name="r_judaism">
                        <xsl:value-of select="count(.//religion[@r_judaism])"/>
                    </attribute>
                    <attribute name="r_christianity">
                        <xsl:value-of select="count(.//religion[@r_christianity])"/>
                    </attribute>
                    <attribute name="r_greekmyth">
                        <xsl:value-of select="count(.//religion[@r_greekmyth])"/>
                    </attribute>
                    <attribute name="r_quaker">
                        <xsl:value-of select="count(.//religion[@r_quaker])"/>
                    </attribute>
                    <attribute name="r_anglican">
                        <xsl:value-of select="count(.//religion[@r_anglican])"/>
                    </attribute>
                </document>
            </xsl:for-each>
        </religion_counts>
    </xsl:template>
        <xsl:template match="/corpus">
        <class_counts>
            <xsl:for-each select="document">
                <document id="{@id}">
                    <attribute name="social">
                        <xsl:value-of select="count(.//class[@social])"/>
                    </attribute>
                    <attribute name="economic">
                        <xsl:value-of select="count(.//class[@economic])"/>
                    </attribute>
                    <attribute name="working_class">
                        <xsl:value-of select="count(.//class[@working_class])"/>
                    </attribute>
                    <attribute name="middle">
                        <xsl:value-of select="count(.//class[@middle])"/>
                    </attribute>
                    <attribute name="lower">
                        <xsl:value-of select="count(.//class[@lower])"/>
                    </attribute>
                </document>
            </xsl:for-each>
        </class_counts>
    </xsl:template>
    <xsl:template match="/corpus">
        <identity_counts>
            <xsl:for-each select="document">
                <document id="{@id}">
                    <attribute name="race">
                        <xsl:value-of select="count(.//identity[@race])"/>
                    </attribute>
                    <attribute name="sexuality">
                        <xsl:value-of select="count(.//identity[@sexuality])"/>
                    </attribute>
                    <attribute name="gender">
                        <xsl:value-of select="count(.//identity[@gender])"/>
                    </attribute>
                </document>
            </xsl:for-each>
        </identity_counts>
    </xsl:template>
    -->
</xsl:stylesheet>
