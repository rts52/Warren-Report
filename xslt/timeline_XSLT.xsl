<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes" indent="true"/>

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
                        <!-- <a href="index.html"><img src="image/*header image here*"/></a> --><h2>The Warren Project Text Timeline</h2>
                    </header>
                    <nav>
                        <ul>
                            <li><a href="index.html" class="button">Home</a></li>
                            <li>
                                <div class="dropdown">
                                    <button class="dropbtn">Timelines</button>
                                    <div class="dropdown-content">
                                        <a href="textTimline.html">Text</a>
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
                        <h2>Timeline of Events</h2>
                        <!-- Table of Contents Here *Maybe*-->
                        <h3>Overview of Major World Events Affecting JFKs Presidency</h3>
                        <ul><xsl:apply-templates select="$overview/wrstart"/></ul>
                        <h3>John F. Kenedy Timeline</h3>
                        <!--<xsl:apply-templates select="$JFK/*root*"/>-->
                        <h3>Lee Harvey Oswald Timeline</h3>
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
    
    <xsl:template match="overview">
        <li><xsl:apply-templates/></li>
    </xsl:template>

    <xsl:template match="topic">
                <li> <xsl:apply-templates/> </li>
        </xsl:template>  

    <!-- Continuation of above linking ~Daniel-->
    <xsl:template match="date">
        <!-- Probably a better way to do the id here. Oh well. ~Daniel-->
        <!-- There was ~Daniel-->
       <h4 id="{concat(document-uri(),((../date/@daid)!replace(.,'_',''))!replace(.,' ',''),count(preceding::date))}">
            <xsl:apply-templates/>
       </h4>
    </xsl:template>


</xsl:stylesheet>