<?xml version="1.0" encoding="UTF-8"?>
<!-- Stopping here as I have a few questions, like if it's possible to sort the contents of entire XML documents through XPath ~Daniel -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:variable name="input" select="collection('../xml/Overview_Events/?select=*.xml')"/>
    <xsl:template match="/">
        <!--First attempt of multi-.xml to single .html file creation ~Daniel-->
                                    <!--What is this supposed to do? Context? What goes in href? ~Daniel -->
        <!--<xsl:result-document method="xhtml" indent="yes" href="../docs/overviewEvents.html">-->
        <html>
            <head>
                <title>Overview</title>
                <!-- Linked it to the Style Sheet ~Daniel -->
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1>Overview of Major World Events Effecting JFKs Presidency</h1>
                <xsl:apply-templates select="$input/wrstart"/>
            </body>
        </html>
        <!--</xsl:result-document>-->
    </xsl:template>    

    <xsl:template match="topic">
            <ul> 
                <li> <xsl:apply-templates/> </li>
            </ul>    
        </xsl:template>  

    <!-- Continuation of above linking ~Daniel-->
    <xsl:template match="date">
        <!-- Probably a better way to do the id here. Oh well. ~Daniel-->
        <h4 id="{(../date)!replace(.,' ','')}">
            <xsl:apply-templates/>
        </h4>
    </xsl:template>


</xsl:stylesheet>