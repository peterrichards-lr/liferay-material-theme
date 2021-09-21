<#assign
	show_footer = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-footer"))
	show_header = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-header"))
	side_navigation = getterUtil.getBoolean(themeDisplay.getThemeSetting("side-navigation"))
	side_navigation_logo = getterUtil.getBoolean(themeDisplay.getThemeSetting("side-navigation-logo"))
	side_navigation_user = getterUtil.getBoolean(themeDisplay.getThemeSetting("side-navigation-user"))
	show_header_search = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-header-search"))
	wrap_widget_page_content = getterUtil.getBoolean(themeDisplay.getThemeSetting("wrap-widget-page-content"))
	show_language_selector = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-language-selector"))
	show_control_menu = getterUtil.getBoolean(sessionClicks.get(request, "SHOW_CONTROL_MENU", "true"))
	show_account_selector = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-account-selector"))
	show_mini_cart = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-mini-cart"))
	use_sign_in_modal = getterUtil.getBoolean(themeDisplay.getThemeSetting("use-sign-in-modal"))
/>

<#assign
	notifications_count = 0
	notifications_delta = 0
	notifications_portlet_url = ""
	notifications_portlet_namespace = ""
/>

<#assign show_control_menu = permissionChecker.isOmniadmin() || permissionChecker.isGroupAdmin(user_id)/>

<#if wrap_widget_page_content && ((layout.isTypeContent() && themeDisplay.isStateMaximized()) || (layout.getType() == "portlet"))>
	<#assign portal_content_css_class = "container" />
<#else>
	<#assign portal_content_css_class = "" />
</#if>