<#if is_setup_complete>
	<#assign top_bar_css_classes = "container-fluid  ml-2 mr-6 ml-md-6" />
<div class="navbar no-shadow navbar-classic navbar-expand-md navbar-light lower-header lower-header-bg lower-header-text-color">
	<div class="${top_bar_css_classes}">
		<a class="d-lg-none link-monospaced link-primary" data-toggle="sidenav" href="#sitepages" role="button" id="sidenavToggle">
			<svg class="lexicon-icon">
				<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#bars"></use>
			</svg>
		</a>

		<div class="top-nav__start">
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