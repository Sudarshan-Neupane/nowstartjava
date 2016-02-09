angular.module('EmailApp',['ngRoute','ngSanitize'])
.config(function($routeProvider) {
	$routeProvider
	.when('/inbox',{
		templateUrl:'/resources/cms/myJs/message/email/inbox.html',
		controller:'InboxCtrl',
		controllerAs : 'inbox'
		
	})
	.when('/inbox/email/:id',{
		templateUrl: '/resources/cms/myJs/message/email/email.html',
		controller:'EmailCtrl',
		controllerAs: 'email'
			
	})
	.otherwise({
		redirectTo:'/inbox'
	});
}).run(function($rootScope) {
	$rootScope.$on('$routeChangeError', function(event, current, previous, rejection){
	    console.log(event, current, previous, rejection);
	    alert("Error occured");
	  })
});