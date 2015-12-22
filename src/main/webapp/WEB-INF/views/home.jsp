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

</head>
<body>
	<div class="container">
		<div id="toppadingmenu"></div>
		<div class="row">
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="header">
					<div class="col-lg-3">
						<img alt="company logo"
							src="<c:url value="/resources/images/logo.png" />">
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

		<div class="row">

			<div class="col-xs-4 col-md-4 col-sm-4 col-lg-4">
				<div class="panel panel-primary">
					<div id="divTotal" class="panel-heading">
						<h3 class="panel-title">Filter</h3>
					</div>
					<ul class="list-group" ng-controller="category">
						<li class="list-group-item list-group-item-success categoryList"><span
							class="glyphicon glyphicon-folder-open"> &nbsp; </span>All </li>
						<li class="list-group-item list-group-item-success categoryList"
							ng-repeat="n in category"><span
							class="glyphicon glyphicon-folder-open"> &nbsp; </span>{{n.name}}</li>
					</ul>
				</div>
			</div>

			<div class="col-xs-8 col-md-8 col-sm-8 col-lg-8"
				ng-controller="displayItemsAll">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">
						<div class="radio">
							<label> <input type="radio" name="optradio">Option
								1
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="optradio">Option
								1
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="optradio">Option
								1
							</label>
						</div>
					</div>
				</div>
<div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Panel title</h3>
                    </div>
                    <div class="panel-body">
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Panel title</h3>
                    </div>
                    <div class="panel-body">
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Panel title</h3>
                    </div>
                    <div class="panel-body">
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Panel title</h3>
                    </div>
                    <div class="panel-body">
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                        <div class="radio">
                            <label> <input type="radio" name="optradio">Option
                                1
                            </label>
                        </div>
                    </div>
                </div>

			</div>
		</div>
	</div>
</body>
</html>