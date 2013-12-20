// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

   $(document).ready(function(){
    var keys     = [];
    var konami  = '38,38,40,40,37,39,37,39,66,65';

   $(document)
        .keydown(
            function(e) {
                keys.push( e.keyCode );
                if ( keys.toString().indexOf( konami ) >= 0 ){
 
                    var k = window.setInterval(function(){

                      if ($("#konami").is(":visible")) {
                        $("#konami").hide();
                      } else {
                        $("#konami").show();
                      }
                    }, 250);

                  setTimeout(function(){
                    window.clearInterval(k)
                  }, 4000);
                    keys = [];
                }
            }
        );
      });





