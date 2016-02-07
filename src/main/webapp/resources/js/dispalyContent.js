/**
 * Sudarshan
 */
angular.module('displayContent', []).controller('content', function($scope, $http) {	
	var dispalycontent = $http({
		method : 'GET',
		url : '/api/content/display/'+$scope.slugid,
	})
	dispalycontent.success(function(data, status, headers, config) {
		$scope.disContent = data;
	})
	$scope.selectTutorialContent = function(contentId){
	 var selectTutscontent = $http({
		 method: 'GET',
		 url: '/api/content/displayDetails/'+contentId,
	 })	
	 selectTutscontent.success(function(data,status,header,config){
		 $scope.displayDetails = data;
	 })
	}
})