<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl
    Created on : 15 de abril de 2020, 11:27
    Author     : amor
    Description:
        Regla asociada a cada uno de los siete nodos de Xpath
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

   <!-- Creación de la estructura de la página web -->
    <xsl:template match="/alumnos">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>01 XSLT - Informacion de alumnos </title>
                
            </head>
            <body>
                 <!-- Mostrar los datos de cada alumno -->
                <xsl:for-each select="alumno">
                    <p><xsl:value-of select="concat(nombre,' ',apellido)"/></p>
                      <!-- Mostrar las direcciones de cada alumno -->
                    <xsl:for-each select="direccion">
                           <p>Poblacion: <xsl:value-of select="poblacion"/> </p>
                           <p> <xsl:value-of select="cp"/></p>
                    </xsl:for-each>
                    <hr/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
   
   
    
</xsl:stylesheet>
