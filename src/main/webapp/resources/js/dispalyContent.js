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
	$scope.selectTutorialContent = function(contentId){
	 var selectTutscontent = $http({
		 method: 'GET',
		 url: '/tutorials/api/content/displayDetails/'+contentId,
	 })	
	 selectTutscontent.success(function(data,status,header,config){
		 $scope.displayDetails = data;
	 })
	}
})