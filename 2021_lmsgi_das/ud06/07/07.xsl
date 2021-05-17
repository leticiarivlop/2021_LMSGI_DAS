<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 07.xsl
    Created on : 11 de mayo de 2021, 12:37
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="corregido" select="'no'"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>07.xsl <xsl:value-of select="//nombreModulo"/></title>
                <link href="07.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <h1>
                    <xsl:value-of select="//nombreCiclo"/>
                </h1>
                <h1>
                    <xsl:value-of select="document('1DawModulos.xml')//modulo[@codM=current()//nombreModulo]/text()"/>
                </h1>
                <h1> 
                    <xsl:value-of select="concat('Fecha:',//dia,' de ',document('meses.xml')//mes[@id=current()//mes]/text(),' de ',//anyo)"/>
                </h1>
                <form action="test.php" method="get">
                    <xsl:apply-templates select="//pregunta"/>   
                    <xsl:if test="$corregido='si'">
                        <div id="botones">
                            <input type="submit" value="Enviar"/>
                            <input type="reset" value="Borrar"/>
                        </div>
                    </xsl:if>
                </form>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="pregunta">
        <fieldset>
            <xsl:value-of select="concat(@id,'.-',enunciado)"/>
            <xsl:apply-templates select="respuestas/respuesta"/>
        </fieldset>
    </xsl:template>
    <xsl:template match="respuestas/respuesta">
        <div class="respuesta">
            
            <input type="radio" class="respuestas">
                <xsl:attribute name="name">
                    <xsl:value-of select="concat('p',../../@id)"/>
                </xsl:attribute>
                <xsl:attribute name="value">
                    <xsl:value-of select="position()"/>
                </xsl:attribute>
                
                    <xsl:if test="$corregido='si'">
                        <xsl:attribute name="disabled"/>
                        <xsl:if test="@correcta='correcta'">
                            <xsl:attribute name="checked"/>
                        </xsl:if>
                    </xsl:if>
               
            </input>
            <label> 
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('id',../../@id,position())"/>
                </xsl:attribute>
                <xsl:value-of select="current()"/> 
            </label>
        </div>
    </xsl:template>
</xsl:stylesheet>
