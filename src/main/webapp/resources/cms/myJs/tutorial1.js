/**
 * @author yogen
 */

angular.module('tutorial1',[])
.config(function($stateProvider) {
	$stateProvider.state('allTutorials',{
		url:'/tutorials/by_writer',
		resolve:{
			tutorials: function(tutorialService) {
				return tutorialService.getAllTutorials();
			}
		}
	});
});