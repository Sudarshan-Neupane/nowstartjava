var menuApp = angular.module("menuApp", []);

menuApp.controller('menuController', [ '$scope', '$http', function($scope, $http) {
	var dataFromMenu = $http({
		method : 'GET',
		url : '/tutorials/cms/getmenu',
	});
	dataFromMenu.success(function(data, status, header, config) {
		$scope.displayMenu = data;
	});
	$scope.getDataForEdit = function(id) {
		var getData = $http({
			method : 'GET',
			url : '/tutorials/cms/getmenu_byid/' + id
		});
		getData.success(function(data, status, header, config) {
			CKEDITOR.instances.desText.setData(data.description);
			$scope.menuData = data;
		})
	}
} ]);