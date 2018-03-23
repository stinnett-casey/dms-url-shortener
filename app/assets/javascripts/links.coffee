# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $(document).on 'click', '.short-url', ->
    $row = $(this).closest('tr')
    $visited = $row.find('.times-visited')
    times_visited = parseInt($visited.text())
    $visited.text times_visited+1