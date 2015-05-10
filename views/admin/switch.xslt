<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../banshee/main.xslt" />

<!--
//
//  Users template
//
//-->
<xsl:template match="users">
<table class="list">
<tr><th class="username">Username</th><th class="name">Name</th><th class="email">E-mail address</th><th class="switch">Switch</th></tr>
<xsl:for-each select="user">
<tr>
<td><xsl:value-of select="username" /></td>
<td><xsl:value-of select="fullname" /></td>
<td><xsl:value-of select="email" /></td>
<td><form action="/{/output/banshee/cms_directory}/switch" method="post"><input type="hidden" name="user_id" value="{@id}" /><input type="submit" value="switch" class="switch button" /></form></td>
</tr>
</xsl:for-each>
</table>

<a href="/{/output/banshee/cms_directory}" class="button">Back</a>
</xsl:template>

<!--
//
//  Content template
//
//-->
<xsl:template match="content">
<h1><img src="/images/icons/switch.png" class="title_icon" />User switch</h1>
<xsl:apply-templates select="users" />
<xsl:apply-templates select="result" />
</xsl:template>

</xsl:stylesheet>
