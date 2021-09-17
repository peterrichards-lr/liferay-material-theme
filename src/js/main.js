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
		const navigation = document.querySelector('#navigation');
		const sidenavToggle = document.querySelector('#sidenavToggle');
		const wrapper = document.querySelector('#wrapper')
		var hoverActive = false;

		function getViewPortWidth() {
			return Math.max(
				document.documentElement.clientWidth,
				window.innerWidth || 0
			);
		}

		function toggleSideNav() {
			if (!navigation) {
				return;
			}
			if (!wrapper) {
				return;
			}

			if (navigation.classList.contains('open')) {
				navigation.classList.remove('open');
				wrapper.classList.remove('side-bar-open');
			} else {
				navigation.classList.add('open');
				wrapper.classList.add('side-bar-open');
			}
		};

		function toggleHover() {
			if (!navigation) {
				return;
			}

			if (getViewPortWidth() >= 992) {
				if (!hoverActive) {
					hoverActive = true;

					if (navigation.classList.contains('open')) {
						navigation.classList.remove('open');
						wrapper.classList.remove('side-bar-open');
					}

					navigation.addEventListener('mouseover', toggleSideNav);
					navigation.addEventListener('mouseout', toggleSideNav);	
				}				
			} else {
				hoverActive = false;
				navigation.removeEventListener('mouseover', toggleSideNav);
				navigation.removeEventListener('mouseout', toggleSideNav);	
			}
		}
		
		function setupNavigationMenu() {
			if (!sidenavToggle) {
				return;
			}
			sidenavToggle.addEventListener('click', toggleSideNav);

			toggleHover();
		}

		setupNavigationMenu();
		window.addEventListener('resize', toggleHover);
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
