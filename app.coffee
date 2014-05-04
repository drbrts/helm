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

.controller 'bucket', ($scope) ->
  $scope.shieldToggle = ->
    if $scope.catsActive
      $scope.catsActive = !$scope.catsActive
    else
      $scope.bucketActive = !$scope.bucketActive

.controller 'thumbnails', (kimono, $scope) ->
  kimono.getThumbnails().success (data) ->
    $scope.thumbnails = data.results.collection1

.controller 'categories', (kimono, $scope) ->
  $scope.catsStyle = ->
    if $scope.catsActive
      'height': "#{$scope.categoriesHeight}px"
    else
      'height': 0

  kimono.getCategories().success (data) ->
    $scope.categories = []
    $scope.categories.push data.results.categories.slice 0, 34
    $scope.categories.push data.results.categories.slice 34

.directive 'getHeight', ($timeout) ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    scope.$watch 'categories', ->
      scope.categoriesHeight = element[0].offsetHeight

.filter 'stripLive', -> (count) ->
  count.slice 0, -5
# .directive 'setHeight', ->
#   restrict: 'A'
#   link: (scope, element, attrs) ->
#     scope.catsStyle = ->
#       if scope.catsActive
#         'height': "#{scope.categoriesHeight}px"
#       else
#         'height': 0
