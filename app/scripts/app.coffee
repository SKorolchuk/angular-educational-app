'use strict';

app = angular.module 'SKorolchuk.AngularStudy', [
    'ngAnimate',
    'ngRoute',
		'ngGrid'
  ]

app.constant 'version', 'v0.1.0'
.config ($locationProvider, $routeProvider) ->

  $locationProvider.html5Mode(false);

  $routeProvider
  .when '/',
      templateUrl: 'views/home.html'
  .when '/features',
      templateUrl: 'views/features.html'
  .when '/contact',
      templateUrl: 'views/contact.html'
  .when '/test',
      controller: 'TestCtrl'
      templateUrl: 'views/test.html'
  .otherwise
      redirectTo: '/'

