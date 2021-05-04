<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 06.xsl
    Created on : 4 de mayo de 2021, 13:14
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" />
    
l:stylesheet>    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
            <!--
            <xsl:apply-templates select="@* | node()"/> -->
        </xsl:element>
    </xsl:template>

 

    <xsl:template match="@*">
        <xsl:choose>
            <xsl:when test="current()='04.xsd'">
                <xsl:text>Prueba</xsl:text>
            </xsl:when>
            <xsl:when test="current()='http://www.w3.org/2001/XMLSchema-instance'">
                <xsl:text>Prueba2</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{local-name()}">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        
        
    </xsl:template>

 

    <xsl:template match="text()">
        <xsl:value-of select="."/>
        <!-- <xsl:copy/> -->
    </xsl:template>
</xsl:stylesheet>
