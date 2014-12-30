angular
  .module 'mapboxTest.angular-map'
  .controller 'AngularMapCtrl', [
    '$scope', '$window', 'odigoSpots',
    ($scope,   $window,  odigoSpots) ->
      $scope.spots = odigoSpots[0].response
      $scope.map =
        center:
          latitude: 35.673343
          longitude: 139.710388
        zoom: 5

      do ->
        ""
]
