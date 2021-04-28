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
        <html>
            <head>
                <title>02 XSLT David Aparicio</title>
                <style>
                    h1{color: green;}
                    table{
                    border-collapse:collapse;
                    width:100%;
                    color:light-green;
                    }
                </style>
            </head>
            <body>
                
                <h1>Información de tickets</h1>
               
                <table>
                    <tr>
                    <th>Listado de tickets</th>
                    </tr>
                    
                    <xsl:apply-templates select="listatickets/ticket"/>
                    <tr>
                        <xsl:apply-templates select="ticket/fecha"/>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="listatickets/ticket">
        <tr> 
            <th> Tickets:  <xsl:value-of select="numero"/> </th>
        </tr>
      <td><xsl:apply-templates select="ticket/producto"/></td>
      
    </xsl:template>
    <xsl:template match="ticket/producto">
      
    </xsl:template>
    <xsl:template match="ticket/fecha">
        <td>
        <xsl:value-of select="fecha"/>
        </td>
    </xsl:template>
</xsl:stylesheet>
