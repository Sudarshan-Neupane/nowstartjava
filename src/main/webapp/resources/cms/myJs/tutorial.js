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
			$scope.tutorialsByWriter = function(id) {
//				alert(id);
				var displayTuts = $http({
					method : 'GET',
					url:'/tutorials/tutorials/by_writer/'+id
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
			
			$scope.deleteTutorial = function(item) {
				var deleteTut =$http( {
						method : 'GET',
						url:'/tutorials/cms/tutorials/delete/'+item.id
				})
				deleteTut.success(function(data,status,header,config){
					$scope.message = "Deleted Successfully";
					var index = $scope.tutorials.indexOf(item);
					$scope.tutorials.splice(index,1);
				})		 
			}
			
			$scope.editTutorial = function(tutorial) {
				$("#myModal").modal('hide');
				
				$scope.tutorial = tutorial;
				CKEDITOR.instances.desText.setData(tutorial.description);
				
				$("#tutorialForm").show();
		        e.preventDefault();

		        $("body, html").animate({ 
		            scrollTop: $( $(this) ).offset().top 
		        }, 100);
			}
		} ]);