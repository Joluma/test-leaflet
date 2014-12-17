angular
  .module 'mapboxTest.map'
  .controller 'MapCtrl', ($scope, $window) ->
    'use strict'
    $scope.spots = []
    map = L.map('map').setView([35.673343,139.710388], 13)

    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
		    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
		}).addTo(map)

    $scope.addSpot = ->
      _coords = [$scope.spotCoords.split(',')[0], $scope.spotCoords.split(',')[1]]
      _spot = {
        name: $scope.spotName
        coords: _coords
      }
      $scope.spots.push _spot
      _addMarker _spot

      $scope.spotName = null
      $scope.spotCoords = null

    $scope.showRoute = ->
      _coords = []
      for spot in $scope.spots
        _coords.push L.latLng(spot.coords)
      polyline = L.polyline(_coords, {color: 'red'}).addTo(map)
      map.fitBounds(polyline.getBounds())

    _addMarker = (spot) ->
      L.marker(spot.coords).addTo(map)
      .bindPopup('Welcome to <br> '+ spot.name)
      .openPopup()


# Sugamo : 35.733492,139.739345
# Akihabara : 35.698683,139.774219
# Meiji Jingu : 35.676398,139.699326
# Tsukiji : 35.665486,139.770667
