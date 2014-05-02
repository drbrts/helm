angular.module 'naiad', [
  'ngTouch'
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

.controller 'thumbnails', (kimono, $scope) ->
  kimono.getThumbnails().success (data) ->
    $scope.thumbnails = data.results.collection1

.controller 'categories', (kimono, $scope) ->
  kimono.getCategories().success (data) ->
    $scope.categories = data.results.categories
