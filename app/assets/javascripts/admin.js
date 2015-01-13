//= require jquery
//= require jquery_ujs
//= require alerts
//= require redactor.min

$(document).ready(function(){
  $('textarea.wysiwyg').redactor({
    buttons: ['html', 'formatting', 'bold', 'italic'],
    cleanStyleOnEnter: true
  });
});