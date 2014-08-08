'use strict'

angular.module 'SKorolchuk.AngularStudy'

.controller 'MainCtrl', ($scope, $location, $window, version, $state) ->
	$scope.$path = $location.path.bind($location)
	$scope.$state = $state
	$scope.version = version

.controller 'ProductCtrl', ($scope, $state, $stateParams, productService) ->
	$scope.products = productService.products
	$scope.productId = $stateParams['id']
	$scope.isCurrentProduct = (element) ->
		+$scope.productId == element.id
	$scope.goToDetails = (product) ->
		$state.go('product_info', {'id' : product.id })

	$scope.goBack = ->
		$state.go('products')

.controller 'StatisticCtrl', ($scope, productService, $timeout) ->
	reduceProductsByPrice = (product, low, high) ->
		+product.price >= low && +product.price < high

	$scope.chartConfig =
		title: 'Products Cost'
		tooltips: true
		labels: false
		legend:
			display: true
			position: 'left'

	generateNewStats = () ->
		$scope.products = ({name: 'test ' + i, price: Math.random(+new Date()) * 100 / 1.7, id: i } for i in [1..100])
		$scope.statisticsData =
			series: _.range(1,100,10),
			data: do ->
				_data = []
				_points = _.range(1,100,10)
				for point, i in _points
					_data.push
						'x': point
						'y': [_.where((result = reduceProductsByPrice(product, point, (if i != _points.length then _points[i+1] else 1000000)) for product in $scope.products), (o) -> o).length]
						'tooltip': 'hello world'
				_data
		$timeout generateNewStats, 6000
	generateNewStats()

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
