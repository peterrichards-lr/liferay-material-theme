<#if show_header>
    <header id="banner">
        <div class="navbar navbar-classic navbar-top py-3">
            <div class="container user-personal-bar">
                <div class="align-items-center autofit-row">
                    <a class="${logo_css_class} align-items-center d-md-inline-flex d-sm-none d-none logo-md" href="${site_default_url}" title="<@liferay.language_format arguments="" key="go-to-x" />">
                        <img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />

                        <#if show_site_name>
                            <h2 class="font-weight-bold h2 mb-0 text-dark" role="heading" aria-level="1">${site_name}</h2>
                        </#if>
                    </a>

                    <#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />

                    <div class="autofit-col autofit-col-expand">
                        <#if show_header_search>
                            <div class="justify-content-md-end mr-4 navbar-form" role="search">
                                <@liferay.search_bar default_preferences="${preferences}" />
                            </div>
                        </#if>
                    </div>

                    <#if show_language_selector>
                        <#include "${full_templates_path}/language_selector.ftl" />
                    </#if>

                    <div class="autofit-col">
                        <@liferay.user_personal_bar />
                    </div>
                </div>
            </div>
        </div>

        <div class="navbar navbar-classic navbar-expand-md navbar-light pb-3">
            <div class="container">
                <a class="${logo_css_class} align-items-center d-inline-flex d-md-none logo-xs" href="${site_default_url}" rel="nofollow">
                    <img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />

                    <#if show_site_name>
                        <h2 class="font-weight-bold h2 mb-0 text-dark">${site_name}</h2>
                    </#if>
                </a>

                <#include "${full_templates_path}/navigation.ftl" />
            </div>
        </div>
    </header>
</#if>