<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:variable name="input" select="collection('../xml/Overview_Events/?select=*.xml')"/>
    <xsl:template match="/">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/overviewEvents.html">
        <html>
            <head>
                <title>Overview</title>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width-device-width, initial-scale=1,.0"/>
                <!-- Linked it to the Style Sheet ~Daniel -->
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <div id="wrapper">
                <h1>Overview of Major World Events Effecting JFKs Presidency</h1>
                <xsl:apply-templates select="$input/wrstart"/>
                </div>
            </body>
        </html>
        </xsl:result-document>
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