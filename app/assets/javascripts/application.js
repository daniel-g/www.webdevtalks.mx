//= require jquery
//= require fullpage.js/jquery.fullPage.js
//= require fullpage.js/vendors/jquery.easings.min

$(function(){
  $('#content').fullpage({
    menu: '.js-fullpage-menu',
    anchors: ['home', 'topics', 'cfp', 'about', 'location']
  });
})
