$("#loading").ajaxStart(function(){
    $(this).show();
 }).ajaxStop(function(){
    $(this).hide();
 });
