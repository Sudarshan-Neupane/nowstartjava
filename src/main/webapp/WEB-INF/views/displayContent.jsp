<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="<c:url value="/resources/js/dispalyContent.js"/>"></script>
<div ng-app = "displayContent">
		<div ng-init="slugid = ${slugToid}">
			<div class="row" ng-controller="content">
				<div class="col-xs-7 col-md-7 col-sm-7 col-lg-3">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">
								<strong>Filter</strong>
							</h3>
						</div>

						<ul class="list-group">
							<li class="list-group-item list-group-item-success categoryList"
								ng-repeat="n in disContent"><input type="radio"
								name="category" class="radio-primary"
								ng-click="selectTutorialContent(n.id)"> {{n.title}}</li>
							<li class="list-group-item list-group-item-success categoryList"
								ng-show="!disContent.length">Tutorial on this topic will be
								uploaded soon!!</li>
						</ul>

					</div>
				</div>

				<div class="col-xs-7 col-md-7 col-sm-7 col-lg-7">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<span class="panel-title"><strong>{{
									displayDetails.title}} </strong></span> <span class="pull-right"> {{
								displayDetails.dateCreated | date:'yyyy-MM-dd'}}</span>
						</div>
						<div class="panel-body">
							{{ displayDetails.description }}

							<div class="shareSocial">
								<div class="fb-share-button" data-type="button"></div>
								<%--  <img alt="share Facebook" src="<c:url value="/resources/images/share_fb.png" />">
                     <img alt="share Facebook" src="<c:url value="/resources/images/twitter-share.png" />">
                     --%>
							</div>
						</div>

					</div>
				</div>
				<div class="col-xs-2 col-md-2 col-sm-2 col-lg-2">
					<div class="panel panel-primary">
						<img alt="company logo"
							src="<c:url value="/resources/images/three.jpg" />">
					</div>
				</div>
			</div>
		</div>
		
	 <!--   <div id="fb-root"></div>
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=439595092749423";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        jQuery(document).on('ready', function($) {
            var url = window.location;
            $('.fb-share-button').attr('data-href', url);
        });
    </script>
 -->
 
 </div>