<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>

	<meta content="width=device-width, initial-scale=1, minimum-scale=1" name="viewport" />

	<@liferay_util["include"] page=top_head_include />

	<style>
		<#if show_footer>
		.material-theme-main-class .commerce-cta {
			padding-bottom: 50px;
		}
		</#if>	
	</style>
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

		<section class="${portal_content_css_class} content-side-navigation minium-frame flex-fill" id="content">
			<#if !css_class?contains("has-edit-mode-menu")>
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

		<#if use_sign_in_modal && !is_signed_in>
			<div id="loginCardContainer" style="background: rgba(0, 0, 0, 0.5); height: 100%; width: 100%; z-index: 1500; position: fixed; top: 0; left: 0; visibility: hidden;">
				<div style="margin-left: 90%; margin-right: 20px; margin-top: 20px; position: relative;">
					<a class="btn btn-primary" href="javascript:void(0)" onclick="$('#loginCardContainer').css('visibility', 'hidden');" id="hide-sign-in" rel="nofollow">X</a>
				</div>
				<div class="b2b-login-card card" id="loginCardArea" style="background-color: #ffffff; min-width:300px; max-width: 400px; position: fixed; top: 25%;
					left: 50%; transform: translate(-50%, 0); z-index: 2000; padding: 20px;">	
						<#assign preferences = freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
						<@liferay_portlet["runtime"]
							defaultPreferences=preferences
							portletName="com_liferay_login_web_portlet_LoginPortlet"
						/>
				</div>
			</div>
		</#if>
	</div>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>