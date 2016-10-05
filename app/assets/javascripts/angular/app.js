angular.module('yaks', ['restangular'])

.factory('Yaks', ['Restangular', function (Restangular) {
  return Restangular.service('yaks');
}])

.controller('YakCtrl', ['$scope', 'Yaks', '$interval', function ($scope, Yaks, $interval) {

  $scope.yaks = Yaks.getList().$object;

  console.log($scope.yaks);

  $scope.shave = function (yak) {
    yak.post("shavings").then(function (data) {
      console.log(data.plain());
      angular.extend(yak, data.plain());
    });
  };

  $scope.create = function () {
    $scope.yaks.post({});
  };

  $scope.cull = function (yak) {
    yak.remove().then(function() {
      $scope.yaks = _.without($scope.yaks, yak);
    });
  };

  var grow = function () {
    $scope.yaks.forEach(function(yak) {
      yak.hair_length++;
      yak.save();
    });
  };

  $interval(grow, 2000);
}]);
