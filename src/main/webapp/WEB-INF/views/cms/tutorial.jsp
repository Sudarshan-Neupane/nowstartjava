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
							<li><i class="fa fa-home"></i><a
								href="${pageContext.servletContext.contextPath}/cms/loginsuccess">Home</a></li>
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
													href="<c:url value='/cms/tutorials/${loginUser.id}'/>"><i
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
													href="<c:url value='/cms/tutorials/${loginUser.id}'/>"><i
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
				
			</section>
			<!--main content end-->
		</section>
		<jsp:include page="footerJs.jsp"></jsp:include>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/cms/assets/ckeditor/ckeditor.js"></script>
</body>
</html>
