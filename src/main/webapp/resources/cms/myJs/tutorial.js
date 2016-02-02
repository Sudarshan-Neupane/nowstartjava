var app = angular.module("tutorial", [ 'ngRoute' ]);
app.controller('tutorialController', [ '$scope', '$http', '$location', '$route',
		function($scope, $http, $location, $route) {
			var category = $http({
				method : 'GET',
				url : '/tutorials/category'
			});
			category.success(function(data, status, header, config) {
				$scope.displayCategory = data;
			});
			// get tutorials for the database

			var tutorials = $http({
				method : 'GET',
				url : '/tutorials/cms/writers/get_all'
			});
			tutorials.success(function(data, status, header, config) {
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
					url:'/tutorials/tutorials/by_writer/'+id
				})
				tutorials.success(function(data,status,header,config) {
//					alert(data[0].description);
					$scope.allTutorials = data
				})
			}
			/*
			//get tutorials for given writer
			$scope.tutorialsByWriter = function(user) {
//				alert(id);
				$scope.categoryForWriter = user.categories;
//				alert($scope.categoryForWriter[0].name);
				var displayTuts = $http({
					method : 'GET',
					url:'/tutorials/tutorials/by_writer/'+user.id
				})
				displayTuts.success(function(data,status,header,config){
//					alert(data.title);
					$scope.tutorials=data;
					$scope.message ='';
					$("#myModal").modal("show");
				})
				displayTuts.error(function(data,status,header,config){
					$scope.message = "No tutorials found for that writer";
					$("#myModal").modal("show");
				})
			}
			*/
			$scope.deleteModal = function(tutorial) {
				$scope.tutorialToDeleteId = tutorial.id;
				$("#deleteModal").modal("show");
			}
			
			$scope.deleted=false;
			$scope.deleteTutorial = function() {
				var deleteTut =$http( {
						method : 'GET',
						url:'/tutorials/cms/tutorials/delete/'+$scope.tutorialToDeleteId
				})
				deleteTut.success(function(data,status,header,config){
					$("#deleteModal").modal('hide');
					$scope.deleted = true;
					$scope.delMessage = "Deleted Successfully";
					var index = $scope.allTutorials.indexOf(item);
					$scope.allTutorials.splice(index,1);
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