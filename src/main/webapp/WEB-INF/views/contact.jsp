<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!-- <div class="container"> -->
    <div class="row">
	<div class="col-md-6">
		<c:if test="${success_message != null}">
			<div class="alert alert-success">
				<strong>${success_message}</strong>
			</div>
		</c:if>
		<div class="well well-sm">
			<form:form id="contactForm" modelAttribute="message" class="form-horizontal" action="submit"
				method="post">
				<security:csrfInput/>
				<fieldset>
					<legend class="text-center header">Contact us</legend>
					<div class="form-group">
						<div class="col-md-10 col-md-offset-1">
							<input id="fname" name="firstName" path="firstName" type="text"
								required="required" placeholder="First Name"
								class="form-control">
								<em style="color: red;"><form:errors path="firstName"></form:errors></em>

						</div>
					</div>
					<div class="form-group">
						<div class="col-md-10 col-md-offset-1">
							<input id="lname" name="lastName" type="text" required="required"
								placeholder="Last Name" class="form-control">
								<em style="color: red;"><form:errors path="lastName"></form:errors></em>
								
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-10 col-md-offset-1">
							<input id="email" name="email" type="text"
								placeholder="Email Address" class="form-control" required>
								<em style="color: red;"><form:errors path="email"></form:errors></em>
								
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-10 col-md-offset-1">
							<input id="phone" name="phone" type="text" placeholder="Phone"
								class="form-control">
								<em style="color: red;"><form:errors path="phone"></form:errors></em>
								
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-10 col-md-offset-1">
							<textarea class="form-control" path="message" id="message" name="message"
								placeholder="Enter your massage for us here. We will get back to you within 2 business days."
								rows="7"></textarea>
								<em style="color: red;"><form:errors path="message"></form:errors></em>
								
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-primary btn-lg">Submit</button>
						</div>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
	<div class="col-md-6">
            <div>
                <div class="panel panel-default">
                    <div class="text-center header">Our Office</div>
                    <div class="panel-body text-center">
                        <h4>Address</h4>
                        <div>
                        2217 Meadow Creek DR<br />
                        Irving TX<br />
                        #(703) 1234 1234<br />
                        service@company.com<br />
                        </div>
                        <hr />
                        <div id="map1" class="map">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- </div> -->


<script src="http://maps.google.com/maps/api/js?sensor=false"></script>

<script type="text/javascript">
    jQuery(function ($) {
        function init_map1() {
            var myLocation = new google.maps.LatLng(32.8822659, -96.9693547);
            var mapOptions = {
                center: myLocation,
                zoom: 16
            };
            var marker = new google.maps.Marker({
                position: myLocation,
                title: "Property Location"
            });
            var map = new google.maps.Map(document.getElementById("map1"),
                mapOptions);
            marker.setMap(map);
        }
        init_map1();
    });
</script>

<style>
    .map {
        min-width: 300px;
        min-height: 300px;
        width: 100%;
        height: 100%;
    }
</style>
<script>
$(document).ready(function () {
    var intputElements = document.getElementsByTagName("INPUT");
    for (var i = 0; i < intputElements.length; i++) {
        intputElements[i].oninvalid = function (e) {
            e.target.setCustomValidity("");
            if (!e.target.validity.valid) {
                if (e.target.name == "firstName") {
                    e.target.setCustomValidity("The field 'First Name' cannot be left blank");
                }
                else if(e.target.name == "lastName") {
                    e.target.setCustomValidity("The field 'Last Name' cannot be left blank");
                }else if (e.target.name == "email") {
                	e.target.setCustomValidity("The field 'Email Address' cannot be left blank");
				}else if (e.target.name == "phone") {
                	e.target.setCustomValidity("The field 'Phone Number' cannot be left blank");
				}else{
					e.target.setCustomValidity("The field 'Message' cannot be left blank");
				}
            }
        };
    }
})
</script>