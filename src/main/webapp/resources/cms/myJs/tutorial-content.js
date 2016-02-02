var app = angular.module("tutorialContent", [ 'ngRoute' ]);
app.controller('tutorialContentController', [ '$scope', '$http', '$location', '$route',
		function($scope, $http, $location, $route) {
			
			$scope.deleteTutorialContent = function(id) {
				$scope.contentId = id;
				$("#myModal").modal("show");
			}
			
			$scope.deleteTutorialContentConfirm = function() {
//				alert($scope.contentId);
				var displayTuts = $http({
					method : 'GET',
					url:'/tutorials/cms/tutorials/contents/delete/'+$scope.contentId
				})
				displayTuts.success(function(data,status,header,config){
					$("#myModal").modal("hide");
					$("#main-content-"+$scope.contentId).parent().remove();
				})				
			}
			
			$scope.update=false;
			$scope.updateTutorialContent = function(id) {
//				alert(id);
				var displayTuts = $http({
					method : 'GET',
					url:'/tutorials/api/content/displayDetails/'+id
				})
				displayTuts.success(function(data,status,header,config){
					$scope.tutorialContent = data;
					CKEDITOR.instances.desText.setData(data.description);
					var element = document.getElementById("updateTab");
					$scope.update = true;
					element.click();			
					
				})
				
			}
		} ]);