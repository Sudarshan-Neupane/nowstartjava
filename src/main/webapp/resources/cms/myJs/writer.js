var app = angular.module("writerApp", [ 'ngRoute' ]);
	app.controller('submitWriter', [ '$scope', '$http', '$location',
			'$route',
			function($scope, $http, $location, $route) {
				$("#addUserBtn").on("click", function( e ) {
					$("#userForm").show();
			        e.preventDefault();

			        $("body, html").animate({ 
			            scrollTop: $( $(this).attr('href') ).offset().top 
			        }, 100);

			    });
				
				$scope.addWriter = function(){
					var categoryIds=$('#category').val();
					alert(categoryIds);
					var user = {
							firstName : $scope.firstName,
							lastName : $scope.lastName,
							email : $scope.username,
							password : $scope.password,
							phoneNumber : $scope.phoneNumber,
					};
					var dataObj = {
							user : user,
							categories : categoryIds,
						};
					
						var result = $http.post("/tutorials/cms/writers/add", dataObj);
						/*  */
						result.success(function(data, status, headers, config) {
							$("#userForm").hide();
							$scope.message = "Writer added successfully";
						});
						result.error(function(data, status, headers, config) {
							$scope.message = "User with this email already exists.";
						});
				}
				
				getWriters();
				function getWriters(){
					var writers = $http({
	                    method : 'GET',
	                    url : '/tutorials/cms/writers/get_all'
	                });
	                writers.success(function(data, status, header, config) {
	                    $scope.writers = data;
	                });
				};
				
				//Delete Category 
				$scope.deleteCategory = function(id) {
					var deletedata = $http({
						method : 'DELETE',
						url : '/tutorials/deleteCategory/' + id
					})
					deletedata.success(function(data, status, header, config) {
						$location.path('/subjects');
						var index = $scope.displayCategory.indexOf(id);
						$scope.displayCategory.splice(index, 1);
					})
					deletedata.error(function(data, status, headers, config) {
						alert("error while data delete")
					});
				}
			} ]);