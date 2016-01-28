<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<jsp:include page="headerInclude.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular-route.js"></script>
<script src="<c:url value="/resources/cms/myJs/tutorial.js" />"></script>
</head>
<body ng-app="tutorial">
	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<jsp:include page="header.jsp" />
		<!--sidebar start-->
		<jsp:include page="aside.jsp" />
		<!--main content start-->
		<section id="main-content" ng-controller="tutorialController">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-file-text-o"></i> Tutorial
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
							<li><i class="icon_document_alt"></i>Forms</li>
							<li><i class="fa fa-file-text-o"></i>Form elements</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Advanced Table </header>
							<table class="table table-striped table-advance table-hover">
								<tbody>
									<tr>
										<th><i class="icon_profile"></i> S.No</th>
										<th><i class="icon_profile"></i> Category</th>
										<th><i class="icon_pin_alt"></i> Content Writer</th>
										<th><i class="icon_mobile"></i> Status</th>
										<th><i class="icon_cogs"></i> Action</th>
									</tr>
									<tr ng-repeat="user in disUser">
										<td>{{ $index +1 }}</td>
										<td>
											<li ng-repeat="cat in user.categories" ng-click="displayTutorial(cat.id)">{{ cat.name }}</li>
										</td>							
										<td>{{ user.firstName }}</td>
										<td>Active</td>
										<td>
											<div class="btn-group">
												<a class="btn btn-primary" href="#" ng-click="tutorialsByWriter(user.id)"><i class="icon_plus_alt2"></i></a>
												 <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a> 
												 <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Form Elements </header>
							<div class="panel-body">
								<form class="form-horizontal " method="get">
									<div class="form-group">
										<label class="col-sm-2 control-label">Title </label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="titile" ng-model="title">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2" for="inputSuccess">Control sizing</label>
										<div class="col-lg-10">
											<select class="form-control m-bot15">
												<option ng-repeat="category in displayCategory">{{ category.name }}</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2">Description </label>
										<div class="col-sm-10">
											<textarea class="form-control ckeditor" name="description" ng-model="description" rows="6"></textarea>
										</div>
									</div>
								</form>
							</div>
						</section>
					</div>
				</div>
			</section>
			
								<!-- dialog -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-sm">
								<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="padding: 15px 50px">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Tutorials By Content Writer</h4>
							</div>
							<table class="table table-striped table-advance table-hover">
								<tbody>
									<tr>
										<th><i class="icon_profile"></i> S.No</th>
										<th><i class="icon_profile"></i> Title</th>
										<th><i class="icon_calendar"></i> Description</th>
										<security:authorize access="hasRole('ROLE_ADMIN')">
											<th><i class="icon_cogs"></i> Action</th>
										</security:authorize>
									</tr>
									<tr ng-repeat="tutorial in tutorials">
										<td>{{$index + 1}}</td>
										<td>{{tutorial.title}}</td>
										<td>{{tutorial.description}}</td>
										<td>
											<div class="btn-group">
												<a href="<c:url value='contents/{{tutorial.id}}'/>" class="btn btn-success"
												>Content</a>
												<button type="button" class="btn btn-success"
												ng-click="#">Edit</button>
												<button type="button" class="btn btn-danger"
													ng-click="#">
													<span class="gicon_check_alt2"></span>Delete
												</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
						</div>
					</div>
					<!-- dialog -->
			
		</section>
		<!--main content end-->
	</section>
	<jsp:include page="footerJs.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/cms/assets/ckeditor/ckeditor.js"></script>
</body>
</html>
