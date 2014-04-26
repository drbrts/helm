angular.module 'naiad', ['ngTouch']
.controller 'thumbnails', ($http, $scope) ->
  url = 'http://www.kimonolabs.com/api/8zum5owe?apikey=3c4b8cd526ff926daf398b6213a1a256&callback=JSON_CALLBACK'
  $http.jsonp(url).success (data) ->
    $scope.thumbnails = data.results.collection1
