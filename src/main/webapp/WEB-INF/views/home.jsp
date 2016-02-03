<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="<c:url value="/resources/js/angular_main.js" />">

</script>
<div ng-app="myapp">
	<div class="row" ng-controller="category">
		<div class="col-xs-3 col-md-3 col-sm-3 col-lg-3">
			<div style="position: fixed; margin-top: -15px;">
				<div class="panel panel-primary">
					<div id="divTotal" class="panel-heading">
						<h3 class="panel-title">Tutorials</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item list-group-item-success categoryList" ng-click="selectCategory(0)"><input
							type="radio" name="category" class="radio-primary">All</li>
						<li class="list-group-item list-group-item-success categoryList" ng-repeat="n in category"><input
							type="radio" name="category" class="radio-primary" ng-click="selectCategory(n.id)"> {{n.name}}</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-xs-7 col-md-7 col-sm-7 col-lg-7">

			<!-- home page content -->
			<div ng-show="introduction"><jsp:include page="introduction.jsp" /></div>
			<!-- home page content -->
			<div ng-show="! introduction">
				<div class="panel panel-primary"
					ng-repeat="tutorials in displayTutorial">
					<div class="panel-heading">
						<span class="panel-title">{{ tutorials.title}}</span> <span
							class="pull-right"> {{ tutorials.dateCreated |
							date:'yyyy-MM-dd'}}</span>
					</div>
					<div class="panel-body">
						{{ tutorials.description |limitTo: 550 }}
						<div class="shareSocial">
							<c:set var="contextPath"
								value="${pageContext.request.contextPath}" />
							<a href="${contextPath}/content/{{tutorials.slug}}">
								<button type="button" class="btn btn-primary">Learn
									More</button>
							</a>
						</div>
					</div>
				</div>
				<div class="panel panel-primary" ng-show="!displayTutorial.length">
					<div class="alert alert-warning">
						<h1>Tutorial on this topic will be uploaded soon!!</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-2 col-md-2 col-sm-2 col-lg-2">
			<div class="panel panel-primary">
				<img alt="company logo" src="<c:url value="/resources/images/four.jpg" />">
			</div>
		</div>
	</div>
</div>