var menuApp = angular.module("menuApp", []);

menuApp.controller('menuController', [ '$scope', '$http', function($scope, $http) {
	var dataFromMenu = $http({
		method : 'GET',
		url : 'getmenu',
	});
	dataFromMenu.success(function(data, status, header, config) {
		$scope.displayMenu = data;
	});
	$scope.getDataForEdit = function(id) {
		var getData = $http({
			method : 'GET',
			url : 'getmenu_byid/' + id
		});
		getData.success(function(data, status, header, config) {
			CKEDITOR.instances.desText.setData(data.description);
			$scope.menuData = data;
		})
	}
	$scope.deleteMenu = function(id,index) {
		var conf = confirm("Do you want to delete this page");
		if (conf == true) {
			var deleteData = $http({
				method : 'DELETE',
				url : 'cms/delte_data/' + id
			})
			deleteData.success(function(data, status, header, config) {
				$scope.delMessage ="Data daleted successfully";
			})
			this.displayMenu.splice(index,1);
		}
	}
} ]);