<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <!-- Match the root element to begin HTML structure -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Document Transformation</title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    .person { color: blue; font-weight: bold; }
                    .date { color: green; font-style: italic; }
                    .place { color: darkred; text-decoration: underline; }
                    .page { color: gray; font-size: small; }
                    .text { margin-bottom: 1em; }
                </style>
            </head>
            <body>
                <h1>Part 1 of the Warren Commission's Report Appendix 13</h1>
                <!-- Apply templates to each <text> element -->
                <xsl:apply-templates select="root/text"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template for <text> element, matched since they are direct children of <root> -->
    <xsl:template match="text">
        <div class="text">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Template for <person> -->
    <xsl:template match="person">
        <span class="person">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
    <!-- Template for <date> -->
    <xsl:template match="date">
        <span class="date">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
    <!-- Template for <place> -->
    <xsl:template match="place">
        <span class="place">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
    <!-- Template for <page> -->
    <xsl:template match="page">
        <div class="page">
            <xsl:value-of select="@pageNumber"/> - <xsl:value-of select="."/>
        </div>
    </xsl:template>
    
    <!-- Template for processing text nodes -->
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
</xsl:stylesheet>