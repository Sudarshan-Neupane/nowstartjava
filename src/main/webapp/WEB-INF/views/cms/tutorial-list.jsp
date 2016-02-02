<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">
<head>
<jsp:include page="headerInclude.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular-route.js"></script>
<script src="<c:url value="/resources/cms/myJs/tutorial.js" />">
</script>
<link rel="stylesheet" href="/tutorials/resources/css/wall.css">

</head>
<body ng-app="tutorial">
	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<jsp:include page="header.jsp" />
		<!--sidebar start-->
		<jsp:include page="aside.jsp" />
		<!--main content start-->
		<section id="main-content" ng-controller="tutorialController" ng-init="tutorialsForOne(${loginUser.id})">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-file-text-o"></i> Tutorial
						</h3>
						<ul class="nav nav-tabs" id="tabs">
							<li class="active"><a data-toggle="tab" href="#tutorials">Tutorials</a></li>
							<li><a data-toggle="tab" href="#addTutorial">Add Tutorial</a></li>
							<li><a id="updateTab" ng-show="update" data-toggle="tab" href="#updateTutorial">Update Tutorial</a></li>
						</ul>
					</div>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade in active row" id="tutorials">
						<div class="col-lg-12">
							<section class="panel">
								<header class="panel-heading"> Tutorial Contents </header>
								<c:if test="${message !=  null }">
									<div ng-show="!deleted" class="alert alert-success">
										<strong>${message}</strong>
									</div>
								</c:if>

								<div ng-show="deleted" class="alert alert-success">
									<strong>{{delMessage}}</strong>
								</div>
								<table class="table table-striped table-advance">
									<tbody>
										<tr>
											<th><i class="icon_profile"></i> S.No</th>
											<th><i class="icon_profile"></i> Title</th>
											<th><i class="icon_calendar"></i> Description</th>
											<th><i class="icon_cogs"></i> Action</th>
										</tr>

										<tr ng-repeat="tutorial in allTutorials track by $index">
											<td>{{$index + 1}}</td>
											<td>{{tutorial.title}}</td>
											<td>{{tutorial.description}}</td>
											<td>
												<div class="btn-group">
													<a href="<c:url value='contents/{{tutorial.id}}'/>"
														class="btn btn-success btn-block">Content</a>
													<button type="button" class="btn btn-success btn-block" 
														ng-click="updateTutorial(tutorial)">Edit</button>
													<button type="button" class="btn btn-danger btn-block"
														ng-click="deleteModal(tutorial)">
														<span class="gicon_check_alt2"></span>Delete

													</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<!-- <div class="no-task">No Task to do yet</div> -->

							</section>
						</div>
					</div>
					<!--Delete Modal -->
					<div class="modal fade" id="deleteModal" role="dialog">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Delete Content</h4>
								</div>
								<div class="modal-body">
									<p class="delete-message">Do you really want to delete the
										content?</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										ng-click="deleteTutorial()">Delete</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end of delete modal -->

					<!-- add content form div -->
					<div class="tab-pane fade row" id="addTutorial">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Add Tutorial Form</header>
							
							<div class="panel-body">
								<form:form modelAttribute="tutorial" class="form-horizontal " action="add" method="post">
									<security:csrfInput/>
									<div class="form-group">
										<label class="col-sm-2 control-label">Title </label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="title" required="required">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2" for="inputSuccess">Category</label>
										<div class="col-lg-10">
											<!-- <select class="form-control m-bot15"
												ng-model="tutorial.category.id">
												<option value="">- Choose Cateogry -</option>
												<option ng-repeat="category in categoryForWriter"
													value="{{category.id}}">{{ category.name }}</option>
											</select> -->

											<form:select class="form-control m-bot15" id="category" path="category.id">
												<form:option value="0" label="--Select Question Type" />
												<form:options items="${loginUser.categories}" itemLabel="name"
													itemValue="id" />
											</form:select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2">Description </label>
										<div class="col-sm-10">
											<textarea id="addDesText" class="form-control ckeditor"
												name="description" rows="6"></textarea>
										</div>
									</div>
									<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
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
				<div class="tab-pane fade row" id="updateTutorial">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading"> Update Tutorial Content </header>
								<div class="panel-body">
									<form action="update" class="form-horizontal " method="post">
										<security:csrfInput/>
										<div class="form-group">
										<input type="hidden" name="id" value="{{tutorial.id}}">
											<label class="col-sm-2 control-label">Title </label>
											<div class="col-sm-10">	
												<input type="text" ng-model="tutorial.title" class="form-control" name="title">
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

			<!-- Modal -->
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
		</section>
		<!--main content end-->
	</section>
	<jsp:include page="footerJs.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/cms/assets/ckeditor/ckeditor.js"></script>
</body>
</html>
