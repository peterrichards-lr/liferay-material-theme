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

		// Navigation Mobile Slideout Menu

		$('#navigation [data-toggle="sidenav"]').sideNavigation();

		// Simple Search Bar Collapse

		var simpleSearchBarCollapse = $('.simple-search-bar-collapse');

		simpleSearchBarCollapse.find('.search-bar-search-button').attr('tabindex', '-1');

		simpleSearchBarCollapse.on(
			'click.simpleSearchBarCollapse',
			'.simple-search-bar-collapse-toggle',
			function(event) {
				var container = $(this).closest('.simple-search-bar-collapse');

				if (container.hasClass('collapsed')) {
					container.removeClass('collapsed');
					container.find('.search-bar-search-button').attr('tabindex', '');
					container.find('.search-bar-keywords-input').focus();
				}
				else {
					container.find('.search-bar-keywords-input').val('');
					container.find('.search-bar-search-button').attr('tabindex', '-1');
					container.addClass('collapsed');
				}
			}
		);

		Liferay.once(
			'screenLoad',
			function(event) {
				var navigationSidenav = $('#navigation [data-toggle="sidenav"]').data('lexicon.sidenav');

				if (navigationSidenav) {
					navigationSidenav.destroy();
				}

				// Simple Search Bar Collapse

				simpleSearchBarCollapse.off('click.simpleSearchBarCollapse');
			}
		);

		var notificationPanel = $('.gsdc-page-header-notification-panel');
		var notificationToggle = $('.gsdc-page-header-notification-link');
		var notificationToggleLabel = $('.user-avatar-link a');

		var notificationCount = notificationToggle.attr('data-notifications-count');
		var notificationDelta = notificationToggle.attr('data-delta');
		var notificationPortletNamespace = notificationToggle.attr('data-notifications-portlet-namespace');

		var notificationsCurrentPage = 1;
		var notificationsCurrentPageParam = '_' + notificationPortletNamespace + '_cur';

		var loadMoreContainer = $('.notification-load-more');

		function loadMoreNotifications(href) {
			loadMoreContainer.addClass('hide');

			notificationPanel
				.find('.sidebar-body .fetched-notifications:last')
				.load(
					href + ' ul.show-quick-actions-on-hover',
					function() {
						if ((notificationsCurrentPage * notificationDelta) <= notificationCount) {
							loadMoreContainer.removeClass('hide');
						}
					}
				);
		}

		function updateUrlParameter(url, param, value) {
			var regex = new RegExp('(' + param + '=)[^\&]+');

			return url.replace(regex, '$1' + value);
		}

		function toggleNotificaionPanel(event) {

			event.preventDefault();

			notificationPanel.toggleClass('open');

			if (!notificationPanel.hasClass('loaded')) {
				notificationPanel.addClass('loaded');

				var href = notificationToggle.attr('href');

				loadMoreNotifications(href);
			}
		}

		// notificationToggle.on(
		// 	'click',
		// 	function(event) {
		// 		toggleNotificaionPanel(event);
		// 	}
		// );

		// notificationToggleLabel.on(
		// 	'click',
		// 	function(event) {
		// 		toggleNotificaionPanel(event);
		// 	}
		// );

		loadMoreContainer.on(
			'click',
			function(event) {
				notificationsCurrentPage++;

				var href = updateUrlParameter(notificationToggle.attr('href'), notificationsCurrentPageParam, notificationsCurrentPage);

				$('<div class=\'fetched-notifications\' />').insertAfter('.sidebar-body .fetched-notifications:last');

				loadMoreNotifications(href);
			}
		);

		if (A.UA.ie) {
			var childNavigation = document.getElementById('gsdcChildNavigation');

			var elementPosition = childNavigation.getBoundingClientRect();
			var placeholder = document.createElement('div');

			placeholder.style.width = elementPosition.width + 'px';
			placeholder.style.height = elementPosition.height + 'px';

			var placeHolderAdded = false;

			window.addEventListener(
				'scroll',
				function() {
					if (window.pageYOffset >= elementPosition.top && !placeHolderAdded) {
						childNavigation.classList.add('gsdc-ie-sticky-header');
						childNavigation.parentNode.insertBefore(placeholder, childNavigation);

						placeHolderAdded = true;
					}
					else if (window.pageYOffset < elementPosition.top && placeHolderAdded) {
						childNavigation.classList.remove('gsdc-ie-sticky-header');
						childNavigation.parentNode.removeChild(placeholder);

						placeHolderAdded = false;
					}
				}
			);
		}
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
