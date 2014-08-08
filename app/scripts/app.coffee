'use strict';

app = angular.module 'SKorolchuk.AngularStudy', [
    'ngAnimate',
    'ngRoute',
		'ngGrid',
		'ui.router',
		'angularCharts'
  ]

app.constant 'version', 'v0.1.0'
.config ($locationProvider, $stateProvider, $urlRouterProvider) ->
	$locationProvider.html5Mode true
	$urlRouterProvider.otherwise '/'

	$stateProvider
	.state 'root',
			url: '/',
			templateUrl: 'views/home.html'
	.state 'features',
			url: '/features',
			templateUrl: 'views/features.html'
	.state 'contact',
			url: '/contact',
			templateUrl: 'views/contact.html'
	.state 'test',
			url: '/test',
			controller: 'TestCtrl'
			templateUrl: 'views/test.html'
	.state 'products',
			url: '/products'
			controller: 'ProductCtrl'
			templateUrl: 'views/products.html'
	.state 'product_info',
			url: '/productInfo/:id'
			controller: 'ProductCtrl'
			templateUrl: 'views/productInfo.html'
	.state 'statistics',
			url: '/products/statistics'
			controller: 'StatisticCtrl'
			templateUrl: 'views/statistics.html'


