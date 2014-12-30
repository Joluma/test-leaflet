angular.module('mapboxTest', [
  'ngRoute',
  'mapboxTest.todo',
  'mapboxTest.map',
  'mapboxTest.mapbox'
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
    .otherwise
      redirectTo: '/map'
