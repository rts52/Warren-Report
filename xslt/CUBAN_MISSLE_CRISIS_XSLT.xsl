<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <!-- Was also going to make it bulk grab and process all .xml, but we would just have to re-write for when Dylan sorts out the Schema. ~Daniel-->
    <xsl:template match="/">
        <html>
            <head>
                <title>Cuban Missile Crisis Overview</title>
                <!-- Linked it to the Style Sheet ~Daniel -->
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <!-- Added @id for future timeline linking ~Daniel -->
                <h1 id="{(//overview/date)!replace(.,' ','')}">Cuban Missile Crisis Overview</h1>
                <xsl:apply-templates/>
            </body>
        </html>
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

<!-- Ryan Helped -->

</xsl:stylesheet>