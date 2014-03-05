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
//= require_tree .


var modal = (function(){
        var
        method = {},
        $overlay,
        $modal,
        $content,
        $close;

        // Center the modal in the view
        method.center = function () {
          var top, left;

          top = Math.max($(window).height() - $modal.outerHeight(), 0) / 2;
          left = Math.max($(window).width() - $modal.outerWidth(), 0) / 2;

          $modal.css({
            top:top + $(window).scrollTop(),
            left:left + $(window).scrollLeft()
          });
        };

        // Open the modal
        method.open = function (settings) {
          $content.empty().append(settings.content);

          $modal.css({
            width: settings.width || 'auto',
            height: settings.height || 'auto'
          });

          method.center();
          $(window).bind('resize.modal', method.center);
          $modal.show();
          $overlay.show();
        };

        // Close the modal
        method.close = function () {
          $modal.hide();
          $overlay.hide();
          $content.empty();
          $(window).unbind('resize.modal');
        };

        // Generate the HTML and add it to the document
        $overlay = $('<div id="overlay"></div>');
        $modal = $('<div id="modal"></div>');
        $content = $('<div id="content"></div>');
        $close = $('<a id="close" href="#">close</a>');

        $modal.hide();
        $overlay.hide();
        $modal.append($content, $close);

        $(document).ready(function(){
          $('body').append($overlay, $modal);
        });

        $close.click(function(e){
          e.preventDefault();
          method.close();
        });

        return method;
      }());

      // Wait until the DOM has loaded before querying the document
      $(document).ready(function(){

        $('a#cart').click(function(e){

          $.get('/cart', function(data){

          modal.open({content: data});
        });
          e.preventDefault();
        });
      });


