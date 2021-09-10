<#if show_footer>
    <#assign footer_container_css_classes = "container-fluid mb-lg-0 mr-lg-8 mt-lg-0 pb-lg-4 pl-lg-0 pr-lg-0 pt-lg-4 mr-sm-8 ml-sm-8 mr-8 ml-8 mr-md-8 ml-md-8" />

    <#if side_navigation>
        <#assign footer_container_css_classes = footer_container_css_classes + " ml-lg-10" />
    <#else>
        <#assign footer_container_css_classes = footer_container_css_classes + " ml-lg-8" />
    </#if>

    <footer class="footer-bg footer-text-color" id="footer" role="contentinfo">
        <div class="${footer_container_css_classes}">
            <div class="row">
                <div class="col-md-12 text-center text-md-left">
                    <@liferay.language key="powered-by" />

                    <a class="footer-liferay-text-color" href="http://www.liferay.com" rel="external">Liferay</a>
                </div>
            </div>
        </div>
    </footer>
</#if>