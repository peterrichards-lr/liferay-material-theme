<div class="autofit-col language-selector mr-1 mr-md-2">
    <#assign preferences = freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />

    <@liferay_portlet["runtime"]
        defaultPreferences=preferences
        portletProviderAction=portletProviderAction.VIEW
        portletProviderClassName="com.liferay.portal.kernel.servlet.taglib.ui.LanguageEntry"
    />
</div>