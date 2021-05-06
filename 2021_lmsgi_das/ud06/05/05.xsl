<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05.xsl
    Created on : 4 de mayo de 2021, 18:44
    Author     : PC
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" />

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>05.xsl</title>
            </head>
            <body>
                <table>
                    <tr id="num">
                        <th> FACTURA NÚMERO <xsl:apply-templates select="factura"/> </th>
                    </tr>
                    <tr>
                        <TH class="cabecera">DATOS EMISOR</TH>
                    </tr>
                        <tr>
                        <td>
                            <b>RAZÓN SOCIAL:</b> 
                            <xsl:apply-templates select="factura/datos_emisor"/>
                        </td>
                        <td>
                            <b>NIF/CIF:</b>
                            <xsl:value-of select="factura/datos_emisor/cif"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>DIRECCIÓN:</b>
                        </td>
                        <td>
                            <xsl:value-of select="factura/datos_emisor/dir"/> <br/>
                            <xsl:value-of select="factura/datos_emisor/poblacion"/><br/>
                            <xsl:value-of select="factura/datos_emisor/poblacion/@cod_postal"/><br/>
                            <xsl:value-of select="factura/datos_emisor/provincia"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <b>DATOS DE CONTACTO</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>TELÉFONO:</b> <xsl:value-of select="factura/datos_emisor/tefefono"/>
                        </td>
                        <td>
                            <b>FAX:</b><xsl:value-of select="factura/datos_emisor/fax"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="cabecera">DATOS RECEPTOR</th>
                    </tr>
                    <TR>
                        <td>
                             <b>
                              Num Cliente:
                            </b>
                            <xsl:apply-templates select="factura/datos_receptor"/>
                        </td>
                    </TR>
                    <tr>
                        <td>
                            <b>DIRECCIÓN:</b>
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
                        <th class="cabecera"> RESUMEN FACTURA</th>
                    </tr>
                    <xsl:apply-templates select="datos_factura"/>
                    
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="factura">
            <xsl:value-of select="@n_factura"/>
    </xsl:template>
    <xsl:template match="factura/datos_emisor">
        <xsl:value-of select="nombre"/>
    </xsl:template>
    <xsl:template match="factura/datos_receptor">
        <xsl:value-of select="@n_cli"/>
    </xsl:template>
    
</xsl:stylesheet>
