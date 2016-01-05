
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="headerInclude.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script type="text/javascript">
	var app = angular.module("categoryApp", []);
	app.controller('submitCategory', [ '$scope', '$http',
			function($scope, $http) {
				$scope.submitClick = function() {
					var dataObj = {
						name : $scope.name
					};
					var result = $http.post("/tutorials/category", dataObj);
					result.success(function(data, status, headers, config) {
						$scope.message = "Data Inserted successfully";
					});
					result.error(function(data, status, headers, config) {
						$scope.message = "Error while inserting the data.";
					});

					$scope.name = '';
				}
				var category = $http({
					method : 'GET',
					url : '/tutorials/category'
				})
				category.success(function(data, status, header, config) {
					$scope.displayCategory = data;
				});
				//Delete Category 
				$scope.deleteCategory = function(id) {
					var deletedata = $http({
						method : 'DELETE',
						url : '/tutorials/deleteCategory/' + id
					})
					deletedata.success(function(data, status, header, config) {
						$scope.deletevlaue =data;
					})
					deletedata.error(function(data, status, headers, config) {
						alert("error while data delete")
					});
				}
			} ]);
</script>
</head>
<body ng-app="categoryApp">

	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<jsp:include page="header.jsp" />
		<!--header end-->

		<!--sidebar start-->
		<jsp:include page="aside.jsp" />
		<!--sidebar end-->

		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="glyphicon glyphicon-list-alt"></i> Category
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a
								href="${pageContext.servletContext.contextPath}/cms/loginsuccess">Home</a></li>
						</ol>
					</div>
				</div>
				<!-- Basic Forms & Horizontal Forms-->

				<div class="row" ng-controller="submitCategory">
					<div class="col-lg-6">
						<section class="panel">
							<header class="panel-heading"> Basic Forms </header>
							<div class="panel-body">
								<form role="form" method="post" ng-submit="submitClick()"
									name="categoryForm">
									<div class="alert alert-success" ng-show="message">
										<strong>{{message }}</strong>
									</div>
									<div class="form-group"
										ng-class="{ 'has-error' : categoryForm.name.$invalid && !categoryForm.name.$pristine }">
										<label for="category">Category</label> <input type="text"
											class="form-control" id="exampleInputEmail1" name="name"
											placeholder="Category" ng-model="name" ng-minlength="3"
											required>
										<p ng-show="categoryForm.name.$error.minlength"
											class="help-block">Category is too short</p>
									</div>

									<button type="submit" class="btn btn-primary"
										ng-disabled="categoryForm.$invalid">Submit</button>
								</form>


							</div>
						</section>
					</div>
					<div class="col-lg-6">
						<section class="panel">
							<header class="panel-heading"> Display Category </header>

							<table class="table table-striped table-advance table-hover">
								<tbody>
									<tr>
										<th><i class="icon_profile"></i> S.No</th>
										<th><i class="icon_calendar"></i> Category</th>
										<th><i class="icon_cogs"></i> Action</th>
									</tr>
									<tr ng-repeat="category in displayCategory">
										<td>{{$index + 1}}</td>
										<td>{{ category.name }}</td>
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-success">Edit</button>
												<button type="button" class="btn btn-danger"
													ng-click="deleteCategory(category.id)">
													<span class="gicon_check_alt2"></span>Delete
												</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
				</div>


			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- container section end -->
	<!-- javascripts -->
	<jsp:include page="footerJs.jsp"></jsp:include>


</body>
</html>
