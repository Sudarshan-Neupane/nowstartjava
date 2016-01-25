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
			// get tutorials for the database

			var tutorials = $http({
				method : 'GET',
				url : '/tutorials/cms/writers/get_all'
			});
			tutorials.success(function(data, status, header, config) {
				$scope.disUser = data;
			})
			// display tutorial form categoryid
			$scope.displayTutorial = function(id) {
				var displayTuts = $http({
					method : 'GET',
					url:'tutorials/tutorial/'+id
				})
				displayTuts.success(function(data,status,header,config){
					$scope.tutorials=data;
				})
			}
		} ]);