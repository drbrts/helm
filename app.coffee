nop = ->

angular.module 'helm', [
  'ngTouch'
  'ngCookies'
  'ui.bootstrap'
  'placeholders'
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

.controller 'bucket', ($scope, $cookies, $cookieStore) ->
  $scope.catsPinned = $cookies.categories
  $scope.catsActive = $scope.catsPinned

  $scope.$watch 'catsActive', (val) ->
    $scope.catsPinned = false if !val
    if val then $cookies.categories = 'active'
    else $cookieStore.remove 'categories'

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

.controller 'tricorder', ($scope) ->
  $scope.data = 
    activeTab: 'cinfo'

# sets `scope.data.activeTabIndex` to the currently selected option
.directive 'tabsetSelect', ->
  (scope, elem, attrs) ->
    scope.$watch 'data.activeTab', (val) ->
      for opt, index in elem.children()
        if opt.value is val
          scope.data.activeTabIndex = index
          break

# @require 'ui.bootstrap'
# this will link an the `ui.bootstrap.tabset` directive to an active index number
.directive 'tabsetSelectActive', ->
  require: 'tabset',
  link: (scope, elem, attrs, ctrl) ->
    scope.$watch 'data.activeTabIndex', (val) ->
      ctrl.select ctrl.tabs[val]

    scope.setOption = (val) ->
      scope.data.activeTab = val


.filter 'stripLive', ->
  (count) -> count.slice 0, -5

