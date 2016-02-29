var app = angular.module('Link', []);
app.controller('LinksCtrl', function($scope, $http) {
  var linksUrl = "/api/v1/links"

  $http.get(linksUrl).then(function(response) {
    $scope.links = response.data
  });

  $scope.done = function(link) {
    var indexOf = $scope.link.indexOf(link);
    if (indexOf !== -1) {
      $scope.link.splice(indexOf, 1);
    }
  };

  $scope.add = function(e) {
    if (e.which && e.which === 13) {
      $scope.link.push($scope.newUrl);
      $scope.newLink = '';
    }
  };
});
