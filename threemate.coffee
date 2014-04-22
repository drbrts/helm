angular.module 'helm', ['duScroll', 'ngTouch']
  .controller 'thumb', [
    '$http', '$scope', '$document',
    ($http, $scope, $document) ->
      url = 'http://www.kimonolabs.com/api/8zum5owe?apikey=3c4b8cd526ff926daf398b6213a1a256&callback=JSON_CALLBACK'
      $http.jsonp(url).success (data) ->
        $scope.thumbs = data.results.collection1

      $scope.selected = null
      active = null

      # $scope.thumbClick = (idx, e) ->
      #   if active
      #     console.log 'current: ' + active.parentNode.offsetTop
      #     console.log 'clicked: ' + e.currentTarget.parentNode.offsetTop

      #   if idx < $scope.selected
      #     offset = 10

      #   else
      #     if $scope.selected
      #       offset = 210
      #     else
      #       offset = 10

      #   $document.scrollToElement(e.currentTarget, offset, 1000)


      #   if $scope.selected is idx
      #     $scope.selected = null
      #     active = null
      #   else
      #     $scope.selected = idx
      #     active = e.currentTarget

      #   return
    ]
