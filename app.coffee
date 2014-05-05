angular.module 'naiad', [
  'ngTouch'
  'ngCookies'
  'ui.bootstrap'
]

.factory 'kimono', ($http) ->
  apikey = 'apikey=3c4b8cd526ff926daf398b6213a1a256'
  url = 'http://www.kimonolabs.com/api'
  callback = 'callback=JSON_CALLBACK'
  return {
    getThumbnails: ->
      $http.jsonp("#{url}/8zum5owe/?#{apikey}&#{callback}")

    getCategories: ->
      $http.jsonp("#{url}/8wydh4so/?#{apikey}&#{callback}")
  }

.controller 'bucket', ($scope, $cookieStore) ->
  $scope.catsPinned = $cookieStore.get 'catsActive'
  $scope.catsActive = $scope.catsPinned

  $scope.$watch 'catsActive', (val) ->
    $scope.catsPinned = false if !val
    $cookieStore.put 'catsActive', val

  $scope.shieldToggle = ->
    if $scope.catsActive then $scope.catsActive = !$scope.catsActive
    else $scope.bucketActive = !$scope.bucketActive

.controller 'thumbnails', (kimono, $scope) ->
  kimono.getThumbnails().success (data) ->
    $scope.thumbnails = data.results.collection1

.controller 'categories', (kimono, $scope) ->

  kimono.getCategories().success (data) ->
    $scope.categories = []
    $scope.categories[0] = data.results.categories.slice 0, 34
    $scope.categories[1] = data.results.categories.slice 34
    $scope.categories[2] = []

.filter 'stripLive', -> (count) ->
  count.slice 0, -5
