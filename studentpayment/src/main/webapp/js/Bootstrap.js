var defaultPath = '';
$(document).ready(function() {
	var cookiesAndSpinner  = new common();
	var ajaxApi = new request();
	var loginPage = new login({
		"defaultContainer":"main-container",
		"spinnerDialog":cookiesAndSpinner,
		"requestAPI":ajaxApi
	})
	
	var contentController = new ContentController({
		"defaultContainer":"main-container",
		"spinnerDialog":cookiesAndSpinner,
		"requestAPI":ajaxApi,
	});
	
	loginPage.onSuccessSubmit.add(contentController.render,contentController);
	contentController.onSuccessSignOut.add(loginPage.render, loginPage);
	if(cookiesAndSpinner.checkCookie() == false){
		loginPage.render();
	}else{
		contentController.setAccessLevel(cookiesAndSpinner.getAccessLevel());
		contentController.render();		
	}	
} );