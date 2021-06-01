<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:include href="../lib/web.xsl"/>
    <xsl:template match="/">
        <xsl:call-template name="docTipo"/>
        <html>
            <head>
                
                <xsl:call-template name="web">
                    <xsl:with-param name="titulo" select="concat('David Aparicio horoscopo')"/>
                    <xsl:with-param name="descripcion" select="'Programa de la universidad Victoria'"/>
                    <xsl:with-param name="css" select="'css/estilos.css'"/>
                </xsl:call-template>
            </head>
            <body>
                <h1>HORÓSCOPO/SIGNOS DEL ZODÍACO</h1>
                <xsl:apply-templates select="horoscopo"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="horoscopo">
        <xsl:for-each select="./signo">
            <table>
                <tr>
                    <td>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat('horoscopo/',nombre,'/horoscopo.xml')"/>
                            </xsl:attribute>
                            <xsl:call-template name="images"/>
                        </xsl:element>
                        <p><xsl:value-of select="./nombre"/></p>
                        <p class="fecha"><xsl:value-of select="./fecha"/></p>
                    </td>
                </tr>
            </table>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="images">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="concat('images/',@id,'.svg')"/>
            </xsl:attribute>
            <xsl:attribute name="style">
                background-image:url('<xsl:value-of select="concat('images/bg-',@id,'.jpg')"/>')
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
    </xsl:template>
</xsl:stylesheet>