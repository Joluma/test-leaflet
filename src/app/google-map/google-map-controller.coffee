angular
  .module 'mapboxTest.google-map'
  .controller 'GoogleMapCtrl', [
    '$scope', '$window', 'odigoSpots',
    ($scope,   $window,   odigoSpots) ->
      $scope.spots = odigoSpots[0].response
    
      map = L.map('map-google').setView([35.673343,139.710388], 5)

      L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
  		    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  		}).addTo(map)

      $scope.showRoute = ->
        _coords = []
        for spot in $scope.spots
          _coords.push L.latLng(spot.coords)
        polyline = L.polyline(_coords, {color: 'red'}).addTo(map)
        map.fitBounds(polyline.getBounds())

      _addMarker = (spot) ->
        L.marker(spot.fixed_coords, {
          icon: L.icon({iconUrl: 'assets/img/marker.png'})
          title: spot.name
        }).addTo(map)
        .bindPopup('Welcome to <br> '+ spot.name)

      _addCluster = ->
        markers = new L.MarkerClusterGroup()
        for spot in $scope.spots
          marker = L.marker(new L.LatLng(spot.coords.latitude, spot.coords.longitude), {
            icon: L.icon({iconUrl: 'assets/img/marker.png'})
            title: spot.name
          })
          marker.bindPopup 'Welcome to <br> '+spot.name
          markers.addLayer marker
        map.addLayer markers

      do ->
        for spot in $scope.spots
          spot.fixed_coords = [spot.coords.latitude, spot.coords.longitude]
          # _addMarker spot

        _addCluster()
]
