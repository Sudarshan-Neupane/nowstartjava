var app = angular.module("tutorial", [ 'ngRoute' ]);
app.controller('tutorialController', [ '$scope', '$http', '$location', '$route',
		function($scope, $http, $location, $route) {
			
			$scope.deleteTutorialContent = function(id) {
				$scope.contentId = id;
				$("#myModal").modal("show");
			}
			
			$scope.deleteTutorialContentConfirm = function() {
				alert($scope.contentId);
				var displayTuts = $http({
					method : 'GET',
					url:'/tutorials/cms/contents/delete/'+$scope.contentId
				})
				displayTuts.success(function(data,status,header,config){
					$("#myModal").modal("hide");
					$("#main-content-"+$scope.contentId).parent().remove();
				})				
			}
		} ]);