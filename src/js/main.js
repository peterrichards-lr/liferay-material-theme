/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

/*
 * This function gets loaded when all the HTML, not including the portlets, is
 * loaded.
 */
AUI().ready(
    function(A) {
		var $ = AUI.$;

		function setupNavigationMenu() {
			var $navigation = $('#navigation');

			$navigation.hover(
				function() {
					$navigation.addClass('open');
				},
				function() {
					$navigation.removeClass('open');
				}
			);

			// Fix the issue that does not close on click. Ref DCTRL-350.

			var userAvatar = $navigation.find('.text-default');

			userAvatar.on(
				'mousedown',
				function(e) {
					var sidenavToggle = $('.lfr-product-menu-panel.sidenav-menu-slider.open');

					if ($('body').hasClass('open') && sidenavToggle.length > 0) {
						setTimeout(
							function() {
								$('body').removeClass('open');
								$('body').addClass('closed');
								sidenavToggle.removeClass('open');
								sidenavToggle.addClass('closed');

								Liferay.Store('com.liferay.product.navigation.product.menu.web_productMenuState', 'closed');
							},
							100
						);
					}
				}
			);
		}

		setupNavigationMenu();
	}
);

/*
 * This function gets loaded after each and every portlet on the page.
 *
 * portletId: the current portlet's id
 * node: the Alloy Node object of the current portlet
 */
Liferay.Portlet.ready(function (_portletId, _node) {});

/*
 * This function gets loaded when everything, including the portlets, is on
 * the page.
 */
Liferay.on('allPortletsReady', function () {});
