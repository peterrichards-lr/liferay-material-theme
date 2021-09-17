<#if is_setup_complete>
	<#assign top_bar_css_classes = "container-fluid  ml-2 mr-2 ml-md-6 mr-md-6" />
<div class="navbar no-shadow navbar-classic navbar-expand-md navbar-light lower-header lower-header-bg lower-header-text-color">
	<div class="${top_bar_css_classes}">
		<#if side_navigation>
		<a class="d-lg-none link-monospaced link-primary" data-toggle="sidenav" href="#sitepages" role="button" id="sidenavToggle">
			<svg class="lexicon-icon">
				<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#bars"></use>
			</svg>
		</a>
		<#else>
		<a class="d-lg-none link-monospaced link-primary" data-toggle="collapse" href="#navigationCollapse" role="button">
			<svg class="lexicon-icon">
				<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#bars"></use>
			</svg>
		</a>
		</#if>

		<div class="top-nav__start collapse navbar-collapse" id="navigationCollapse">
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
	</div>
</div>
</#if>