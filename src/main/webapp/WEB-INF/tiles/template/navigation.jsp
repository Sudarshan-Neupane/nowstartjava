<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />
<!-- <div id="toppadingmenu"></div> -->

<div class="row">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="header">
			<div class="nav-header col-lg-5">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
					 <span class="icon-bar"></span>
				</button>
				<a class="nav-bar" href="<c:url value="/${object.argument}" />">
					<img alt="company logo"
					src="<c:url value="/resources/images/logo.png" />">
				</a><span class="nav-bar"><img alt="company logo"
					style="height: 50px; width: 350px"
					src="<c:url value="/resources/images/slogan.png" />"></span>
			</div>
			
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/'/>">HOME</a></li>
					<li><a href="#about">ABOUT</a></li>
					<li><a href="<c:url value='/contact'/>">CONTACT</a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>