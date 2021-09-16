<#if show_footer>
    <#assign footer_container_css_classes = "container-fluid mr-sm-2 ml-sm-2 mr-md-8 ml-md-8 pb-3 pt-3" />

    <#if side_navigation>
        <#assign footer_container_css_classes = footer_container_css_classes + " mr-1 ml-6" />
    </#if>
<footer class="footer-bg footer-text-color" id="footer" role="contentinfo">
    <div class="${footer_container_css_classes}">
        <div class="text-left pl-2">
            <@liferay.language key="powered-by" />

            <a class="footer-liferay-text-color" href="http://www.liferay.com" rel="external">Liferay</a>
        </div>
    </div>
</footer>
</#if>