angular.module('mapboxTest', [
  'ngRoute',
  'uiGmapgoogle-maps',
  'mapboxTest.todo',
  'mapboxTest.map',
  'mapboxTest.mapbox',
  'mapboxTest.angular-map'
])
.config ($routeProvider) ->
  'use strict'
  $routeProvider
    .when '/todo',
      controller: 'TodoCtrl'
      templateUrl: '/todo/todo.html'
    .when '/map',
      controller: 'MapCtrl'
      templateUrl: '/map/map.html'
    .when '/mapbox',
      controller: 'MapboxCtrl'
      templateUrl: '/mapbox/mapbox.html'
    .when '/angular-map',
      controller: 'AngularMapCtrl'
      templateUrl: '/angular-map/angular-map.html'
    .otherwise
      redirectTo: '/mapbox'
.config (uiGmapGoogleMapApiProvider) ->
  uiGmapGoogleMapApiProvider.configure(
    key: 'AIzaSyDUsd_q4Ze8uN3t3lwj_kqPeYvZaSiSHHQ'
    v: '3.17'
    china: true
    libraries: 'weather,geometry,visualization'
  )