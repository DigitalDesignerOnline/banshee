<?php
	$allowed_uploads = array("jpg", "jpeg", "gif", "png", "pdf", "doc", "docx", "xls", "xlsx", "txt", "rtf");
	$supported_languages = array(
		"en" => "English",
		"nl" => "Nederlands");

	$months_of_year = array("january", "february", "march", "april", "may", "june",
		"july", "august", "september", "october", "november", "december");
	$days_of_week = array("monday", "tuesday", "wednesday", "thursday", "friday",
		"saturday", "sunday");

	$module_flags = array(
		"foo"         => array("bar"),
		"demos/flags" => array("test", "demo"));

	/* SINGLE SIGN-ON
	 *
	 * Create a user which has access to /system/sso. The variable $sso_username
	 * must be set to the username of this user. All users that want to use Single
	 * Sign-On must have access to /system/sso. The variable $sso_servers must
	 * contain the IP addresses of the webservers of the other SSO websites. Fill
	 * $sso_websites with the information of the other SSO websites.
	 */
	$sso_username = null;
	$sso_servers = array();
	$sso_websites = array(
/*
		array(
			"server"   => "www.banshee_based_website.net",
			"username" => "user with access to ${server}/system/sso",
			"password" => "password",
			["ssl"     => true | false],
			["port"    => port number]),
		array(...),
*/
	);
?>
