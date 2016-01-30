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
			
			$scope.deleted=false;
			$scope.deleteTutorial = function(item) {
				var deleteTut =$http( {
						method : 'GET',
						url:'/tutorials/cms/tutorials/delete/'+item.id
				})
				deleteTut.success(function(data,status,header,config){
					$scope.deleted = true;
					$scope.delMessage = "Deleted Successfully";
					var index = $scope.tutorials.indexOf(item);
					$scope.tutorials.splice(index,1);
				})		 
			}
			
			$scope.edit = false;
			$scope.editTutorial = function(tutorial) {
//				alert(tutorial.id);
				$scope.edit = true;
				$scope.add = false;
				$scope.tutorial = tutorial;
				CKEDITOR.instances.desText.setData(tutorial.description);
				$("#myModal").modal("hide");
			}
			
			$scope.edited = false;
			$scope.editTutorialSubmit = function() {
				var tutorial = $scope.tutorial;
				var value = CKEDITOR.instances.desText.getData();
				tutorial.description = value;
//				alert(tutorial.description);
				var tutorialSubmit = $http.post('/tutorials/cms/tutorials/update/',tutorial);
				
				tutorialSubmit.success(function(data, status, headers, config) {
					$scope.message = "Updated Successfully!!!";
					$scope.edited = true;
					$scope.edit = false;
				});
			}
			
			$scope.add = false;
			$scope.addTutorial = function() {
				$scope.add = true;
				$scope.edit = false;
				$scope.tutorial = null;
				$("#myModal").modal("hide");
			}
			
			$scope.added =false;
			$scope.addTutorialSubmit = function() {
				var value = CKEDITOR.instances.addDesText.getData();
				var tutorial = $scope.tutorial;
				tutorial.description = value;
//				alert(tutorial.description);
				var tutorialSubmit = $http.post('/tutorials/cms/tutorials/add/',tutorial);
				
				tutorialSubmit.success(function(data, status, headers, config) {
					$scope.message = "Added Successfully!!!";
					$scope.added = true;
					$scope.edit = false;
					$scope.add = false;
				});
				
				tutorialSubmit.error(function(data, status, headers, config) {
					$scope.message = "Added not successful!!!";
				});
			}
			
		} ]);