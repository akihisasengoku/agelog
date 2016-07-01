# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    
    topAreaMap = $('#topAreaMap')
    topAreaMapSrc = topAreaMap.attr('src')
    $('#topAreaMapTag').children().each(
        -> 
            $(this).hover(
                ->
                    topAreaMap.attr('src', $(this).attr('alt'))
                ->
                    topAreaMap.attr('src', topAreaMapSrc)
            )
    )