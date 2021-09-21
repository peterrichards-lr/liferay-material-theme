<#if show_header>
    <#assign user_personal_bar_css_classes = "container-fluid ml-2 mr-6 ml-md-6" />
<header id="banner">
    <#if show_account_selector || show_mini_cart>
    <div class="navbar no-shadow navbar-classic navbar-top upper-header upper-header-bg upper-header-text-color">
    <#else>
    <div class="navbar navbar-classic navbar-top upper-header upper-header-bg upper-header-text-color">
    </#if>
        <div class="${user_personal_bar_css_classes}">
            <div class="align-items-center autofit-row">
                <#if !side_navigation_logo>
                <a class="${logo_css_class} align-items-center d-md-inline-flex d-sm-none d-none logo-md upper-header-text-color" href="${site_default_url}" title="<@liferay.language_format arguments="" key="go-to-x" />">
                    <img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />

                    <#if show_site_name>
                        <h2 class="font-weight-bold h2 mb-0 site-name" role="heading" aria-level="1">${site_name}</h2>
                    </#if>
                </a>
                </#if>

                <#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />

                <div class="autofit-col autofit-col-expand">
                <#if show_header_search>
                    <#assign search_bar_css = "navbar-form upper-header-text-color">
                    <#if !side_navigation_logo>
                        <#assign search_bar_css = search_bar_css + " justify-content-md-center justify-content-lg-end">
                    </#if>
                    <div class="${search_bar_css}" role="search">
                        <@liferay.search_bar default_preferences="${preferences}" />
                    </div>
                </#if>
                </div>

                <#if show_language_selector>
                <div class="autofit-col d-none d-md-block language-selector">
                    <#include "${full_templates_path}/language_selector.ftl" />
                </div>
                </#if>

                <#if !side_navigation_user || !is_signed_in>
                <div class="autofit-col">
                    <#if use_sign_in_modal && !is_signed_in>
                        <button
                            class="btn btn-unstyled sign-in text-default"
                            onclick="document.querySelector('#loginCardContainer').style.visibility = 'visible';"
                            type="button"
                        >
                            ${sign_in_text}
                        </button>
                    <#else>
                        <@liferay.user_personal_bar />
                    </#if>
                </div>
                </#if>
            </div>
        </div>
    </div>

    <#include "${full_templates_path}/top-navigation.ftl" />
</header>
</#if>