<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 8 de abril de 2021, 9:50
    Author     : daw1
    Description:
        Purpose of transformation follows.
        Solucion con for
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    
    <xsl:template match="/edificio">
        <html>
            <head>
                <title>XSLT 01 Nombre y apellidos</title>
            </head>
            <body>
                <h1>Informacion de las viviendas</h1>
                <!--<xsl:apply-templates select="vivienda"/>-->
                <div>
                    Numero de viviendas <xsl:value-of select="count(//vivienda)"/>
                </div>
                <div>
                    Numero de vecinos <xsl:value-of select="count(//nombre)"/>
                </div>
                <xsl:for-each select="vivienda">
                <div>
            Piso: <xsl:value-of select="piso"/>
            Puerta: <xsl:value-of select="puerta"/>
            <ol>
                <!--<xsl:apply-templates select="vecinos/nombre"/>-->
                <xsl:for-each select="vecinos/nombre">
                    <li>
                     <xsl:value-of select="current()/text()"/>
                    </li>
                </xsl:for-each>
            </ol>
                </div>
                </xsl:for-each>
            </body>
        </html>
        
    </xsl:template>
   <!-- <xsl:template match="vivienda">
        <div>
            Piso: <xsl:value-of select="piso"/>
            Puerta: <xsl:value-of select="puerta"/>
            <ol>
                <xsl:apply-templates select="vecinos/nombre"/>
            </ol>
        </div>
    </xsl:template>
    <xsl:template match="vecinos/nombre">
        <li>
            <xsl:value-of select="current()/text()"/>
        </li>
       
    </xsl:template>-->
    
</xsl:stylesheet>
