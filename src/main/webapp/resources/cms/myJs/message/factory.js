angular.module('EmailApp').factory(
		'EmailFactory',
		function EmailFactory($q, $http, $routeParams) {
			'use strict';
			var exports = {};
			exports.reply = function(message) {
				if (message) {
					alert('Reply Content: ' + message);
				}
			};
			exports.getMessage = function(params) {
				if (params.id) {
					var deferred = $q.defer();
					$http.get('inbox/'+params.id).success(
							function(data) {
								deferred.resolve(data);
							}).error(function(data) {
						deferred.reject(data);
					});
					return deferred.promise;
				}
			};
			return exports;
		})
.factory('InboxFactory', function InboxFactory($q, $http, $location) {
	'use strict';
	var exports = {};
	exports.messages = [];
	exports.goToMessage = function(id) {
		if (angular.isNumber(id)) {
//			console.log('inbox/email/' + id)
			$location.path('inbox/email/' + id)
		}
	}

	exports.deleteMessage = function(id, index) {
		var deleteMsg = $http({
			method:'DELETE',
			url : 'delete/' + id
		});
		deleteMsg.success(function() {
//			this.deleted = !this.deleted;
//			alert("success");
//			this.messages.splice(index, 1);
		});
		this.messages.splice(index, 1);
	}

	exports.getMessages = function() {
		var deferred = $q.defer();
		return $http.get('inbox').success(function(data) {
			exports.messages = data;
			deferred.resolve(data);
		}).error(function(data) {
			deferred.reject(data);
		});
		return deferred.promise;
	};

	return exports;
});