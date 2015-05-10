<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="banshee/main.xslt" />
<xsl:include href="banshee/poll.xslt" />

<!--
//
//  Polls template
//
//-->
<xsl:template match="polls">
<ul class="polls">
<xsl:for-each select="question">
	<li><a href="/{/output/page}/{@id}"><xsl:value-of select="." /></a></li>
</xsl:for-each>
</ul>
</xsl:template>

<!--
//
//  Poll template
//
//-->
<xsl:template match="poll">
<div class="poll">
<h3><xsl:value-of select="question" /></h3>
<ul class="answers">
	<xsl:for-each select="answers/answer">
	<li>
		<xsl:value-of select="answer" /> - <xsl:value-of select="percentage" />%
		<div class="percentage" style="width:{percentage}px" />
	</li>
	</xsl:for-each>
</ul>
<p>Number of votes: <xsl:value-of select="answers/@votes" /></p>
</div>

<a href="/{/output/page}" class="button">Back</a>
</xsl:template>

<!--
//
//  Content template
//
//-->
<xsl:template match="content">
<h1>Polls</h1>
<xsl:apply-templates select="active_poll" />
<xsl:apply-templates select="polls" />
<xsl:apply-templates select="poll" />
<xsl:apply-templates select="result" />
</xsl:template>

</xsl:stylesheet>
