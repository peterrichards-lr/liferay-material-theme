<#if !side_navigation || show_account_selector || show_mini_cart>
    <#assign top_bar_css_classes = "container-fluid user-personal-bar ml-sm-2 mr-md-8 ml-md-8" />

    <#if side_navigation>
        <#assign top_bar_css_classes = top_bar_css_classes + " mr-6 ml-6" />
    </#if>
<div class="navbar no-shadow navbar-classic navbar-expand-md navbar-light lower-header lower-header-bg lower-header-text-color">
	<div class="${top_bar_css_classes}">
		<a class="d-lg-none link-monospaced link-primary" data-content="#navigation" data-toggle="sidenav" href="#sitepages" role="button">
			<svg class="lexicon-icon">
				<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#bars"></use>
			</svg>
		</a>
		<#if is_setup_complete>
			<div class="top-nav__start">
			<#if !side_navigation && has_navigation>
				<@liferay.navigation_menu default_preferences="${preferences}" />
			</#if>
			</div>

			<#if show_account_selector || show_mini_cart>
			<div class="top-nav__end">
				<#if show_account_selector>
				<div class="top-nav__account-selector-wrapper">
					<@liferay_commerce_ui["account-selector"] />
				</div>
				</#if>
				<#if show_mini_cart>
				<div class="top-nav__cart-wrapper">
					<@liferay_commerce_ui["mini-cart"] spritemap="${themeDisplay.getPathThemeImages()}/icons.svg" />
				</div>
				</#if>
			</div>
			</#if>
		</#if>
	</div>
</div>
</#if>


