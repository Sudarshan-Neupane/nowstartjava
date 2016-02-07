angular.module("tutorial", [ 'ngRoute' ])
.controller('tutorialController', [ '$scope', '$http', '$location', '$route',
		function($scope, $http, $location, $route) {
			var category = $http({
				method : 'GET',
				url : '/category'
			});
			category.success(function(data, status, header, config) {
				$scope.displayCategory = data;
			});
			// get tutorials for the database

			var writers = $http({
				method : 'GET',
				url : 'writers/get_all'
			});
			writers.success(function(data, status, header, config) {
				$scope.disUser = data;
			})
			// display tutorial form categoryid
			$scope.displayTutorial = function(id) {
				var displayTuts = $http({
					method : 'GET',
					url:'tutorials/tutorial/'+id
				})
				displayTuts.success(function(data,status,header,config){
					$scope.tutorials=data;
				})
			}
			//get tutorials for given writer
			$scope.tutorialsForOne = function(id) {
//				alert(id);
				var tutorials = $http({
					method : 'GET',
					url:'by_writer/'+id
				})
				tutorials.success(function(data,status,header,config) {
//					alert(data[0].description);
					$scope.allTutorials = data
				})
			}
			$scope.deleteModal = function(tutorial) {
				$scope.tutorialToDelete = tutorial;
				$("#deleteModal").modal("show");
			}
			
			$scope.deleted=false;
			$scope.deleteTutorial = function() {
				var deleteTut =$http( {
						method : 'GET',
						url:'delete/'+$scope.tutorialToDelete.id
				})
				deleteTut.success(function(data,status,header,config){
					$scope.deleted = true;
					$scope.delMessage = "Deleted Successfully";
					var index = $scope.allTutorials.indexOf($scope.tutorialToDelete);
					$scope.allTutorials.splice(index,1);

					$("#deleteModal").modal('hide');
				})		 
			}
			

			$scope.update = false;
			$scope.updateTutorial = function(tutorial) {
				$scope.tutorial = tutorial;
				CKEDITOR.instances.desText.setData(tutorial.description);
				var element = document.getElementById("updateTab");
				$scope.update = true;
				element.click();
			}
			
		} ]);