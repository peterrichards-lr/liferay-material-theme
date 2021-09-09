<#if show_header>
    <header id="banner">
        <#if !side_navigation || show_account_selector || show_mini_cart>
        <div class="navbar no-shadow navbar-classic navbar-top upper-header upper-header-bg upper-header-text-color">
        <#else>
        <div class="navbar navbar-classic navbar-top upper-header upper-header-bg upper-header-text-color">
        </#if>
            <div class="container user-personal-bar">
                <div class="align-items-center autofit-row">
                    <#if !side_navigation_logo>
                    <a class="${logo_css_class} align-items-center d-md-inline-flex d-sm-none d-none logo-md upper-header-text-color" href="${site_default_url}" title="<@liferay.language_format arguments="" key="go-to-x" />">
                        <img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />

                        <#if show_site_name>
                            <h2 class="font-weight-bold h2 mb-0" role="heading" aria-level="1">${site_name}</h2>
                        </#if>
                    </a>
                    </#if>

                    <#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />

                    <div class="autofit-col autofit-col-expand">
                        <#if show_header_search>
                        <div class="justify-content-md-end mr-4 navbar-form  upper-header-text-color" role="search">
                            <@liferay.search_bar default_preferences="${preferences}" />
                        </div>
                        </#if>
                    </div>

                    <#if show_language_selector>
                        <#include "${full_templates_path}/language_selector.ftl" />
                    </#if>

                    <#if !side_navigation>
                    <div class="autofit-col">
                        <@liferay.user_personal_bar />
                    </div>
                    </#if>
                </div>
            </div>
        </div>

        <#include "${full_templates_path}/top-navigation.ftl" />
   </header>
</#if>