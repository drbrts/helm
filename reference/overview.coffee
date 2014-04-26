$ ->
  $ '.ipad'
    .css 'transform', -> "scale(#{~~($(@).parent().width() / $(@).width() * 100) / 100})"
