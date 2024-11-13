<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
<xsl:template match="/">

    <html>
        <head>
            <title>Cuban Missile Crisis Overview</title>
        </head>
        <body>
            <h1>Cuban Missile Crisis Overview</h1>
            <xsl:apply-templates/>
        </body>
    </html>
    
</xsl:template>
    
    <xsl:template match="topic">  
    <ul> 
        <li> <xsl:apply-templates/> </li>
    </ul>
        
</xsl:template>
    
    <!--Daniel helped--> 
        
</xsl:stylesheet>