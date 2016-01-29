<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<div id="toppadingmenu"></div>
<div class="row">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="header">
			<div class="col-lg-5">
				<a href="<c:url value="/${object.argument}" />"> <img alt="company logo"
					src="<c:url value="/resources/images/logo.png" />">
				</a><span class="main-heading">Digestive Java</span>
			</div>
			<div class="col-lg-7">
				<div class="menuBar">
					<div class="menu">
						<a href="#">Home </a>
					</div>
					<div class="menu">
						<a href="#aboutUs">About Us</a>
					</div>
					<div class="menu">
						<a href="#contactUs">Contact</a>
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>