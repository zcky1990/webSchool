var defaultPath = '';
$(document).ready(function() {
	var defaultPath = '';
	var cookiesAndSpinner  = new common();
	var ajaxApi = new request();
	var loginPage = new login({
		"defaultContainer":"main-container",
		"spinnerDialog":cookiesAndSpinner,
		"requestAPI":ajaxApi
	})
	if(cookiesAndSpinner.checkCookie() == false){
		loginPage.render();
	}else{
		if(cookiesAndSpinner.getAccessLevel() == 1){
			
		}else{
			
		}
	}	
} );