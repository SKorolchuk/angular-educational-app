'use strict'

angular.module 'SKorolchuk.AngularStudy'
.filter 'time', () ->
	(obj) ->
		+new Date(obj)

.filter 'startFrom', () ->
	(obj, index) ->
		obj && obj.slice(index)

.filter 'isOdd', () ->
	(obj) ->
		filteredResult = []
		if obj && obj.forEach
			obj.forEach (el) ->
				if el % 2 == 0
					filteredResult.push el
		filteredResult
