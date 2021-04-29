<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 28 de abril de 2021, 17:26
    Author     : PC
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>
                <title>02 XSLT David Aparicio</title>
                
            </head>
            <body>
                
                <h1>Información de tickets</h1>
               
                <table>
                    <tr>
                        <th colspan="2" id="lista">Listado de tickets</th>
                    </tr>
                    <xsl:apply-templates select="listatickets/ticket"/>
                    <tr>
                        <xsl:apply-templates select="ticket-fecha"/>
                    </tr>
                    <tr>
                        <th colspan="2">Numero de Tickets: <xsl:value-of select="count(listatickets/ticket)"/></th>
                        
                    </tr>
                    <tr>
                        <th colspan="2">
                            Total de tickets:
                            <xsl:value-of select="sum(//producto/precio)"/>
                        </th>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="listatickets/ticket">
        <tr> 
            <th colspan="2"> Tickets:  <xsl:value-of select="numero"/> </th>
        </tr>
        <tr>
            <th>Producto</th>
            <th>Precio</th>
        </tr>
        
            <xsl:apply-templates select="producto"/>
       
            <tr>
                <th>Total</th>
                <th>
                    <xsl:value-of select="sum(producto/precio)"/>
                </th>
            </tr>
            <tr>
                <th colspan="2" id="fecha">
                    Fecha del ticket
                    <xsl:value-of select="fecha"/>
            </th>
            </tr>
      
    </xsl:template>
    <xsl:template match="producto">
        <tr> 
            <td>
                <xsl:value-of select="nombre"/>
            </td>
            <td>
                <xsl:value-of select="precio"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve">
            <xsl:comment>
                <xsl:value-of select="."/>
            </xsl:comment>
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
