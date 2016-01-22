<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<jsp:include page="headerInclude.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular-route.js">
	
</script>
<script src="<c:url value="/resources/cms/myJs/category.js" />">
	
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
							<li><i class="fa fa-home"></i><a href="${pageContext.servletContext.contextPath}/cms/loginsuccess">Home</a></li>
						</ol>
					</div>
				</div>
				<!-- Basic Forms & Horizontal Forms-->
				<div class="row" ng-controller="submitCategory">
					<div class="col-lg-6">
						<section class="panel">
							<header class="panel-heading"> Basic Forms </header>
							<div class="panel-body">
								<form role="form" method="post" ng-submit="submitClick()" name="categoryForm">
									<div class="alert alert-success" ng-show="message">
										<strong>{{message }}</strong>
									</div>
									<div class="form-group" ng-class="{ 'has-error' : categoryForm.name.$invalid && !categoryForm.name.$pristine }">
										<label for="category">Category</label> <input type="text" class="form-control" id="exampleInputEmail1"
											name="name" placeholder="Category" ng-model="name" ng-minlength="3" required>
										<p ng-show="categoryForm.name.$error.minlength" class="help-block">Category is too short</p>
									</div>
									<button type="submit" class="btn btn-primary" ng-disabled="categoryForm.$invalid">Submit</button>
								</form>
							</div>
						</section>
						<section class="panel">
							<header class="panel-heading">Update Category </header>
							<div class="panel-body">
								<form role="form" method="post" ng-submit="submitEditCategory(editId)" name="categoryEditForm">
									<div class="form-group">
										<label for="category">Category</label> 
										<input type="text" class="form-control"
											name="name" ng-model="editValue" required>
									</div>
									<button type="submit" class="btn btn-primary">Submit</button>
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
												<button type="button" class="btn btn-success" ng-click="editCategory(category.name,category.id);">Edit</button>
												<button type="button" class="btn btn-danger" ng-click="deleteCategory(category.id) ">
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
