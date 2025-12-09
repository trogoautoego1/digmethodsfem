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
                <div class="checkboxList">
                    <h3>Power Systems</h3>
                    <label class="container">Patriarchy<input type="checkbox" data-category="power" data-subcategory="patriarchy"/></label>
                    <label class="container">Religion<input type="checkbox" data-category="power" data-subcategory="religion"/></label>
                    <label class="container">Class<input type="checkbox" data-category="power" data-subcategory="class"/></label>
                    <label class="container">Race<input type="checkbox" data-category="power" data-subcategory="race"/></label>
                    <label class="container">Political<input type="checkbox" data-category="power" data-subcategory="political"/></label>
                    <label class="container">Social<input type="checkbox" data-category="power" data-subcategory="social"/></label>
                    <label class="container">Matriarchy<input type="checkbox" data-category="power" data-subcategory="matriarchy"/></label>
                    <h3>Religion</h3>
                    <label class="container">Non-Western<input type="checkbox" data-category="religion" data-subcategory="non_western"/></label>
                    <label class="container">Islam<input type="checkbox" data-category="religion" data-subcategory="islam"/></label>
                    <label class="container">Protestantism<input type="checkbox" data-category="religion" data-subcategory="protestantism"/></label>
                    <label class="container">Catholicism<input type="checkbox" data-category="religion" data-subcategory="catholicism"/></label>
                    <label class="container">Judaism<input type="checkbox" data-category="religion" data-subcategory="judaism"/></label>
                    <label class="container">Indigenous<input type="checkbox" data-category="religion" data-subcategory="indigenous"/></label>
                    <label class="container">Christianity<input type="checkbox" data-category="religion" data-subcategory="christianity"/></label>
                    <label class="container">Greek Mythology<input type="checkbox" data-category="religion" data-subcategory="greekmyth"/></label>
                    <label class="container">Quaker<input type="checkbox" data-category="religion" data-subcategory="quaker"/></label>
                    <label class="container">Anglican<input type="checkbox" data-category="religion" data-subcategory="anglican"/></label>
                    <h3>Identity</h3>
                    <label class="container">Race<input type="checkbox" data-category="identity" data-subcategory="race"/></label>
                    <label class="container">Sexuality<input type="checkbox" data-category="identity" data-subcategory="sexuality"/></label>
                    <label class="container">Gender<input type="checkbox" data-category="identity" data-subcategory="gender"/></label>
                    <label class="container">Nationality<input type="checkbox" data-category="identity" data-subcategory="nationality"/></label>
                    <h3>Feminist Theory</h3>
                    <label class="container">Marxist<input type="checkbox" data-category="fem" data-subcategory="marxist"/></label>
                    <label class="container">Radfem<input type="checkbox" data-category="fem" data-subcategory="rad_fem"/></label>
                    <label class="container">Terf<input type="checkbox" data-category="fem" data-subcategory="terf"/></label>
                    <label class="container">Liberal<input type="checkbox" data-category="fem" data-subcategory="liberal"/></label>
                    <label class="container">Praxis<input type="checkbox" data-category="fem" data-subcategory="praxis"/></label>
                    <label class="container">Antifeminist<input type="checkbox" data-category="fem" data-subcategory="antifeminist"/></label>
                    <label class="container">Political Lesbian<input type="checkbox" data-category="fem" data-subcategory="political_lesbian"/></label>
                    <label class="container">Abolitionist<input type="checkbox" data-category="fem" data-subcategory="abolitionist"/></label>
                    <label class="container">Enlightenment Individualism<input type="checkbox" data-category="fem" data-subcategory="enlightenment_individualism"/></label>
                    <h3>Social Theory</h3>
                    <label class="container">Freud<input type="checkbox" data-category="social" data-subcategory="freud"/></label>
                    <label class="container">Rights of Man<input type="checkbox" data-category="social" data-subcategory="rights_of_man"/></label>
                    <label class="container">Enlightenment Individualism<input type="checkbox" data-category="social" data-subcategory="enlightenment"/></label>
                    <label class="container">Natural Rights<input type="checkbox" data-category="social" data-subcategory="natural_rights"/></label>
                </div>
                <script>
                    <xsl:text>
                    // Function to get all checked subcategories for a given category
                    function getCheckedSubcategories(category) {
                    const checkboxes = document.querySelectorAll(`input[data-category="${category}"]:checked`);
                    return Array.from(checkboxes).map(cb => cb.dataset.subcategory);
                    }
                    
                    // Function to check if any checkbox in a category is checked
                    function isCategoryActive(category) {
                    const checkboxes = document.querySelectorAll(`input[data-category="${category}"]`);
                    return Array.from(checkboxes).some(cb => cb.checked);
                    }
                    
                    // Function to update tooltip visibility
                    function updateTooltips() {
                    // Define mapping of categories to tooltip classes and their prefixes
                    const categories = {
                    'fem': { class: 'fem-tooltip', prefix: 'f_' },
                    'power': { class: 'power-tooltip', prefix: 'p_' },
                    'social': { class: 'social-tooltip', prefix: 's_' },
                    'religion': { class: 'religion-tooltip', prefix: 'r_' },
                    'identity': { class: 'identity-tooltip', prefix: '' },
                    'class': { class: 'class-tooltip', prefix: '' }
                    };
                    
                    // For each category, show/hide corresponding tooltips
                    Object.keys(categories).forEach(category => {
                    const tooltipClass = categories[category].class;
                    const prefix = categories[category].prefix;
                    const tooltips = document.querySelectorAll(`.${tooltipClass}`);
                    const checkedSubcategories = getCheckedSubcategories(category);
                    
                    tooltips.forEach(tooltip => {
                    // If no checkboxes in this category are checked, hide the tooltip
                    if (checkedSubcategories.length === 0) {
                    tooltip.classList.add('tooltip-hidden');
                    } else {
                    // Check if tooltip has any of the checked subcategories
                    const tooltipSubcategories = tooltip.dataset.subcategories 
                    ? tooltip.dataset.subcategories.split(',') 
                    : [];
                    
                    // Show tooltip if it has any of the checked subcategories
                    const hasMatch = checkedSubcategories.some(subcategory => 
                    tooltipSubcategories.includes(prefix + subcategory)
                    );
                    
                    if (hasMatch) {
                    tooltip.classList.remove('tooltip-hidden');
                    } else {
                    tooltip.classList.add('tooltip-hidden');
                    }
                    }
                    });
                    });
                    }
                    
                    // Initialize when page loads
                    document.addEventListener('DOMContentLoaded', function() {
                    // Add event listeners to all checkboxes
                    const allCheckboxes = document.querySelectorAll('input[type="checkbox"][data-category]');
                    allCheckboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', updateTooltips);
                    });
                    
                    // Hide all tooltips initially
                    updateTooltips();
                    });
                    </xsl:text>
                </script>
                <h1>
                    <xsl:value-of select="(//title)[1]"/>
                </h1>
                <span style="font-style: italic; text-align: center; margin: 15px 200px;">
                    By <xsl:value-of select="//author"/> (<xsl:value-of select="//publication_date"/>)
                </span>
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
            <xsl:attribute name="data-subcategories">
                <xsl:value-of select="string-join(
                    for $attr in @* return name($attr), ','
                    )"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <!-- Only output tooltiptext if the attribute exists -->
            <xsl:if test="@p_patriarchy">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@p_patriarchy"/>
                </span>
            </xsl:if>
            <xsl:if test="@p_social">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@p_social"/>
                </span>
            </xsl:if>
            <xsl:if test="@p_religion">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@p_religion"/>
                </span>
            </xsl:if>
            <xsl:if test="@p_class">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@p_class"/>
                </span>
            </xsl:if>
            <xsl:if test="@p_matriarchy">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@p_matriarchy"/>
                </span>
            </xsl:if>
            <xsl:if test="@p_political">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@p_political"/>
                </span>
            </xsl:if>
            <xsl:if test="@p_race">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@p_race"/>
                </span>
            </xsl:if>
        </span> 
    </xsl:template>
    
