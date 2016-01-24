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
		</section>
		<!--main content end-->
	</section>
	<jsp:include page="footerJs.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/cms/assets/ckeditor/ckeditor.js"></script>
</body>
</html>
