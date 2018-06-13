var defaultPath = '';
$(document).ready(function() {
	var cookiesAndSpinner  = new common();
	var ajaxApi = new request();
	var loginPage = new login({
		"defaultContainer":"main-container",
		"spinnerDialog":cookiesAndSpinner,
		"requestAPI":ajaxApi
	})
	
	var navController = new ContentController({
		"defaultContainer":"main-container",
		"spinnerDialog":cookiesAndSpinner,
		"requestAPI":ajaxApi,
	});
	
	loginPage.onSuccessSubmit.add(navController.render,navController);
	navController.onSuccessSignOut.add(loginPage.render, loginPage);
	if(cookiesAndSpinner.checkCookie() == false){
		loginPage.render();
	}else{
		navController.render();		
	}	
} );