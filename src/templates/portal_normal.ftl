<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<div class="d-flex flex-column min-vh-100">
<#if show_control_menu == true>
	<@liferay.control_menu />
</#if>

<#if root_css_class?contains("rtl")>
	<div class="d-flex flex-column flex-fill material-theme-rtl-main-class" id="wrapper">
<<#else>
	<div class="d-flex flex-column flex-fill material-theme-main-class" id="wrapper">
</#if>
		<#include "${full_templates_path}/header.ftl" />

		<#if side_navigation>
		<section class="${portal_content_css_class} content-side-navigation minium-frame flex-fill" id="content">
		<#else>
		<section class="${portal_content_css_class} minium-frame flex-fill" id="content">
		</#if>
			<#if side_navigation && !css_class?contains("has-edit-mode-menu")>
				<#include "${full_templates_path}/side_navigation.ftl" />
			</#if>

			<h2 class="sr-only" role="heading" aria-level="1">${the_title}</h2>

			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</section>
		
		<#include "${full_templates_path}/footer.ftl" />
	</div>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>