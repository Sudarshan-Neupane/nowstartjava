angular.module('myapp', []).controller('category', function($scope, $http) {
	var categories = $http({
		method : 'GET',
		url : '/tutorials/category'
	})
	categories.success(function(data, status, headers, config) {
		$scope.category = data;
	})
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