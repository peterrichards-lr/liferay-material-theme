<#assign show_raylife_logo = true />

<nav class="${nav_css_class}" id="navigation" role="navigation">
	<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>

	<a class="d-lg-none link-monospaced link-primary" data-content="#navigation" data-toggle="sidenav" href="#gsdcSitePages" role="button">
		<svg class="gsdc-icon-bars lexicon-icon">
			<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#gsdc-bars"></use>
		</svg>
	</a>

	<#if show_raylife_logo>
		<a class="raylife-logo-container" href="${site_default_url}">
			<svg class="raylife-logo">
				<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#raylife-producer-logo"></use>
			</svg>
		</a>
	<#else>
		<div class="${logo_css_class}">
			<img alt="${logo_description}" class="img-fluid logo-image" src="${site_logo}" />

			<#if show_site_name>
				<span class="site-name" title='<@liferay.language_format arguments="${site_name}" key="go-to-x" />'>
					${site_name}
				</span>
			</#if>
		</div>
	</#if>

	<a class="component-link d-lg-none link-monospaced" href="#open-search" role="button">
		<svg class="lexicon-icon lexicon-icon-search">
			<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#search"></use>
		</svg>
	</a>

	<ul aria-label="<@liferay.language key="site-pages" />" class="nav nav-stacked site-pages" id="gsdcSitePages" role="menubar">
		<li class="d-lg-none">
			<a class="close" data-content="#navigation" data-toggle="sidenav" href="#gsdcSitePages" role="button">
				<svg class="lexicon-icon lexicon-icon-times">
					<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#times"></use>
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

			<#assign
				nav_item_icon_hash = {
					"Home":"home",
					"Apple":"video"
				}
			/>

			<#if nav_item_icon_hash[nav_item.getName()]??>
				<#assign
					nav_item_icon_css_class = nav_item_icon_hash[nav_item.getName()]
				/>
			</#if>

			<li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
				<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} class="nav-link" href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
					<@liferay_theme["layout-icon"] layout=nav_item_layout />

					<span class="${nav_item_icon_css_class} layout-icon">
						<svg class="nav-item-icon">
							<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#${nav_item_icon_css_class}"></use>
						</svg>
					</span>
					<span class="layout-name ${nav_item.getName()}">${nav_item.getName()}</span>
				</a>
			</li>
		</#list>

		<li class="nav-user-bar">
			<#assign
				notifications_link = "javascript:;"
			/>

			<#if notifications_portlet_url??>
				<#assign notifications_link = notifications_portlet_url + "&_${notifications_portlet_namespace}_delta=${notifications_delta}&_${notifications_portlet_namespace}_cur=1" />
			</#if>

			<div class="gsdc-page-header-notification-section">
				<a class="gsdc-page-header-notification-link js-modal" data-delta="${notifications_delta}" data-notifications-count="${notifications_count}" data-notifications-portlet-namespace="${notifications_portlet_namespace}" data-title="notifications" href="${notifications_link}">
					<span class="inline-item inline-item-after">
						<svg class="lexicon-icon lexicon-icon-bell-on" focusable="false" role="presentation">
							<use xlink:href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#bell-on"></use>
						</svg>
					</span>
				</a>
			</div>

			<div class="gsdc-page-navigation-user-section">
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
	</ul>

	<div class="gsdc-page-header-notification-panel">
		<div class="sidebar-header">
			<div class="autofit-row sidebar-section">
				<div class="autofit-col autofit-col-expand">
					<h4 class="component-title">
						<span class="text-truncate-inline">
							<@liferay.language key="notifications" />
						</span>
					</h4>
				</div>
				<div class="autofit-col">
					<a aria-expanded="false" class="component-action" href="javascript:;" role="button">
						<svg class="lexicon-icon lexicon-icon-cog" focusable="false" role="presentation">
							<use href="${themeDisplay.getPathThemeImages()}/clay/icons.svg#cog"></use>
						</svg>
					</a>
				</div>
			</div>
		</div>

		<div class="sidebar-body">
			<div class="fetched-notifications">
				<div class="loading-animation"></div>
			</div>

			<#if notifications_count gt notifications_delta>
				<a class="hide notification-load-more text-center" href="javascript:;">
					<@liferay.language key="load-older-notifications" />
				</a>
			</#if>
		</div>
	</div>
</nav>