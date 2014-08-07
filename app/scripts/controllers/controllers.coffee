'use strict'

angular.module 'SKorolchuk.AngularStudy'

.controller 'MainCtrl', ($scope, $location, $window, version) ->
  $scope.$path = $location.path.bind($location)
  $scope.version = version

.controller 'TestCtrl', ($scope, $filter, $interpolate, $timeout) ->
	$scope.numbers = [1,2,3,4,5]
	$scope.filteredNums = $filter('isOdd') $scope.numbers

	$scope.Login = (user) ->
		alert('login ' + user.name + ' ' + user.lastname)

	$scope.Register = (user) ->
		alert('register ' + user.name)

	do ->
		changesCounter = 0
		$scope.switcherChanged = () ->
			changesCounter++
			$scope.changesMessage = $interpolate('You changed number {{count}} times!')(
				count: changesCounter
			)
	$scope.user =
		name: 'hello'
		lastname: 'world'

	do ->
		timer = null
		$scope.$watch 'switcher', (newVal) ->
			if (newVal)
				if (timer)
					$timeout.cancel(timer)

				timer = $timeout () ->
					alert("You switch to #{newVal}")
				, 350
