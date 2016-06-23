$(function(){
  $('#speedTest').find('.btn-want, .btn-age').on('ajax:send', function(xhr){
    $('.btn-want, .btn-age').prop("disabled", true);
  });
});