<!-- feminist theory match and tag -->     
    <xsl:template match="f_theory">
        <span class="tooltip fem-tooltip">
            <xsl:attribute name="data-subcategories">
                <xsl:value-of select="string-join(
                    for $attr in @* return name($attr), ','
                    )"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <xsl:if test="@f_marxist">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@f_marxist"/>
                </span>
            </xsl:if>
            <xsl:if test="@f_rad_fem">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@f_rad_fem"/>
                </span>
            </xsl:if>
            <xsl:if test="@f_terf">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@f_terf"/>
                </span>
            </xsl:if>
            <xsl:if test="@f_liberal">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@f_liberal"/>
                </span>
            </xsl:if>
            <xsl:if test="@f_praxis">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@f_praxis"/>
                </span>
            </xsl:if>
            <xsl:if test="@f_political_lesbian">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@f_political_lesbian"/>
                </span>
            </xsl:if>
            <xsl:if test="@f_abolitionist">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@f_abolitionist"/>
                </span>
            </xsl:if>
            <xsl:if test="@f_enlightenment_individualism">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@f_enlightenment_individualism"/>
                </span>
            </xsl:if>
            <xsl:if test="@f_antifeminist">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@f_antifeminist"/>
                </span>
            </xsl:if>
        </span> 
    </xsl:template>
    
