$(function(){
    var areaName = $('#areaName').text();
    $('#areaNav').find('li').each(function() {
        areaName = areaName.slice(0, $(this).text().length);
       if ($(this).text() == areaName) {
           $(this).addClass('active');
       } 
    });
});