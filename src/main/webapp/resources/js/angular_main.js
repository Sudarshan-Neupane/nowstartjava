var app = angular.module('myapp', []);

app.controller('category', function($scope, $http) {
	// $scope.searchMe = function() {
	var value1 = $http({
		method : 'GET',
		url : '/tutorials/category'
	})
	value1.success(function(data, status, headers, config) {
		$scope.category = data;
	})

	/*var value = $http({
		method : 'GET',
		url : '/tutorials/tutorial'
	})
	value.success(function(data, status, headers, config) {
		$scope.displayTutorial = data;
	})*/
	$scope.introduction = true;

	$scope.selectCategory = function(id) {
		$scope.introduction = false;
		if (id == 0) {
			var value = $http({
				method : 'GET',
				url : '/tutorials/tutorial'
			})
			value.success(function(data, status, headers, config) {
				$scope.displayTutorial = data;
			})
		} else {
			var tutorialbyCat = $http({
				method : 'GET',
				url : '/tutorials/tutorial/' + id
			})
			tutorialbyCat.success(function(data, status, headers, congig) {
				$scope.displayTutorial = data;
			})
		}

	}
	// }
});
// app.controller('displayAllTutorials', function($scope, $http) {
// var value = $http({
// method : 'GET',
// url : '/tutorials/tutorial'
// })
// value.success(function(data, status, headers, config) {
// $scope.displayTutorial = data;
// })
// });

/*
 * app.controller('country', function($scope, $http) { $scope.searchMe =
 * function() { var value1 = $http({ method : 'GET', url :
 * 'https://restcountries.eu/rest/v1/all' }) value1.success(function(data,
 * status, headers, config) { $scope.country = data; }) } });
 */
