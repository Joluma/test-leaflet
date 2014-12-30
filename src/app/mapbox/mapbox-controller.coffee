angular
  .module 'mapboxTest.map'
  .controller 'MapboxCtrl', [
    '$scope', '$window', 'odigoSpots',
    ($scope,   $window,  odigoSpots) ->
      $scope.spots = odigoSpots[0].response

      L.mapbox.accessToken = 'pk.eyJ1Ijoiam9sdW1hIiwiYSI6Ik1wTlBJaG8ifQ.lviHoG-NIHKfPe-up0gL4g'
      map = L.mapbox.map('map', 'joluma.kgeiad5m').setView([35.673343,139.710388], 5)

      $scope.addSpot = ->
        # with mapbox, the coordinates must be [longitude, latitude]
        _coords = [$scope.spotCoords.split(',')[1], $scope.spotCoords.split(',')[0]]
        _spot = {
          name: $scope.spotName
          fixed_coords: _coords
        }
        $scope.spots.push _spot

        $scope.spotName = null
        $scope.spotCoords = null

      $scope.showRoute = ->
        _coords = []
        for spot in $scope.spots
          _coords.push L.latLng(spot.fixed_coords)
        polyline = L.polyline(_coords, {color: 'red'}).addTo(map)
        map.fitBounds(polyline.getBounds())

      _showCluster = ->
        markers = new L.MarkerClusterGroup()
        for spot in $scope.spots
          marker = L.marker(new L.LatLng(spot.coords.latitude, spot.coords.longitude), {
            icon: L.mapbox.marker.icon({'marker-symbol': 'star', 'marker-color': '0044FF'})
            title: spot.name
          })
          marker.bindPopup spot.name
          markers.addLayer marker
        map.addLayer markers

      do ->
        for spot in $scope.spots
          spot.fixed_coords = [spot.coords.longitude, spot.coords.latitude]
        _showCluster()
]

# Sugamo : 35.733492,139.739345
# Akihabara : 35.698683,139.774219
# Meiji Jingu : 35.676398,139.699326
# Tsukiji : 35.665486,139.770667
