<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html ng-app="myapp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>~~ nowstartjava.com ~~</title>
<link rel="shortcut icon" type="image/png"
	href="<c:url value="/resources/images/logo.png" />" />
<link rel="stylesheet"
	href="https://getbootstrap.com/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script src="<c:url value="/resources/js/angular_main.js" />">
	
</script>
<style type="text/css">
</style>

</head>
<body>
	<div class="container">
		<div id="toppadingmenu"></div>
		<div class="row">
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="header">
					<div class="col-lg-3">
						<a href="<c:url value="/${object.argument}" />"> <img alt="company logo"
							src="<c:url value="/resources/images/logo.png" />">
						</a>
					</div>
					<div class="col-lg-9">
						<div class="menuBar">
							<div class="menu">
								<a href="#">Home </a>
							</div>
							<div class="menu">
								<a href="#">About Us</a>
							</div>
							<div class="menu">
								<a href="#">Contact</a>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</div>

		<div class="row" ng-controller="category">
			<div class="col-xs-7 col-md-7 col-sm-7 col-lg-3">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">Filter</h3>
					</div>

					<ul class="list-group">
						<li class="list-group-item list-group-item-success categoryList"
							ng-click="selectCategory(0)"><input type="radio"
							name="category" class="radio-primary" checked="checked">All</li>
						<li class="list-group-item list-group-item-success categoryList"
							ng-repeat="n in category"><input type="radio"
							name="category" class="radio-primary"
							ng-click="selectCategory(n.id)"> {{n.name}}</li>
					</ul>

				</div>
			</div>

			<div class="col-xs-7 col-md-7 col-sm-7 col-lg-7">
				<div class="panel panel-success"
					ng-repeat="tutorials in displayTutorial">
					<div class="panel-heading">
						<span class="panel-title">{{ tutorials.title}}</span> <span
							class="pull-right"> {{ tutorials.dateCreated |
							date:'yyyy-MM-dd'}}</span>
					</div>
					<div class="panel-body">
						{{ tutorials.description }}

						<div class="shareSocial">
							<c:set var="contextPath"
								value="${pageContext.request.contextPath}" />
							<a href="${contextPath}/content/{{tutorials.slug}}">
								<button type="button" class="btn btn-primary">Learn
									More</button>
							</a>
							<%--  <img alt="share Facebook" src="<c:url value="/resources/images/share_fb.png" />">
                     <img alt="share Facebook" src="<c:url value="/resources/images/twitter-share.png" />">
                     --%>
						</div>
					</div>

				</div>

			</div>
			<div class="col-xs-2 col-md-2 col-sm-2 col-lg-2">
				<div class="panel panel-primary">
					<img alt="company logo"
						src="<c:url value="/resources/images/three.jpg" />">
				</div>
			</div>
		</div>
	</div>
</body>
</html>