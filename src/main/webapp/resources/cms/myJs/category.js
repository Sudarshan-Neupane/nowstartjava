var app = angular.module("categoryApp", [ 'ngRoute' ]);
	app.controller('submitCategory', [ '$scope', '$http', '$location',
			'$route',
			function($scope, $http, $location, $route) {
				$scope.submitClick = function() {
					var dataObj = {
						name : $scope.name
					};
					var result = $http.post("/tutorials/category", dataObj);
					/*  */
					result.success(function(data, status, headers, config) {
						//$scope.displayCategory.push(dataObj);
						getCat();
						$scope.message = "Data Inserted successfully";
					});
					result.error(function(data, status, headers, config) {
						$scope.message = "Error while inserting the data.";
					});

					$scope.name = '';
				}
				
				getCat();
				function getCat(){
					var category = $http({
	                    method : 'GET',
	                    url : '/tutorials/category'
	                });
	                category.success(function(data, status, header, config) {
	                    $scope.displayCategory = data;
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