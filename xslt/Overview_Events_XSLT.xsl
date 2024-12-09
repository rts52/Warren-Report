<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    

    <xsl:variable name="overview" select="collection('../xml/Overview_Events/?select=*.xml')"/>
    <!--<xsl:variable name="JFK" select="collection('../xml/JFK/?select=*.xml')"/>-->
    <!--<xsl:variable name="LHO" select="collection('../xml/LHO/?select=*.xml')"/>-->

    <xsl:template match="/">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/textTimeline.html">
        <html>
            <head>
                <title>Text</title>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width-device-width, initial-scale=1,.0"/>
                <link rel="icon" type="image/x-icon" href="favicon.jpg"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <div id="wrapper">
                    <header>
                        <!-- <a href="index.html"><img src="image/*header image here*"/></a> --><h2>The Warren Project</h2>
                    </header>
                    <nav>
                        <ul>
                            <li><a href="index.html" class="button">Home</a></li>
                            <li>
                                <div class="dropdown">
                                    <button class="dropbtn">Timelines</button>
                                    <div class="dropdown-content">
                                        <a href="overviewEvents.html">Text</a>
                                        <a href="timeline.html">Graphical</a>
                                    </div>
                                </div>
                            </li>
                            <!--<li><a href="about.html" class="button">About</a></li>-->
                            <li><a href="members.html" class="button">Members</a></li>
                            <li><a href="Sources.html" class="button">Sources</a></li>
                        </ul>
                    </nav>
                    <main>
                        <h1>Overview of Major World Events Affecting JFKs Presidency</h1>
                        <xsl:apply-templates select="$overview/wrstart"/>
                        <h1>John F. Kenedy Timeline</h1>
                        <!--<xsl:apply-templates select="$JFK/*root*"/>-->
                        <h1>Lee Harvey Oswald Timeline</h1>
                        <!--<xsl:apply-templates select="$LHO/*root*"/>-->
                    </main>
                    <footer>
                        <!-- <img src="image/"></img> --><h6>Placeholder for CC Copyright Designation<br/>Project of UPG Digital Humanities Class Fall 2024</h6>
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
        <h4 id="{(../date)!replace(.,'_','')}">
            <xsl:apply-templates/>
        </h4>
    </xsl:template>


</xsl:stylesheet>