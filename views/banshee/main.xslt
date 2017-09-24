<?xml version="1.0" ?>
<!--
//
//  Copyright (c) by Hugo Leisink <hugo@leisink.net>
//  This file is part of the Banshee PHP framework
//  https://www.banshee-php.org/
//
//  Licensed under The MIT License
//
//-->
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="functions.xslt" />
<xsl:import href="layout_cms.xslt" />
<xsl:import href="layout_demo.xslt" />
<xsl:import href="layout_site.xslt" />

<xsl:output method="html" doctype-system="about:legacy-compat"/>

<xsl:template match="/output">
<xsl:apply-templates select="layout_cms" />
<xsl:apply-templates select="layout_demo" />
<xsl:apply-templates select="layout_site" />
</xsl:template>

</xsl:stylesheet>
