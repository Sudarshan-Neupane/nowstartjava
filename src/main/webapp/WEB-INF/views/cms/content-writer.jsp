<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">
<head>

<jsp:include page="headerInclude.jsp"></jsp:include>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular-route.js">
</script>
<script src="<c:url value="/resources/cms/myJs/writer.js" />">
</script>
<script src="<c:url value="/resources/cms/myCss/main.css"/>"></script>
 

</head>
<body ng-app="writerApp">

	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<jsp:include page="header.jsp" />
		<!--header end-->

		<!--sidebar start-->
		<jsp:include page="aside.jsp" />
		<!--sidebar end-->

		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="glyphicon glyphicon-list-alt"></i> Content Writer
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a
								href="${pageContext.servletContext.contextPath}/cms/loginsuccess">Home</a></li>
						</ol>
					</div>
				</div>
				<!-- Basic Forms & Horizontal Forms-->

				<div class="row" ng-controller="submitWriter">
					
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading">
								<span class="em">Content Writer List </span>| <a id="addUserBtn" class="btn btn-info"
											data-toggle="modal"	data-target="#myModal">Add
									Writer</a>
							</header>
							<div ng-if="success" class="alert alert-success"
								ng-show="message">
								<strong>{{message }}</strong>
							</div>
							<table class="table table-striped table-advance table-hover">
								<tbody>
									<tr>
										<th><i class="icon_profile"></i> S.No</th>
										<th><i class="icon_profile"></i> Name</th>
										<th><i class="icon_calendar"></i> Category</th>
										<th><i class="icon_cogs"></i> Action</th>
									</tr>
									<tr ng-repeat="writer in writers">
										<td>{{$index + 1}}</td>										
										<td>{{ writer.firstName }} {{writer.lastName}}</td>
										<td>
											<li  ng-repeat="category in writer.categories">{{category.name}}</li>
										</td>
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-success"
												ng-click="getUser(writer.id)">Edit</button>
												<button type="button" class="btn btn-danger"
													ng-click="removeWriter(writer.id)">
													<span class="gicon_check_alt2"></span>Delete
												</button>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</section>
													
					</div>

					<!-- dialog -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header" style="padding: 15px 50px">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 ng-if="method_update" class="modal-title">Edit Content Writer</h4>
										<h4 ng-if="method_update != true" class="modal-title">Add Content Writer</h4>
									
									</div>
									<div class="modal-body">
										<div ng-if="failure" class="alert alert-danger"
											ng-show="message">
											<strong>{{message }}</strong>
										</div>
										<form class="form-horizontal" ng-submit="addWriter()">
											<!--date picker start-->
											<input type="hidden" ng-model="id">
											<div class="form-group">
												<label class="control-label col-sm-4">First Name</label>
												<div class="col-sm-6">
													<input id="firstName" ng-model="firstName" type="text"
														placeholder="First name"  size="16" class="form-control">
														
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Last Name</label>
												<div class="col-sm-6">

													<input class="form-control" ng-model="lastName" size="16"
														type="text" placeholder="Last Name">
												</div>
											</div>

											<div class="form-group">
												<label class="control-label col-sm-4"> Email</label>
												<div class="col-sm-6">
													<div class="input-prepend">
														<input id="username" ng-model="username"
															placeholder="Email" size="16" type="text"
															class=" form-control" />
													</div>
												</div>
											</div>
											<!--date picker end-->

											<!--color picker start-->
											<div class="form-group">
												<label class="control-label col-sm-4">Password</label>

												<div class="col-sm-6">
													<input type="text" ng-model="password" size="16"
														placeholder="password" class="cp1 form-control">
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-sm-4">Phone Number</label>

												<div class="col-sm-6">
													<input ng-model="phoneNumber" type="text"
														placeholder="Phone Number" class="cp2 form-control">
												</div>
											</div>

											<!--color picker end-->
											<div class="form-group">
												<label class="control-label col-sm-4">Content
													Category</label>

												<div class="col-sm-6">
													<select required="required" id="category"
														ng-model="category" multiple="multiple"
														class="cp2 form-control">
														<c:forEach items="${categories}" var="category">
															<option value="${category.id}">${category.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="form-group">
												<div class="col-lg-offset-4 col-lg-10">
													<button ng-if="method_update" type="submit" class="btn btn-success">Update</button>
													<button ng-if="method_update != true" type="submit" class="btn btn-success">Add</button>
												
												</div>
											</div>


										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- dialog -->


					<%-- 					<div id="userForm" class="col-lg-6" style="display: none;">
						<section class="panel">
							<header class="panel-heading"> Add Writer </header>
							<div class="panel-body">
								<form class="form-horizontal" ng-submit="addWriter()">
                                          <!--date picker start-->

                                          <div class="form-group">
                                              <label class="control-label col-sm-4">First Name</label>
                                              <div class="col-sm-6">
                                                  <input id="firstName" ng-model="firstName" type="text" placeholder="First name" size="16" class="form-control">
                                              </div>
                                          </div>
                                          <div class="form-group">
                                              <label class="control-label col-sm-4">Last Name</label>
                                              <div class="col-sm-6">

                                                      <input class="form-control" ng-model="lastName" size="16" type="text" placeholder="Last Name">
                                              </div>
                                          </div>

                                          <div class="form-group">
                                              <label class="control-label col-sm-4"> Email</label>
                                              <div class="col-sm-6">
                                                  <div class="input-prepend">
                                                      <input id="username" ng-model="username" placeholder="Email" size="16" type="text" class=" form-control" />
                                                  </div>
                                              </div>
                                          </div>
                                          <!--date picker end-->

                                          <!--color picker start-->
                                          <div class="form-group">
                                              <label class="control-label col-sm-4">Password</label>

                                              <div class="col-sm-6">
                                                  <input type="text" ng-model="password" size="16" placeholder="password" class="cp1 form-control">
                                              </div>
                                          </div>
                                          <div class="form-group">
                                              <label class="control-label col-sm-4">Phone Number</label>

                                              <div class="col-sm-6">
                                                  <input ng-model="phoneNumber" type="text" placeholder="Phone Number" class="cp2 form-control">
                                              </div>
                                          </div>

                                          <!--color picker end-->
                                          <div class="form-group">
                                              <label class="control-label col-sm-4">Content Category</label>

										<div class="col-sm-6">
											<select required="required" id="category" ng-model="category" multiple="multiple" class="cp2 form-control">
												<c:forEach items="${categories}" var="category">
													<option value="${category.id}" >${category.name}</option>
												</c:forEach>
											</select>											
										</div>
									</div>
                                          
                                          <div class="form-group">
                                      <div class="col-lg-offset-4 col-lg-10">
                                          <button type="submit" class="btn btn-danger">Add</button>
                                      </div>
                                  </div>
                                          

                                      </form>



							</div>
						</section>
					</div> --%>
				</div>


			</section>
		</section>
		<!--main content end-->
	</section>
	<!-- container section end -->
	<!-- javascripts -->
	<jsp:include page="footerJs.jsp"></jsp:include>


</body>
</html>
