<#if show_footer>
    <#assign footer_container_css_classes = "col-md-12 text-center text-md-left pb-3 pt-3" />

    <#if side_navigation>
        <#assign footer_container_css_classes = footer_container_css_classes + " pl-lg-10" />
    <#else>
        <#assign footer_container_css_classes = footer_container_css_classes + " pl-lg-8" />
    </#if>

    <footer class="footer-bg footer-text-color" id="footer" role="contentinfo">
        <div class="container-fluid">
            <div class="row">
                <div class="${footer_container_css_classes}">
                    <@liferay.language key="powered-by" />

                    <a class="footer-liferay-text-color" href="http://www.liferay.com" rel="external">Liferay</a>
                </div>
            </div>
        </div>
    </footer>
</#if>