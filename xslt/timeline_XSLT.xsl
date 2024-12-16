<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes" indent="true"/>

    <xsl:variable name="overview" select="collection('../xml/Overview_Events/?select=*.xml')"/>
    <xsl:variable name="WR" select="collection('../xml/Warren-Report/?select=*.xml')"/>
    
    <xsl:variable name="ch5" select="document('../xml/Warren-Report/WarrenChapter5.xml')"/>
    <xsl:variable name="ch7" select="document('../xml/Warren-Report/Warren_Report_Chapter_7.xml')"/>
    <xsl:variable name="LHO1" select="document('../xml/Warren-Report/LHObiopt1.xml')"/>
    <xsl:variable name="LHO2" select="document('../xml/Warren-Report/LHOBioPt2.xml')"/>
    
    <!--<xsl:variable name="BoP" select="document('../xml/Overview_Events/Bay_Of_Pigs.xml')"/>
    <xsl:variable name="Campa1960" select="document('../xml/Overview_Events/Campaign_1960.xml')"/>
    <xsl:variable name="CW" select="document('../xml/Overview_Events/Cold_War.xml')"/>
    <xsl:variable name="CMC" select="document('../xml/Overview_Events/Cuban_Missle_Crisis.xml')"/>
    <xsl:variable name="KA" select="document('../xml/Overview_Events/Kennedy_Assassination.xml')"/>-->
    
    <!-- 
    <xsl:variable name="items" select="(
          $BoP//overview[date[1]] | $BoP//overview/*[.//date[1]] | $BoP//topic[date[1]] | $BoP//topic/*[.//date[1]]
        | $CW//topic/post_war_ii_tensions/*[.//date[1]] | $CW//action[date[1]]
        | $CW//asia/*[.//date[1]] | $CW//korean_war/*[.//date[1]] | $CW//vietnam_war/*[.//date[1]]
        | $CW//cuba/*[.//date[1]] | $CW//topic/*[./date[1]] | $CW//peace_initiatives/*[.//date[1]]
        | $CW//limited_nuclear_test_ban_treaty[date[1]] | $CW//hotline[date[1]]
        | $CW//us_commitment[date[1]] | $CW//escalation[date[1]]
        | $Campa1960//overview/*[.//date[1]] |$Campa1960//topic[date[1]]
        | $Campa1960//topic/*[.//date[1]] | $Campa1960//topic/*/*[.//date[1]]/..
        | $CMC//overview[date[1]] | $CMC//overview/*[.//date[1]]
        | $CMC//topic[date[1]] | $CMC//topic/*[.//date[1]]
        | $KA/topic[date[1]] | $KA//topic/*[.//date[1]]
        )"/>
    -->
    
    <xsl:template match="/">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/textTimeline.html">
        <html>
            <head>
                <title>Timeline</title>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width-device-width, initial-scale=1,.0"/>
                <link rel="icon" type="image/x-icon" href="favicon.jpg"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <div id="wrapper">
                    <header>
                        <h1>Timeline</h1>
                    </header>
                    <nav>
                        <ul>
                            <li><a href="index.html" class="button">Home</a></li>
                            <li>
                                <div class="dropdown">
                                    <button class="dropbtn">Timelines</button>
                                    <div class="dropdown-content">
                                        <a href="textTimeline.html">Text</a>
                                        <a href="timeline.html">Graphical</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="dropdown">
                                    <button class="dropbtn">Team</button>
                                    <div class="dropdown-content">
                                        <a href="members.html" class="button">Members</a>
                                        <a href="contributions.html">Contributions</a>
                                    </div>
                                </div>
                            </li>
                            <li><a href="sources.html" class="button">Sources</a></li>
                        </ul>
                    </nav>
                    <main>
                        <h2>Timeline of Events</h2>
                        <!-- Table of Contents Here *Maybe*-->
                        <h3>Overview of Major World Events Affecting JFKs Presidency</h3>
                        <!--<ul><xsl:apply-templates select="$overview/wrstart" mode="overview"/></ul> -->
                        <ul>
                            <xsl:for-each select="$overview//topic">
                                <xsl:sort select="((date[1]/@daid[1])!replace(.,'_','')!replace(.,' ',''))"/>
                                <li><xsl:apply-templates/></li>
                            </xsl:for-each> 
                        </ul>
                        <h3>The Warren Commision Report</h3>
                        <h4 id="ch5">Chapter 5</h4>
                        <xsl:apply-templates select="$ch5/wrstart"/>
                        <h4 id="ch7">Chapter 7</h4>
                        <xsl:apply-templates select="$ch7/wrstart"/>
                        <h4 id="A13">Appendix 13</h4>
                        <xsl:apply-templates select="$LHO1/wrstart"/>
                        <xsl:apply-templates select="$LHO2/wrstart"/>
                    </main>
                    <footer>
                        <p xmlns:cc="http://creativecommons.org/ns#" 
                           xmlns:dct="http://purl.org/dc/terms/">
                            <a property="dct:title" rel="cc:attributionURL" 
                               href="https://rts52.github.io/Warren-Report/index.html">
                                The Warren Project
                            </a> by 
                            <span property="cc:attributionName">
                                UPG Digital Humanities Class, Fall 2024
                            </span>is licensed under 
                            <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1" 
                               target="_blank" rel="license noopener noreferrer" 
                               style="display:inline-block;">
                                CC BY-NC-SA 4.0
                                <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" 
                                     src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt=""/>
                                <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" 
                                     src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" alt=""/>
                                <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" 
                                     src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1" alt=""/>
                                <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" 
                                     src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1" alt=""/>
                            </a>
                        </p>
                        <a href="https://github.com/rts52/Warren-Report">Click here to see our GitHub Repo</a>
                    </footer>
                </div>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>

    
    <xsl:template match="$overview/wrstart//date[1]">
        <h4 id="{concat((tokenize(base-uri(.),'/'))[last()],((../date/@daid)!replace(.,'_',''))!replace(.,' ',''),count(preceding::date))}">
            <xsl:apply-templates/>
       </h4>
    </xsl:template>

    <xsl:template match="$WR/wrstart//date[1]">
        <h4 id="{concat((tokenize(base-uri(.),'/'))[last()],((/@daid)!replace(.,'_',''))!replace(.,' ',''),count(preceding::date))}">
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    
    <xsl:template match="page">
        <br/>
        <b>[<xsl:apply-templates/>]</b>
        <br/>
    </xsl:template>
    
    <xsl:template match="texts">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="qoute">
        &quot;<xsl:apply-templates/>&quot;
    </xsl:template>

</xsl:stylesheet>

<!-- THEY'RE COMING TO TAKE ME AWAY HAHAA! THEY'RE COMING TO TAKE ME AWAY HAHAA! 
     THOSE NICE YOUNG MEN WITH THE CLEAN WHITE COATS AND THEY'RE COMING TO TAKE ME AWAY HAHAA! 
     ~Daniel                                                                                 -->