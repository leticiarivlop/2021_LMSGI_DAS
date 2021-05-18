<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 10.xsl
    Created on : 18 de mayo de 2021, 13:38
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/network">
       <xsl:value-of select="concat(name(),':')"/>
       <xsl:apply-templates select="ethernets"/>
    </xsl:template>
    <xsl:template match="ethernets">
        <xsl:value-of select="concat(name(),':')"/>
        <xsl:apply-templates select="ethernets/name"/>
    </xsl:template>
    <xsl:template match="ethernets/name">
        <xsl:value-of select="ethernets/name"/>
        <xsl:apply-templates select="ethernets/addresses"/>
    </xsl:template>
    <xsl:template match="ethernets/addresses">
        <xsl:value-of select="concat(name(),':')"/>
        <xsl:value-of select="ethernet/addresses"/>
        <xsl:apply-templates select="ethernets/gateway4"/>
    </xsl:template>
    <xsl:template match="ethernets/gateway4">
        <xsl:value-of select="concat(name(),':')"/>
        <xsl:value-of select="."/>
        <xsl:apply-templates select="nameservers/addresses"/>
    </xsl:template>
    <xsl:template match="//nameservers/addresses">
        <xsl:value-of select="."/>
        <xsl:apply-templates select="//version"/>
    </xsl:template>
    <xsl:template match="//version">
        <xsl:value-of select="concat(name(),':')"/>
        <xsl:value-of select="."/>
    </xsl:template>
</xsl:stylesheet>
