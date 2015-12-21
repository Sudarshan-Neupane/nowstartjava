var app = angular.module('myapp', []);

app.controller('category', function($scope, $http) {
	// $scope.searchMe = function() {
	var value1 = $http({
		method : 'GET',
		url : '/giveit/category'
	})
	value1.success(function(data, status, headers, config) {
		$scope.category = data;
	})
	$scope.searchMenow = function() {
		alert("test");
	}
	// }
});
app.controller('displayItemsAll', function($scope, $http) {
	var value = $http({
		method : 'GET',
		url : '/giveit/displayItems'
	})
	value.success(function(data, status, headers, config) {
		$scope.itemsDisplay = data;
	})
});

app.controller('country', function($scope, $http) {
	$scope.searchMe = function() {
		var value1 = $http({
			method : 'GET',
			url : 'https://restcountries.eu/rest/v1/all'
		})
		value1.success(function(data, status, headers, config) {
			$scope.country = data;
		})
	}
});