<!-- religion match and tag -->     
    <xsl:template match="religion">
        <span class="tooltip religion-tooltip">
            <xsl:attribute name="data-subcategories">
                <xsl:value-of select="string-join(
                    for $attr in @* return name($attr), ','
                    )"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <xsl:if test="@r_christianity">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_christianity"/>
                </span>
            </xsl:if>
            <xsl:if test="@r_non_western">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_non_western"/>
                </span>
            </xsl:if>
            <xsl:if test="@r_islam">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_islam"/>
                </span>
            </xsl:if>
            <xsl:if test="@r_protestentism">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_protestentism"/>
                </span>
            </xsl:if>
            <xsl:if test="@r_catholicism">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_catholicism"/>
                </span>
            </xsl:if>
            <xsl:if test="@r_judaism">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_judaism"/>
                </span>
            </xsl:if>
            <xsl:if test="@r_indigenous">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_indigenous"/>
                </span>
            </xsl:if>
            <xsl:if test="@r_greekmyth">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_greekmyth"/>
                </span>
            </xsl:if>
            <xsl:if test="@r_quaker">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_quaker"/>
                </span>
            </xsl:if>
            <xsl:if test="@r_anglican">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@r_anglican"/>
                </span>
            </xsl:if>
        </span> 
    </xsl:template>
    
<!-- class match and tag -->      
    <xsl:template match="class">
        <span class="tooltip class-tooltip">
            <xsl:attribute name="data-subcategories">
                <xsl:value-of select="string-join(
                    for $attr in @* return name($attr), ','
                    )"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <xsl:if test="@social">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@social"/>
                </span>
            </xsl:if>
            <xsl:if test="@political">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@political"/>
                </span>
            </xsl:if>
            <xsl:if test="@economic">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@economic"/>
                </span>
            </xsl:if>
            <xsl:if test="@working_class">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@working_class"/>
                </span>
            </xsl:if>
            <xsl:if test="@wealthy">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@wealthy"/>
                </span>
            </xsl:if>
            <xsl:if test="@middle">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@middle"/>
                </span>
            </xsl:if>
            <xsl:if test="@lower">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@lower"/>
                </span>
            </xsl:if>
        </span> 
    </xsl:template>

<!-- identity match and tag -->      
    <xsl:template match="identity">
        <span class="tooltip identity-tooltip">
            <xsl:attribute name="data-subcategories">
                <xsl:value-of select="string-join(
                    for $attr in @* return name($attr), ','
                    )"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <xsl:if test="@race">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@race"/>
                </span>
            </xsl:if>
            <xsl:if test="@sexuality">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@sexuality"/>
                </span>
            </xsl:if>
            <xsl:if test="@gender">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@gender"/>
                </span>
            </xsl:if>
            <xsl:if test="@nationality">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@nationality"/>
                </span>
            </xsl:if>
        </span> 
    </xsl:template>
    
    
<!-- social theory match and tag -->      
    <xsl:template match="s_theory">
        <span class="tooltip social-tooltip">
            <xsl:attribute name="data-subcategories">
                <xsl:value-of select="string-join(
                    for $attr in @* return name($attr), ','
                    )"/>
            </xsl:attribute>
            <xsl:apply-templates/>
            <xsl:if test="@s_freud">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@s_freud"/>
                </span>
            </xsl:if>
            <xsl:if test="@s_rights_of_man">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@s_rights_of_man"/>
                </span>
            </xsl:if>
            <xsl:if test="@s_enlightenment">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@s_enlightenment"/>
                </span>
            </xsl:if>
            <xsl:if test="@s_natural_rights">
                <span class="tooltiptext" role="tooltip">
                    <xsl:value-of select="@s_natural_rights"/>
                </span>
            </xsl:if>
        </span> 
    </xsl:template>
</xsl:stylesheet>