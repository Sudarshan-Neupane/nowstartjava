<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">
<head>
<jsp:include page="headerInclude.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular-route.js"></script>
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
							<header class="panel-heading"> Tutorials and User Table
							</header>
							<div ng-if="edited" class="alert alert-success"
								ng-show="message">
								<strong>{{message }}</strong>
							</div>
							
							<table class="table table-striped table-advance table-hover"  ng-init=" currentUser = ${loginUser.id}">
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
											<li ng-repeat="cat in user.categories"
											ng-click="displayTutorial(cat.id)">{{ cat.name }}</li>
										</td>
										<td>{{ user.firstName }}</td>
										<td>Active</td>
										
										<security:authorize access="hasRole('ROLE_ADMIN')">
										<td>
										<div class="btn-group">
												<a id="allTuts" class="btn btn-primary"
													href="#" ng-click="tutorialsByWriter(user)"><i
													class="icon_plus_alt2"></i></a> <a class="btn btn-success"
													href="#"><i class="icon_check_alt2"></i></a> <a
													class="btn btn-danger" href="#"><i
													class="icon_close_alt2"></i></a>
											</div>
											</td>
										</security:authorize>
										
										<security:authorize access="hasRole('ROLE_WRITER')">
										<td ng-if = "currentUser == user.id ">
											<div class="btn-group">
												<a id="allTuts" class="btn btn-primary"
													href="#" ng-click="tutorialsByWriter(user)"><i
													class="icon_plus_alt2"></i></a> <a class="btn btn-success"
													href="#"><i class="icon_check_alt2"></i></a> <a
													class="btn btn-danger" href="#"><i
													class="icon_close_alt2"></i></a>
											</div>
										</td>
										</security:authorize>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
				</div>
				<!-- dialog listing all turorial -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog modal-lg">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header" style="padding: 15px 50px">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Tutorials By Content Writer
								|<a href="#" ng-click="addTutorial()" > Add Tutorial</a></h4>
							</div>
							<div ng-show="deleted" class="alert alert-success">
								<strong>{{delMessage }}</strong>
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

									<tr ng-repeat="tutorial in tutorials track by $index">
										<td>{{$index + 1}}</td>
										<td>{{tutorial.title}}</td>
										<td>{{tutorial.description}}</td>
										<td>
											<div class="btn-group">
												<a href="<c:url value='contents/{{tutorial.id}}'/>"
													class="btn btn-success">Content</a>
												<button type="button" class="btn btn-success"
													ng-click="editTutorial(tutorial)">Edit</button>
												<button type="button" class="btn btn-danger"
													ng-click="deleteTutorial(tutorial)">
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
				<!--end of dialog display all tutoral-->
				
				<!-- tutorial update form -->
				<div class="row" id="tutorialForm" ng-show="edit">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Update Form</header>
							<div class="panel-body">
								<form class="form-horizontal " ng-submit="editTutorialSubmit()" method="post">
									<security:csrfInput/>
									<div class="form-group">
										<label class="col-sm-2 control-label">Title </label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="title" ng-model="tutorial.title">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2">Description </label>
										<div class="col-sm-10">
											<textarea id="desText" ng-model="tutorial.description" class="form-control ckeditor" name="description" rows="6"></textarea>
										</div>
									</div>
									<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
											<input type="hidden" name="id" ng-model="tutorial.id" value="{{tutorial.id}}">
												<button type="submit" class="btn btn-default">Submit</button>
											</div>
									</div>
								</form>
							</div>
						</section>
					</div>
				</div>
				<!-- end of dialog for form -->
				
				<!-- tutorial add form -->
				<div class="row" id="addTutorialForm" ng-show="add">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Add Tutorial Form</header>
							<div class="panel-body">
								<form class="form-horizontal " ng-submit="addTutorialSubmit()">
									<security:csrfInput/>
									<div class="form-group">
										<label class="col-sm-2 control-label">Title </label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="title" ng-model="tutorial.title">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2" for="inputSuccess">Category</label>
										<div class="col-lg-10">
											<select class="form-control m-bot15" ng-model="tutorial.category.id">
												<option value="">- Choose Cateogry -</option>
												<option ng-repeat="category in categoryForWriter" value="{{category.id}}">{{ category.name }}</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2">Description </label>
										<div class="col-sm-10">
											<textarea id="addDesText" ng-model="tutorial.description" class="form-control ckeditor" name="description" rows="6"></textarea>
										</div>
									</div>
									<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<button type="submit" class="btn btn-default">Submit</button>
											</div>
									</div>
								</form>
							</div>
						</section>
					</div>
				</div>
				<!-- end of dialog form for add-->

			</section>
			<!--main content end-->
		</section>
		<jsp:include page="footerJs.jsp"></jsp:include>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/cms/assets/ckeditor/ckeditor.js"></script>
</body>
</html>
