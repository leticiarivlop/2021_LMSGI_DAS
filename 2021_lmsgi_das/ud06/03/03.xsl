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
            </head>
            <body>
                <h1 style="text-align:center">Horarios del curso <xsl:value-of select="@curso"/></h1>
                <!--Tabla modulos-->
                <h2 style="text-align:center">Tabla Modulos</h2>
                <table>
                    <tr>
                        <th>Codigo del modulo</th>
                   
                        <th>Nombre del modulo</th>
                    </tr>
                    <xsl:apply-templates select="modulos/modulo">
                        <xsl:sort select="@codM"/>
                    </xsl:apply-templates>
                </table>
                <h2 style="text-align:center">Tabla Profesores</h2>
                <!--Tabla profesores-->
                <table>
                    <tr>
                        <th>Codigo del Profesor</th>
                        <th>Nombre del Profesor</th>
                        <xsl:apply-templates select="profesores/profesor">
                            <xsl:sort select="@codP"/>
                        </xsl:apply-templates>
                    </tr>
                </table>
                <h2 style="text-align:center">Horario</h2>
                <table>
                    <tr>
                        <th></th>
                        <th>Lunes</th>
                        <th>Martes</th>
                        <th>Miercoles</th>
                        <th>Jueves</th>
                        <th>Viernes</th>
                    </tr>
                    <xsl:apply-templates select="grupo/hora"/>
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
        <tr>
            <th>
                <xsl:value-of select="concat(@entrada,'-',@salida)"/>
            </th>
            <xsl:apply-templates select="dia_sem"/>
        </tr>
    </xsl:template>
    <xsl:template match="dia_sem">
        <td>
            <xsl:attribute name="rowspan">
                <xsl:value-of select="@num"/>
            </xsl:attribute>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select="//modulos/modulo[@codM=current()]/text()"/>
                </xsl:attribute>
                <xsl:value-of select="current()/text()"/>
            </abbr>
            <br/>
            
                
            <xsl:value-of select="//asignatura[@codM=current()]/@codProfesor"/>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:apply-templates select="//profesores/profesor[contains($listaProfesores,@codP)]"/>
                </xsl:attribute>
                <xsl:variable name="listaProfesores" select="//asignatura[@codM=current()]/@codProfesor">
                    <xsl:value-of select="$listaProfesores"/>
                </xsl:variable>
            </abbr>
            
        </td>
    </xsl:template>
    <xsl:template match="profesor" mode="xxx">
        <xsl:if test="position()!=1">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:value-of select="text()"/>
    </xsl:template>
</xsl:stylesheet>
