//= require jquery
//= require jquery_ujs
//= require alerts
//= require redactor.min

$(document).ready(function(){
  $('textarea').redactor({
    buttons: ['html', 'formatting', 'bold', 'italic']
  });
});