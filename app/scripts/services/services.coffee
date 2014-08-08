'use strict'

angular.module 'SKorolchuk.AngularStudy'

.service 'SampleService', () ->
	new Object()

.factory 'productService', () ->
	products: ({name: 'test ' + i, price: Math.random(+new Date()) * 100 / 1.7, id: i } for i in [1..100])
