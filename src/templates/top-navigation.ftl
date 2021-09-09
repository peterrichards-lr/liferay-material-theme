<#if !side_navigation || show_account_selector || show_mini_cart>
<div class="navbar no-shadow navbar-classic navbar-expand-md navbar-light lower-header lower-header-bg lower-header-text-color">
	<div class="container">
		<#if is_setup_complete>
			<button aria-controls="navigationCollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler navbar-toggler-right" data-target="#navigationCollapse" data-toggle="liferay-collapse" type="button">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navigationCollapse">
				<div class="minium-topbar__start">
				<#if !side_navigation && has_navigation>
					<@liferay.navigation_menu default_preferences="${preferences}" />
				</#if>
				</div>

				<#if show_account_selector || show_mini_cart>
				<div class="minium-topbar__end">
					<#if show_account_selector>
					<div class="minium-topbar__account-selector-wrapper">
						<@liferay_commerce_ui["account-selector"] />
					</div>
					</#if>
					<#if show_mini_cart>
					<div class="minium-topbar__cart-wrapper">
						<@liferay_commerce_ui["mini-cart"] spritemap="${themeDisplay.getPathThemeImages()}/icons.svg" />
					</div>
					</#if>
				</div>
				</#if>
			</div>
		</#if>
	</div>
</div>
</#if>


