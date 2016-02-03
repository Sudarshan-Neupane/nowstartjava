<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<jsp:include page="headerInclude.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular-route.js">
	
</script>
<script src="<c:url value="/resources/cms/myJs/menu.js" />"></script>
</head>
<body ng-app="menuApp">
	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<jsp:include page="header.jsp" />
		<!--header end-->
		<!--sidebar start-->
		<jsp:include page="aside.jsp" />
		<!--sidebar end-->
		<!--main content start-->
		<section id="main-content" ng-controller="menuController">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="glyphicon glyphicon-list-alt"></i> Menu Page
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="${pageContext.servletContext.contextPath}/cms/loginsuccess">Add
									Page</a></li>
						</ol>
					</div>
				</div>
				<!-- Basic Forms & Horizontal Forms-->
				<div class="row">
					<div class="col-lg-7">
						<c:if test="${not empty messageInsert}">
							<div class="alert alert-success">
								<strong>${messageInsert}</strong>
							</div>
						</c:if>
						<section class="panel">
							<header class="panel-heading"> Basic Forms </header>
							<div class="panel-body">
								<form:form method="post" action="save_menu" modelAttribute="menu">
									<div class="form-group">
										<label class="col-sm-2 control-label">Title </label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="title" path="title" />
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2"> Description </label>
										<div class="col-sm-10">
											<textarea id="desText" name="description" path="description" class="form-control ckeditor" rows="6"></textarea>
										</div>
									</div>
									<div class="form-group">
										<input type="submit">
									</div>
								</form:form>
							</div>
						</section>
					</div>
					<div class="col-lg-5">
						<c:if test="${not empty messageUpdate}">
							<div class="alert alert-success">
								<strong>${messageUpdate}</strong>
							</div>
						</c:if>
						<section class="panel">
							<header class="panel-heading"> Display Category </header>
							<table class="table table-striped table-advance table-hover">
								<tbody>
									<tr>
										<th><i class="icon_profile"></i> S.No</th>
										<th><i class="icon_calendar"></i> Category</th>
										<th><i class="icon_cogs"></i> Action</th>
									</tr>
									<tr ng-repeat="menu in displayMenu">
										<td>{{$index + 1}}</td>
										<td>{{ menu.title }}</td>
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"
													ng-click="getDataForEdit(menu.id)">Edit</button>
												<button type="button" class="btn btn-danger" ng-click="deleteCategory(category) ">
													<span class="gicon_check_alt2"></span>Delete
												</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</section>
					</div>
					<!-- Modal  -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Edit Page</h4>
								</div>
								<div class="modal-body">
									<form method="post" action="update_menu">
										<input name="id" type="hidden" value="{{menuData.id}}" ng-model="menuData.id">
										<div class="form-group">
											<label for="title-name" class="control-label">Title :</label> <input type="text" class="form-control"
												id="recipient-name" name="title" ng-model="menuData.title">
										</div>
										<div class="form-group">
											<label for="title-name" class="control-label">Title :</label>
											<textarea id="desText" name="description" path="description" class="form-control ckeditor" rows="6">{{menuData.title}}</textarea>
										</div>
										<div class="form-group">
											<input type="submit" class="btn-primary">
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- container section end -->
	<!-- javascripts -->
	<jsp:include page="footerJs.jsp"></jsp:include>
	<script type="text/javascript" src="<c:url value="/resources/cms/assets/ckeditor/ckeditor.js"/>"></script>
</body>
</html>
