angular.module('mapboxTest', [
  'ngRoute',
  'mapboxTest.todo',
  'mapboxTest.map'
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
    .otherwise
      redirectTo: '/map'

