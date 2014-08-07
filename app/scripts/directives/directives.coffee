'use strict'

angular.module 'SKorolchuk.AngularStudy'

.directive 'ngHelloWorld', () ->
	restrict: 'EAC',
	scope: true,
	compile: (tElement, tAttrs) ->
		tElement.html('<span>hello {{name}}</span>')
		(scope, element, attrs, controller) ->
			scope.name = 'world'

.directive "ngLeftNav", () ->
	restrict: 'EA',
	scope: {
		header: '@'
	},
	transclude: true,
	controllerAs: 'leftNavCtrl',
	controller: ($location) ->
		@goToIndex = () ->
			$location.path('/')
	templateUrl: 'views/partials/leftnav.html'


.directive "ngTestLoginForm", ($animate) ->
	restrict: 'E',
	scope: {
		onLogin: '&',
		onRegister: '&'
	},
	transclude: true,
	templateUrl: 'views/partials/login.tmpl.html',
	link: (scope, element, attributes) ->
		scope.user =
			name: '',
			password: '',
			lastname: ''

		scope.showControl = true
		scope.submitLogin = () ->
			scope.onLogin
				user: scope.user
		scope.submitRegister = () ->
			scope.onRegister
				user: scope.user

		element.bind 'click', () ->
			$animate.move element, element.parent()
			console.log 'fired'


.directive 'ngTestGrid', ->
	restrict: 'A',
	scope: {
		onElementClick: '&'
	},
	templateUrl: 'views/partials/grid-sample.tmpl.html',
	controller: ($scope) ->
		columnDefinition = [
			{ field: 'name', display: 'User Name' },
			{ field: 'age', display: 'User Age' },
			{ field: 'married', display: 'Is Married', cellTemplate: '<div><input type="checkbox" ng-checked="row.getProperty(col.field)"/></div>"'}
		]

		$scope.users = [
			{name: "Moroni", age: 50, married: false },
			{name: "Tiancum", age: 43, married: true },
			{name: "Jacob", age: 27, married: false },
			{name: "Nephi", age: 29, married: false },
			{name: "Enos", age: 34, married: false }
		]

		$scope.users.push {name: "test #{index}", age: (if index>50 then index+100 else index-100), married: index%2==0 } for index in [1..100]

		$scope.gridSettings =
			data: 'users'
			showGroupPanel: true
			columnDefs: columnDefinition
	link: (scope, element, attributes) ->
		0