angular.module('mapboxTest', [
  'ngRoute',
  'uiGmapgoogle-maps',
  'mapboxTest.leaflet-module',
  'mapboxTest.mapbox',
  'mapboxTest.angular-map',
  'mapboxTest.google-map'
])
.config ($routeProvider) ->
  'use strict'
  $routeProvider
    .when '/leaflet',
      controller: 'LeafletCtrl'
      templateUrl: '/leaflet/leaflet.html'
    .when '/mapbox',
      controller: 'MapboxCtrl'
      templateUrl: '/mapbox/mapbox.html'
    .when '/angular-map',
      controller: 'AngularMapCtrl'
      templateUrl: '/angular-map/angular-map.html'
    .when '/google-map',
      controller: 'GoogleMapCtrl'
      templateUrl: '/google-map/google-map.html'
    .otherwise
      redirectTo: '/mapbox'
.config (uiGmapGoogleMapApiProvider) ->
  uiGmapGoogleMapApiProvider.configure(
    key: 'AIzaSyDUsd_q4Ze8uN3t3lwj_kqPeYvZaSiSHHQ'
    v: '3.17'
    china: true
    libraries: 'weather,geometry,visualization'
  )