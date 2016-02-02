<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">
<head>
<jsp:include page="headerInclude.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular-route.js"></script>
<script src="<c:url value="/resources/cms/myJs/tutorial-content.js" />">
</script>
<link rel="stylesheet" href="/tutorials/resources/css/wall.css">

</head>
<body ng-app="tutorialContent">
	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<jsp:include page="header.jsp" />
		<!--sidebar start-->
		<jsp:include page="aside.jsp" />
		<!--main content start-->
		<section id="main-content" ng-controller="tutorialContentController">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-file-text-o"></i> Tutorial
						</h3>
						<ul class="nav nav-tabs" id="tabs">
							<li><a
								href="${pageContext.servletContext.contextPath}/cms/tutorials/${loginUser.id}">Home</a></li>
							<li class="active"><a data-toggle="tab" href="#contents">Contents</a></li>
							<li><a data-toggle="tab" href="#addContent">Add Content</a></li>
							<li><a id="updateTab" ng-show="update" data-toggle="tab" href="#updateContent">Update Content</a></li>
						</ul>
					</div>
				</div>
				<div class="tab-content">
				<div class="tab-pane fade in active row" id="contents">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Tutorial Contents </header>
							<ul id="sortable" class="list-unstyled" style="list-style: none;">
								<c:forEach items="${contents}" var="content">

									<li class="list-todo">
										<div id="main-content-${content.id}">
											<div class="todoheader">
												<input type="hidden" id="content_id" value="${content.id }">
												<!-- check if question belongs to current user -->
												<security:authorize access="isAuthenticated()">
													<div class="deleteimage" id="${content.id}" ng-click="deleteTutorialContent(${content.id})">
														<img src="<c:url value="/resources/images/delete.png" />">
													</div>
													<div class="update-question" id="${content.id}" ng-click="updateTutorialContent(${content.id})">
														<img src="<c:url value="/resources/images/edit.png" />">
													</div>
												</security:authorize>

												<div class="todoimg">
													<img src="<c:url value="/resources/images/todo.png" />" />
												</div>
												<div class="userinfo">
													<span>${content.dateCreated}</span>
												</div>
												<div>
													<div id="heading">
														<h4>${content.title}</h4>
													</div>
													<div id="question-${content.id}">

														${content.description}</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
							<!-- <div class="no-task">No Task to do yet</div> -->

						</section>
					</div>
				</div>
				
				<!-- add content form div -->
				<div class="tab-pane fade row" id="addContent">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Add Tutorial Content </header>
								<div class="panel-body">
									<form:form modelAttribute="tutorialContent" action="add"
										class="form-horizontal " method="post">
										<div class="form-group">
											<label class="col-sm-2 control-label">Title </label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="title">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2">Description </label>
											<div class="col-sm-10">
												<textarea class="form-control ckeditor" name="description" rows="6"></textarea>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
											<input type="hidden" name="tutorials.id" value="${tutorialId}">
												<button type="submit" class="btn btn-default">Submit</button>
											</div>
										</div>
									</form:form>
								</div>
							</section>
					</div>
				</div>
				<!-- end of  content form div -->
				
				<!-- update content form div -->
				<div class="tab-pane fade row" id="updateContent">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Update Tutorial Content </header>
								<div class="panel-body">
									<form action="update" class="form-horizontal " method="post">
										<security:csrfInput/>
										<div class="form-group">
											<label class="col-sm-2 control-label">Title </label>
											<div class="col-sm-10">
												<input type="hidden" name="id" value="{{tutorialContent.id}}">
												<input type="hidden" name="tutorials.id" value="{{tutorialContent.tutorials.id}}">												
												<input type="text" ng-model="tutorialContent.title" class="form-control" name="title">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2">Description </label>
											<div class="col-sm-10">
												<textarea id="desText" class="form-control ckeditor" name="description" rows="6">
												
												</textarea>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
											<input type="hidden" name="tutorials.id" value="${tutorialId}">
												<button type="submit" class="btn btn-default">Submit</button>
											</div>
										</div>
									</form>
								</div>
							</section>
					</div>
				</div>
				<!-- end of update content form div -->
				
				</div>
				<!-- end of tab div -->
			</section>

			<!--Delete Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Delete Content</h4>
						</div>
						<div class="modal-body">
							<p class="delete-message">Do you really want to delete the content?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								ng-click="deleteTutorialContentConfirm()">Delete</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
				</div>				
				<!-- end of delete modal -->
		</section>
		<!--main content end-->
	</section>
	<jsp:include page="footerJs.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/cms/assets/ckeditor/ckeditor.js"></script>
</body>
</html>
