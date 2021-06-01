<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : web.xsl
    Created on : 18 de mayo de 2021, 13:02
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
 <xsl:template name="web">
     <xsl:param name="titulo"/>
     <xsl:param name="descripcion"/>
     <xsl:param name="css"/>
        <meta name="author" content="David Aparicio Sir"/>  
        <meta name="application-name" content="Web de Lenguaje de Marcas"/>
        <meta name="description">
            <xsl:attribute name="content">
                <xsl:value-of select="$descripcion"/>
            </xsl:attribute>
        </meta>
        <meta name="keywords" content="lmsgi,,xsd,dtd,xslt,xml"/>  
        <meta name="robots" content="index, follow"/>
        <link  rel="icon"  href="../../ud02/images/favicon.ico" type="image/png" />
        <link rel="stylesheet" type="text/css" >
            <xsl:attribute name="href">
                <xsl:value-of select="$css"/>
            </xsl:attribute>
        </link>
        <title><xsl:value-of select="$titulo"/></title>
    </xsl:template>
     <xsl:template name="docTipo">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE htm&gt;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
