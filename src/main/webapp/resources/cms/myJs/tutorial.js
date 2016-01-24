var app = angular.module("tutorial", [ 'ngRoute' ]);
app.controller('tutorialController', [ '$scope', '$http', '$location', '$route',
		function($scope, $http, $location, $route) {
			var category = $http({
				method : 'GET',
				url : '/tutorials/category'
			});
			category.success(function(data, status, header, config) {
				$scope.displayCategory = data;
			});
		} ]);