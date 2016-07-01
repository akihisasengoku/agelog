$(function(){
    var areaName = $('#areaName').text();
    $('#areaNav').find('li').each(function() {
        var that = $(this);
        var text = that.text();
        var currentAreaName = areaName.slice(0, text.length);
        if (text == currentAreaName) {
            that.addClass('active');
        } 
    });
    
    var listName = $('#listName').text();
    $('#mypageLists').find('.mypageList').each(function() {
        var that = $(this);
        if (that.find('a').text() == listName) {
            that.addClass('active');
        } 
    });
});