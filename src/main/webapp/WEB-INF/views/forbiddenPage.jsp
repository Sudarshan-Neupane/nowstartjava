<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
<!--
for this page
-->
.wrapper {
    text-align: center;
}
</style>

<div>
	<h1>You are trying to access the unauthorized pages...</h1>
	<div class="wrapper">
		<a href="<c:url value='/cms'/>">Back to Home</a>
	</div>
</div>