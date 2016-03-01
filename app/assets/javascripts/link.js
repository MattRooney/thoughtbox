var app = angular.module('Link', []);
app.controller('LinksCtrl', function($scope, $http) {
  var linksUrl = "/api/v1/links"

  $http.get(linksUrl).then(function(response) {
    $scope.links = response.data
  });

  $scope.destroy = function(link) {
    $http({
      method: 'DELETE',
      url: linksUrl+'/'+link.id
    }).then(function successCallback(response) {
      $http.get(linksUrl).then(function(response) {
        $scope.links = response.data
      });
    });
  };

  $scope.read = function(link) {
    if (link.read === true) {
      link.read = false;
    } else {
      link.read = true;
    }
  };

  $scope.edit = function(e, link) {
    if (e.which && e.which === 13) {
      debugger;
      $http({
        method: 'PUT',
        url: linksUrl+'/'+link.id,
        data: JSON.stringify(link)
      }).then(function successCallback(response) {
        $http.get(linksUrl).then(function(response) {
          $scope.links = response.data
        });          // this callback will be called asynchronously
          // when the response is available
        }, function errorCallback(response) {
          console.log(response);;
          // called asynchronously if an error occurs
          // or server returns response with an error status.
        })
    }
  };

  $scope.add = function(e) {
    if (e.which && e.which === 13) {
      $http({
        method: 'POST',
        url: linksUrl+'?url='+$scope.newUrl+'&title='+$scope.newTitle
      }).then(function successCallback(response) {
        $http.get(linksUrl).then(function(response) {
          $scope.links = response.data
        });          // this callback will be called asynchronously
          // when the response is available
        }, function errorCallback(response) {
          console.log(response);
          // called asynchronously if an error occurs
          // or server returns response with an error status.
        })

      $scope.newUrl = '';
      $scope.newTitle = '';
    }
  };
});
