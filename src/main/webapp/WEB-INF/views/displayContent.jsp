<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html ng-app="dispalyContent">
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
<script src="<c:url value="/resources/js/dispalyContent.js"/>">
	
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
						<a href="<c:url value="/${object.argument}" />"> <img
							alt="company logo"
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
		<div ng-init="slugid = ${ slugToid }">
			<div class="row" ng-controller="content">
				<div class="col-xs-7 col-md-7 col-sm-7 col-lg-3">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">
								<strong>Filter</strong>
							</h3>
						</div>

						<ul class="list-group">
							<li class="list-group-item list-group-item-success categoryList"
								ng-repeat="n in disContent"><input type="radio"
								name="category" class="radio-primary"
								ng-click="selectTutorialContent(n.id)"> {{n.title}}</li>
							<li class="list-group-item list-group-item-success categoryList"
								ng-show="!disContent.length">Tutorial on this topic will be
								uploaded soon!!</li>
						</ul>

					</div>
				</div>

				<div class="col-xs-7 col-md-7 col-sm-7 col-lg-7">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<span class="panel-title"><strong>{{
									displayDetails.title}} </strong></span> <span class="pull-right"> {{
								displayDetails.dateCreated | date:'yyyy-MM-dd'}}</span>
						</div>
						<div class="panel-body">
							{{ displayDetails.description }}

							<div class="shareSocial">
								<div class="fb-share-button" data-type="button"></div>
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
	</div>
	   <div id="fb-root"></div>
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=439595092749423";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        jQuery(document).on('ready', function($) {
            var url = window.location;
            $('.fb-share-button').attr('data-href', url);
        });
    </script>
</body>
</html>