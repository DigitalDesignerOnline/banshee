<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="main.xslt" />

<!--
//
//  Login template
//
//-->
<xsl:template match="login">
<form action="{url}" method="post" autocomplete="off" onSubmit="javascript:hash_password(); return true;">
<table class="login">
<tr><td>Username:</td><td><input type="text" autocapitalize="off" autocorrect="off" name="username" value="{username}" id="username" class="text" /></td></tr>
<tr><td>Password:</td><td><input type="password" name="password" id="password" class="text" /></td></tr>
</table>
<p>Bind session to IP (<span style="font-size:10px"><xsl:value-of select="remote_addr" /></span>): <input type="checkbox" name="bind_ip">
<xsl:if test="bind">
<xsl:attribute name="checked">checked</xsl:attribute>
</xsl:if>
</input></p>
<xsl:call-template name="show_messages" />
<p>
<input type="submit" value="Login" class="button" />
<a href="/" class="button">Cancel</a>
</p>

<input type="hidden" id="use_cr_method" name="use_cr_method" value="no" />
</form>
<input type="hidden" id="challenge" value="{challenge}" />

<p>If you have forgotten your password, click <a href="/password">here</a>.</p>
</xsl:template>

<!--
//
//  Content template
//
//-->
<xsl:template match="content">
<h1>Login</h1>
<xsl:apply-templates select="login" />
<xsl:apply-templates select="result" />
</xsl:template>

</xsl:stylesheet>
