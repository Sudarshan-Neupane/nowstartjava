<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="headerInclude.jsp"></jsp:include>
 <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-route.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular-sanitize.js"></script>
<script src="<c:url value="/resources/cms/myJs/message/message.js" />"></script>
<script src="<c:url value="/resources/cms/myJs/message/controller.js" />"></script>
<script src="<c:url value="/resources/cms/myJs/message/factory.js" />"></script>
<script src="<c:url value="/resources/cms/myJs/message/directives/EmailDrctv.js" />"></script>
<script src="<c:url value="/resources/cms/myJs/message/directives/InboxDrctv.js" />"></script>
<link rel="stylesheet" href="/resources/cms/myCss/email.css">


</head>
<body ng-app="EmailApp">
	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<jsp:include page="header.jsp" />
		<!--sidebar start-->
		<jsp:include page="aside.jsp" />
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-file-text-o"></i> Messsage
						</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">

						<main class="main" role="main">
							<div ng-view class="flex"></div>
						</main>
					</div>
				</div>

			</section>
			<!--main content end-->
		</section>
		</section>
		<jsp:include page="footerJs.jsp"></jsp:include>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/cms/assets/ckeditor/ckeditor.js"></script>
</body>
</html>
