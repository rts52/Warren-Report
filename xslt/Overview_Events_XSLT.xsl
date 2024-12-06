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
                    <header>
                        <!-- <a href="index.html"><img src="image/*header image here*"/></a> --><h2>The Warren Project</h2>
                    </header>
                    <nav>
                            <ul>
                                <!--<li><a href="index.html">Timelines</a></li>-->
                                <!-- <li><a href="">Graphical</a></li> -->
                                <li><a href="overviewEvents.html">Events</a></li>
                                <li><a href="">Kennedy</a></li>
                                <li><a href="">Oswald</a></li>
                                <!-- Above will be merged into one hover/dropdown link when I figuire out how to do that-->
                                <li><a href="about.html">About</a></li>
                                <li><a href="members.html">Members</a></li>
                            </ul>
                    </nav>
                    <main>
                <h1>Overview of Major World Events Affecting JFKs Presidency</h1>
                <xsl:apply-templates select="$input/wrstart"/>
                    </main>
                    <footer>
                        <h6>Placeholder footer <br/> Project of UPG Digital Humanities Class Fall 2024</h6>
                    </footer>
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