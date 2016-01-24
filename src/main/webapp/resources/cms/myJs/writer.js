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
					var userId = $('#userId').val();
					var categoryIds=$('#category').val();
					var user = {
							firstName : $scope.firstName,
							lastName : $scope.lastName,
							email : $scope.username,
							password : $scope.password,
							phoneNumber : $scope.phoneNumber,
					};
					var dataObj = {
							id : userId,
							user : user,
							categories : categoryIds,
						};
					
						var result = $http.post("/tutorials/cms/writers/add", dataObj);
						/*  */
						result.success(function(data, status, headers, config) {
							/*$("#userForm").hide();*/
							$("#myModal").modal("hide");
							getWriters();
							$scope.method_update = false;
							$scope.success = true;
							$scope.message = "Writer added successfully";
						});
						result.error(function(data, status, headers, config) {
							$scope.failure = true;
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
				
				//Delete Writer 
				$scope.removeWriter = function(id) {
					var deleteData = $http({
						method : 'DELETE',
						url : '/tutorials/cms/writers/delete/' + id
					})
					deleteData.success(function(data, status, header, config) {
						getWriters();
						$scope.message = "Writer was removed successfully";
					})
					deletedata.error(function(data, status, headers, config) {
						$scope.message ="error while data delete";
					});
				}
				
				$scope.getUser = function(id) {
					var user = $http({
						method:'GET',
						url: '/tutorials/cms/writers/get_one/'+id
					});
					user.success(function(data,status,header,config) {
						$scope.method_update = true;
						$scope.id = data.id;
						$scope.firstName =data.firstName;
						$scope.lastName = data.lastName;
						$scope.phoneNumber = data.phoneNumber;
						$scope.password = data.password;
						$scope.username = data.email;
						
						$("#myModal").modal("show");
					});
				};
				
				
			} ]);
	
	