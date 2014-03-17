<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="../banshee/main.xslt" />

<!--
//
//  Overview template
//
//-->
<xsl:template match="overview">
<table class="list roles">
<tr><th class="role">Role</th><th class="users">Users with this role</th></tr>
<xsl:for-each select="roles/role">
	<tr class="click" onClick="javascript:document.location='/admin/role/{@id}'">
	<td><xsl:value-of select="." /></td>
	<td class="users"><xsl:value-of select="@users" /></td>
	</tr>
</xsl:for-each>
</table>

<a href="/admin/role/new" class="button">New role</a>
<a href="/admin" class="button">Back</a>
</xsl:template>

<!--
//
//  Edit template
//
//-->
<xsl:template match="edit">
<xsl:call-template name="show_messages" />
<form action="/admin/role" method="post">
<xsl:if test="role/@id">
<input type="hidden" name="id" value="{role/@id}" />
</xsl:if>
<div>Name: <input type="text" name="name" value="{role}" class="text">
<xsl:if test="role/@editable='no'">
	<xsl:attribute name="disabled">disabled</xsl:attribute>
</xsl:if>
</input></div>

<xsl:for-each select="pages/page">
	<div class="role">
		<input type="checkbox" name="{.}" class="role">
			<xsl:if test="@value!='0'">
				<xsl:attribute name="checked">checked</xsl:attribute>
			</xsl:if>
			<xsl:if test="../../role/@editable='no'">
				<xsl:attribute name="disabled">disabled</xsl:attribute>
			</xsl:if>
		</input>
		<xsl:value-of select="." />
	</div>
</xsl:for-each>
<br clear="both" />

<xsl:if test="role/@editable='yes'">
<input type="submit" name="submit_button" value="Save role" class="button" />
</xsl:if>
<a href="/admin/role" class="button">Cancel</a>
<xsl:if test="role/@id and role/@editable='yes'">
<input type="submit" name="submit_button" value="Delete role" class="button" onClick="javascript:return confirm('DELETE: Are you sure?')" />
</xsl:if>
</form>

<xsl:if test="role/@id">
<div class="members">
<h4>Users with this role:</h4>
<table class="list">
<tr><th>Name</th><th>E-mail address</th></tr>
<xsl:for-each select="members/member">
<tr onClick="javascript:location='/admin/user/{@id}'" class="click">
<td><xsl:value-of select="fullname" /></td>
<td><xsl:value-of select="email" /></td>
</tr>
</xsl:for-each>
</table>
<xsl:if test="not(members/member)">(none)</xsl:if>
</div>
</xsl:if>
</xsl:template>

<!--
//
//  Content template
//
//-->
<xsl:template match="content">
<h1><img src="/images/icons/roles.png" class="title_icon" />Role administration</h1>
<xsl:apply-templates select="overview" />
<xsl:apply-templates select="edit" />
<xsl:apply-templates select="result" />
</xsl:template>

</xsl:stylesheet>
