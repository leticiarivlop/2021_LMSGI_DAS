<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 20 de abril de 2021, 13:15
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="horario">
        <html>
            <head>
                <title>XSLT 03 David Aparicio Sir</title>
                <style>
                    table{
                    border-collapse:collapse;
                    width:100%;
                    }
                    th,td{
                    border:1px solid black;
                    padding:2px;
                    }
                </style>

            </head>
            <body>
                <h1>Horarios del curso <xsl:value-of select="@curso"/></h1>
                <table>
                    <tr>
                        <th>Codigo del modulo</th>
                   
                        <th>Nombre del modulo</th>
                    </tr>
                    <xsl:apply-templates select="modulos/modulo"/>
                </table>
                <table>
                    <tr>
                        <th>Codigo del Profesor</th>
                        <th>Nombre del Profesor</th>
                        <xsl:apply-templates select="profesores/profesor"/>
                    </tr>
                </table>
                <table>
                    <tr>
                        <th><xsl:value-of select="hora/dia_sem"/></th>
                       
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="modulos/modulo">
        <tr>
            <td>
                <abbr>
                    <xsl:attribute name="title">
                        <xsl:value-of select="current()/text()"/>
                    </xsl:attribute>
                    <xsl:value-of select="@codM"/>
                </abbr>
            </td>
            <td>
                <xsl:value-of select="current()/text()"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="profesores/profesor">
        <tr>
            <td>
                <abbr>
                    <xsl:attribute name="title">
                        <xsl:value-of select="current()/text()"/>
                    </xsl:attribute>
                    <xsl:value-of select="@codP"/>
                </abbr>
            </td>
            <td>
                <xsl:value-of select="current()/text()"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="grupo/hora">
        <th>
                <xsl:value-of select="concat(@entrada,' - ',@salida)"/>
        </th>
        <td>
            <xsl:value-of select="dia_sem"/>
        </td>
    </xsl:template>
    <xsl:template match="hora/dia_sem">
            <xsl:value-of select="@dia"/>
    </xsl:template>
</xsl:stylesheet>
