var app = angular.module("writerApp", [ 'ngRoute' ]);
	app.controller('submitWriter', [ '$scope', '$http', '$location',
			'$route',
			function($scope, $http, $location, $route) {
				
				$scope.addWriterForm = function() {
					$scope.action = "Add ";
					$scope.id = '';
					$scope.firstName ='';
					$scope.lastName = '';
					$scope.phoneNumber = '';
					$scope.password = '';
					$scope.username = '';
					$scope.message = '';
					$('#myModal').modal("show");
				}
				
				$scope.addWriter = function(){
					var categoryIds=$('#category').val();
					var user = {
							firstName : $scope.firstName,
							lastName : $scope.lastName,
							email : $scope.username,
							password : $scope.password,
							phoneNumber : $scope.phoneNumber,
					};
					var dataObj = {
							id : $scope.id,
							method : $scope.action,
							user : user,
							categories : categoryIds,
						};
					
						var result = $http.post("/tutorials/cms/writers/add", dataObj);
						/*  */
						result.success(function(data, status, headers, config) {
							/*$("#userForm").hide();*/
							$("#myModal").modal("hide");
							getWriters();
							$scope.success = true;
							if($scope.action == 'Add '){
								$scope.message = "Writer added successfully";
							}else{
								$scope.message = "Writer updated successfully";
							}
							
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
						$scope.success = true;
						$scope.message = "Writer was removed successfully";
					})
					deletedata.error(function(data, status, headers, config) {
						$scope.success = false;
						$scope.message ="error while data delete";
					});
				}
				
				$scope.getUser = function(id) {
					var user = $http({
						method:'GET',
						url: '/tutorials/cms/writers/get_one/'+id
					});
					user.success(function(data,status,header,config) {
						$scope.action = "Update ";
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
	
	