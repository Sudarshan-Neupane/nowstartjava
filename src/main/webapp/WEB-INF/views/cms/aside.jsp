<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu">
			<li class="active"><a class="" href="${pageContext.servletContext.contextPath}/cms/loginsuccess"> <i class="glyphicon glyphicon-th-large"></i> <span>Dashboard</span>
			</a></li>
			<li class="sub-menu"><a href="javascript:;" class=""> <i class="glyphicon glyphicon-th-list"></i> <span>
						Menu </span> <span class="menu-arrow arrow_carrot-right"></span>
			</a>
				<ul class="sub">
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<li><a class="" href="${pageContext.servletContext.contextPath}/cms/category"> Category</a></li>
						<li><a class="" href="${pageContext.servletContext.contextPath}/cms/tutorial"> Tutorials </a></li>
						</security:authorize>
					<security:authorize access="hasRole('ROLE_WRITER')">
						<li><a class="" href="${pageContext.servletContext.contextPath}/cms/tutorial"> All writers & topics </a></li>
						<li><a class=""	href="${pageContext.servletContext.contextPath}/cms/tutorials/${loginUser.id}"> Tutorials </a></li>
					</security:authorize>
					<%-- <li><a class="" href="${pageContext.servletContext.contextPath}/cms/tutorial"> Tutorials </a></li> --%>
					<li><a class="" href="${pageContext.servletContext.contextPath}/cms/menupage"> Menu Page </a></li>
				</ul></li>
			<li><a class="" href="${pageContext.servletContext.contextPath}/cms/writers"> <i class="icon_piechart"></i>
					<span>Writers</span>
			</a></li>
			
			<security:authorize access="hasRole('ROLE_ADMIN')">
			<li><a class="" href="${pageContext.servletContext.contextPath}/cms/messages"> <i class="icon_piechart"></i>
					<span>Messages</span>
			</a></li>
			</security:authorize>
		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>