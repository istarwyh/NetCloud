//$(document).ready(function(){
//    $('input').keypress(function(e){
//       e.returnValue = false;   
//       if (e.which == 13){
//            $('.submit').click();
//        }
//    });
//    });
$(document).ready(function() {
	$('input').keypress(function(e){
		if($(this).attr('id') != 'username') {
	       e.returnValue = false;   
	       if (e.which == 13){
	            $('.submit').click();
	        }
	    }
	});
	var inputValue = '';
	$('#username').keyup(function(e) {
		if (e.which == 13){
			if($(this).val() == inputValue) {
				$('.submit').click();
			} else {
				inputValue = $(this).val();
			}
	    } else {
	    	inputValue = $(this).val();
	    }
	});
});