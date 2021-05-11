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
                <link href="05.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <table>
                    <tr id="num">
                        <th colspan="3"> FACTURA NÚMERO <xsl:apply-templates select="factura"/> </th>
                    </tr>
                    <tr>
                        <TH class="cabecera" colspan="3">DATOS EMISOR</TH>
                    </tr>
                    <tr>
                        <td colspan="2">
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
                        <td colspan="2">
                            <xsl:value-of select="factura/datos_emisor/dir"/> 
                            <br/>
                            <xsl:value-of select="factura/datos_emisor/poblacion"/>
                            <br/>
                            <xsl:value-of select="factura/datos_emisor/poblacion/@cod_postal"/>
                            <br/>
                            <xsl:value-of select="factura/datos_emisor/provincia"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <b>DATOS DE CONTACTO</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>TELÉFONO:</b> 
                            <xsl:value-of select="factura/datos_emisor/tefefono"/>
                        </td>
                        <td colspan="2">
                            <b>FAX:</b>
                            <xsl:value-of select="factura/datos_emisor/fax"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="cabecera" colspan="3">DATOS RECEPTOR</th>
                    </tr>
                    <TR>
                        <td colspan="3">
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
                        <td colspan="2">
                            <xsl:value-of select="factura/datos_receptor/dir_env"/> 
                            <br/>
                            <xsl:value-of select="factura/datos_receptor/poblacion"/>
                            <br/>
                            <xsl:value-of select="factura/datos_receptor/poblacion/@cod_postal"/>
                            <br/>
                            <xsl:value-of select="factura/datos_receptor/provincia"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="cabecera" colspan="3"> RESUMEN FACTURA</th>
                    </tr>
                    <tr>
                        <td>
                            <b>Número pedido:</b>
                            <xsl:value-of select="factura/datos_factura/@n_ped"/>
                        </td>
                        <td>
                            <b>
                                IVA:
                            </b>
                            <xsl:value-of select="factura/datos_factura/@iva"/>
                        </td>
                        <td>
                            <b>forma de pago:</b>
                            <xsl:value-of select="factura/datos_factura/@f_pago"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Moneda:</b>
                            <xsl:value-of select="factura/datos_factura/@moneda"/>
                        </td>
                        <td colspan="2">
                            <b>Fecha:</b>
                            <xsl:value-of select="factura/datos_factura/fecha"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="cabecera" colspan="3">DETALLE FACTURA</th>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <xsl:apply-templates select="factura/datos_factura"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="cabecera" colspan="3">IMPORTES FACTURA</th>
                    </tr>
                    <tr>
                        <td>
                            <b>
                                Base:
                            </b>
                            <xsl:value-of select="factura/datos_factura/base"/>
                        </td>
                        <td>
                            <b>
                                Cuota IVA:
                            </b>
                             <xsl:value-of select="factura/datos_factura/cuota_iva"/>
                        </td>
                        <td>
                            <b>
                                Total Factura:
                            </b>
                             <xsl:value-of select="factura/datos_factura/total"/>
                        </td>
                    </tr>
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
    <xsl:template match="factura/datos_factura">
        <table>
            <tr>
                <th>Ref</th>
                <th>Descripción</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Importe</th>
            </tr>
            <xsl:for-each select="linea">
                <tr>
                    <td>
                        <xsl:value-of select="ref"/>
                    </td>
                    <td>
                        <xsl:value-of select="desc"/>
                    </td>
                    <td>
                        <xsl:value-of select="cant"/>
                    </td>
                    <td>
                        <xsl:value-of select="precio"/>
                    </td>
                    <td>
                        <xsl:value-of select="importe"/>
                    </td>
                </tr>
            </xsl:for-each>         
        </table>
    </xsl:template>
</xsl:stylesheet>
