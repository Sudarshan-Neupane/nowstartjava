/**
 * Sudarshan
 */
var mainapp = angular.module('dispalyContent', []);
mainapp.controller('content', function($scope, $http) {	
	var dispalycontent = $http({
		method : 'GET',
		url : '/tutorials/api/content/display/'+$scope.slugid,
	})
	dispalycontent.success(function(data, status, headers, config) {
		$scope.disContent = data;
	})
})