
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
						alert("success");
						$scope.message = data;
					});
					result.error(function(data, status, headers, config) {
						alert("failure message: " + JSON.stringify({
							data : data
						}));
					});

					$scope.name = '';
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

				<div class="row">
					<div class="col-lg-6">
						<section class="panel" ng-controller="submitCategory">
							<header class="panel-heading"> Basic Forms </header>
							<div class="panel-body">
								<form role="form" method="post" ng-submit="submitClick()">
									<div class="form-group">
										<label for="category">Category</label> <input type="text"
											class="form-control" id="exampleInputEmail1" name="name"
											placeholder="Category" ng-model="name">
									</div>
									<button type="submit" class="btn btn-primary">Submit</button>
								</form>

							</div>
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
