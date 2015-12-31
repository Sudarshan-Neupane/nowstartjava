<!-- javascripts -->
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery-ui-1.10.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/cms/js/jquery-ui-1.9.2.custom.min.js"></script>
<!-- bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/cms/js/bootstrap.min.js"></script>
<!-- nice scroll -->
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery.scrollTo.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery.nicescroll.js"
	type="text/javascript"></script>
<!-- charts scripts -->
<script
	src="${pageContext.request.contextPath}/resources/cms/assets/jquery-knob/js/jquery.knob.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery.sparkline.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/owl.carousel.js"></script>
<!-- jQuery full calendar -->
<
<script
	src="${pageContext.request.contextPath}/resources/cms/js/fullcalendar.min.js"></script>
<!-- Full Google Calendar - Calendar -->
<script
	src="${pageContext.request.contextPath}/resources/cms/assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
<!--script for this page only-->
<script
	src="${pageContext.request.contextPath}/resources/cms/js/calendar-custom.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery.rateit.min.js"></script>
<!-- custom select -->
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery.customSelect.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/assets/chart-master/Chart.js"></script>

<!--custome script for all page-->
<script
	src="${pageContext.request.contextPath}/resources/cms/js/scripts.js"></script>
<!-- custom script for this page-->
<script
	src="${pageContext.request.contextPath}/resources/cms/js/sparkline-chart.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/easy-pie-chart.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery-jvectormap-1.2.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery-jvectormap-world-mill-en.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/xcharts.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery.autosize.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery.placeholder.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/gdp-data.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/morris.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/sparklines.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/charts.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/cms/js/jquery.slimscroll.min.js"></script>

<%-- <script
	src="${pageContext.request.contextPath}/resources/cms/js/form-validation-script.js"></script>
<!--custome script for all page-->
<script
	src="${pageContext.request.contextPath}/resources/cms/js/scripts.js"></script>
--%>
<script> 
	//knob
	$(function() {
		$(".knob").knob({
			'draw' : function() {
				$(this.i).val(this.cv + '%')
			}
		})
	});

	//carousel
	$(document).ready(function() {
		$("#owl-slider").owlCarousel({
			navigation : true,
			slideSpeed : 300,
			paginationSpeed : 400,
			singleItem : true

		});
	});

	//custom select box

	$(function() {
		$('select.styled').customSelect();
	});

	/* ---------- Map ---------- */
	$(function() {
		$('#map').vectorMap({
			map : 'world_mill_en',
			series : {
				regions : [ {
					values : gdpData,
					scale : [ '#000', '#000' ],
					normalizeFunction : 'polynomial'
				} ]
			},
			backgroundColor : '#eef3f7',
			onLabelShow : function(e, el, code) {
				el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
			}
		});
	});
</script>