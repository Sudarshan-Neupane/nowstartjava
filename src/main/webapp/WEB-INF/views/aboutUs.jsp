<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!-- <div class="container"> -->
<div class="row">
	<div class="col-md-12">
		<c:forEach items="${listMenu}" var="menulist">
			<div class="panel panel-success">
				<div class="panel-heading">${menulist.title}</div>
				<div class="panel-body">${menulist.description}</div>
			</div>
		</c:forEach>
	</div>
</div>
