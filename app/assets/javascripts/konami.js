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

