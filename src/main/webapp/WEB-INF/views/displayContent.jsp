<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="<c:url value="/resources/js/dispalyContent.js"/>"></script>
<script src="<c:url value="/resources/js/prettify.js"/>"></script>
<link href="${pageContext.request.contextPath}/resources/css/prettify.css" rel="stylesheet" type="text/css" />
<div ng-app="displayContent">
	<div ng-init="slugid = ${slugToid}">
		<div class="row" ng-controller="content">
			<div class="col-xs-3 col-md-3 col-sm-3 col-lg-3">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">
							<strong>Filter</strong>
						</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item list-group-item-success categoryList" ng-repeat="n in disContent"><input
							type="radio" name="category" class="radio-primary" ng-click="selectTutorialContent(n.id)"> {{n.title}}</li>
						<li class="list-group-item list-group-item-success categoryList" ng-show="!disContent.length">Tutorial on
							this topic will be uploaded soon!!</li>
					</ul>
				</div>
			</div>
			<div class="col-xs-7 col-md-7 col-sm-7 col-lg-7">
				<div class="panel panel-success" style="margin-bottom: 5px;">
					<div class="panel-heading">
						<a href="#">{{displayDetails.tutorials.category.name }} >> {{displayDetails.tutorials.title }} >>
							{{displayDetails.title }}</a>
					</div>
				</div>
				<div class="panel panel-danger">
					<div class="panel-heading">
						<span class="panel-title"><strong>{{ displayDetails.title}} </strong></span> <span class="pull-right"> {{
							displayDetails.dateCreated | date:'yyyy-MM-dd'}}</span>
					</div>
					<div class="panel-body">
						{{ displayDetails.description }}
						<hr>
						<pre class="prettyprint linenums:1">
							method override(){
							system.out.println("this is me sudarshan");
							}
							
							method override(){
							system.out.println("this is me sudarshan");
							}
							method override(){
							system.out.println("this is me sudarshan");
							}
							
							method override(){
							system.out.println("this is me sudarshan");
							}
							</pre>
					</div>
				</div>
			</div>
			<div class="col-xs-2 col-md-2 col-sm-2 col-lg-2">
				<div class="panel panel-primary">
					<img alt="company logo" src="<c:url value="/resources/images/three.jpg" />">
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	prettyPrint();
</script>