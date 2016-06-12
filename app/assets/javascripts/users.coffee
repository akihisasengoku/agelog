# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $('#followBtn').hover(
        ->
            if $('#followBtn').hasClass('follow')
                $('#followBtn').removeClass('follow').addClass('js_unfollow')
            else
                $('#followBtn').removeClass('unfollow').addClass('js_follow')
            
        -> 
                $('#followBtn').removeClass('js_follow js_unfollow')
    )
