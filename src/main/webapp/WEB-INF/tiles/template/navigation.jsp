<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />

	<div id="toppadingmenu"></div>
		<div class="row">
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="header">
					<div class="col-lg-5">
						<a href="<c:url value="/${object.argument}" />"> <img
							alt="company logo"
							src="<c:url value="/resources/images/logo.png" />">
						</a><span class = "main-heading">Digestive Java</span>
					</div>
					<div class="col-lg-7">
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

<%-- <security:authorize access="isAuthenticated()">
	<li><a href="<spring:url value="/wallPage"/>"><spring:message
				code="navigation.forum.label" /></a></li>
	<li><a href="<spring:url value="/profile/${currentUserId}"/>"><spring:message
				code="navigation.Profile.label" /></a></li>
	<li><a href="<spring:url value="/questionTypes"/>"><spring:message
				code="navigation.types.label" /></a></li>
</security:authorize>

<security:authorize access="hasRole('general')">
	<li><a href="<spring:url value="/questions/add"/>"><spring:message
				code="navigation.addQuestion.label" /></a></li>

	<li><a href="<spring:url value="/questionTypes"/>"><spring:message
				code="navigation.types.label" /></a></li>
</security:authorize>

<security:authorize access="hasRole('admin')">
	<li><a href="<spring:url value="/questionTypes/admin"/>"><spring:message
				code="navigation.types.label" /></a></li>
	<li><a href="<spring:url value="/questionTypes/add"/>"><spring:message
				code="navigation.questionType.label" /></a></li>
	<li><a href="<spring:url value="/users/adminList"/>"><spring:message
				code="navigation.allAdmins.label" /></a></li>

	<li><a href="<spring:url value="/users/addAdminForm"/>"><spring:message
				code="navigation.addAdmin.label" /></a></li>
</security:authorize>

<security:authorize access="isAuthenticated()">
	<li><a href="<spring:url value="/logout"/>"><spring:message
				code="navigation.logout.label" /></a></li>
</security:authorize>

<security:authorize access="isAnonymous()">
	<li><a href="<spring:url value="/users/signupForm"/>"><spring:message
				code="navigation.signup.label" /></a></li>
</security:authorize>

<security:authorize access="isAnonymous()">
	<li><a href="<spring:url value="/login"/>"><spring:message
				code="navigation.login.label" /></a></li>
</security:authorize> --%>