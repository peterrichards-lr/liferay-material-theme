<nav class="${nav_css_class}" id="navigation" role="navigation">
	<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>

	<a class="d-lg-none link-monospaced link-primary" data-content="#navigation" data-toggle="sidenav" href="#sitepages" role="button">
		<svg class="lexicon-icon">
			<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#bars"></use>
		</svg>
	</a>

	<#if side_navigation_logo>
		<div class="${logo_css_class}">
			<img alt="${logo_description}" class="img-fluid logo-image" src="${site_logo}" />

			<#if show_site_name>
				<span class="site-name" title='<@liferay.language_format arguments="${site_name}" key="go-to-x" />'>
					${site_name}
				</span>
			</#if>
		</div>
	</#if>

	<ul aria-label="<@liferay.language key="site-pages" />" class="nav nav-stacked site-pages" role="menubar" id="sitepages">
		<li class="d-lg-none">
			<a class="close" data-content="#navigation" data-toggle="sidenav" href="#sitepages" role="button">
				<svg class="lexicon-icon">
					<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#compress"></use>
				</svg>
			</a>
		</li>

		<#list nav_items as nav_item>
		<#assign
			nav_item_attr_has_popup = ""
			nav_item_attr_selected = ""
			nav_item_css_class = "nav-item"
			nav_item_layout = nav_item.getLayout()
			nav_item_icon_css_class = "icon-angle-right"
		/>

		<#assign currentLayoutParentPlid = layout.getParentPlid() />

		<#if nav_item.isSelected() || (nav_item_layout.getPlid() == currentLayoutParentPlid)>
			<#assign
				nav_item_attr_has_popup = "aria-haspopup='true'"
				nav_item_attr_selected = "aria-selected='true'"
				nav_item_css_class = "nav-item selected"
			/>
		</#if>

		<li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
			<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} class="nav-link" href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
				<span class="${nav_item_icon_css_class} layout-icon">
					<@liferay_theme["layout-icon"] layout=nav_item_layout />
				</span>
				<span class="layout-name ${nav_item.getName()}">${nav_item.getName()}</span>
			</a>
		</li>
		</#list>

		<#if side_navigation_user>
		<li class="nav-user-bar">
			<div class="user-section">
				<@liferay.user_personal_bar />

				<#if notifications_portlet_url?? && notifications_count gt 0>
					<a href="${notifications_link}">
						<span class="badge badge-danger panel-notifications-count">
							<span class="badge-item badge-item-expand">${notifications_count}</span>
						</span>
					</a>
				</#if>

				<span class="user-full-name">
					${user.getFullName()}
				</span>
			</div>
		</li>
		</#if>
	</ul>
</nav>