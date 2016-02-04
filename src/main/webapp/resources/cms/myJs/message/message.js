angular.module('EmailApp',['ngRoute','ngSanitize'])
.config(function($routeProvider) {
	$routeProvider
	.when('/inbox',{
		templateUrl:'/tutorials/resources/cms/myJs/email/inbox.html',
		controller:'InboxCtrl',
		controllerAs : 'inbox'
		
	})
	.when('/inbox/email/:id',{
		templateUrl: '/tutorials/resources/cms/myJs/email/email.html',
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