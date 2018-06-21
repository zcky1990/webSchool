Clazz.createPackage("com.dewantara");

Clazz.com.dewantara.LoginPage = Clazz.extend(Clazz.WidgetWithTemplate, {
	defaultContainer : "overview\\:main-container",
	templateUrl : "../../template/login.tmp",
	onSuccessSubmit : null,
	spinnerController: null,
	cookiesController: null,
	requestAPI: null, 
	
    initialize: function(config){
    		this.spinnerController = config.spinnerController;
    		this.cookiesController = config.cookiesController;
    		this.requestAPI = config.requestAPI;
    		this.onSuccessSubmit = new signals.Signal();
    },
	bindUI: function (){
		var self = this;
		$('.login-btn-submit').on('click',function(){
			var check = true;
			var input = $('.input-login');
			for(var i=0; i<input.length; i++) {
				if(self.validate(input[i]) == false){
					self.showValidate(input[i]);
					check = false;
					break;
				}
			}
			if(check){
				var username = $('#input-login-username')[0].value;
				var password = $('#input-login-password')[0].value;
				var postModel = self.getLoginModel(username,password);
				self.spinnerController.showSpinner();
				self.requestAPI.request('/login',"POST", JSON.stringify(postModel) , function(response){
					self.spinnerController.hideSpinner();
					if(response.status == 'success'){
						self.cookiesController.setCookie(response);
						self.onSuccessSubmit.dispatch();
					}
				},function(errorResponse){
					self.spinnerController.hideSpinner();
				});
			}
		});

		$('.input-login').on('click',function(){
			self.hideValidate();
		});
	},
	getLoginModel: function (username, password){
		var loginModel = {};
		loginModel.username = username;
		loginModel.password = password;
		return loginModel;
	},
	validate : function (input) {
		if($(input).val().trim() == ''){
			return false;
		}
	},
	showValidate: function (input) {
		var message ='';
		if($(input).attr('name') == 'username'){
			message = "*Username cannot be blank!";
		}else{
			message = "*Password cannot be blank!"
		}
		$('.error-message').text(message);
		$('.error-message').removeClass('hide');
		$('.error-message').addClass('show');
	},
	hideValidate: function () {
		$('.error-message').removeClass('show');
		$('.error-message').addClass('hide');
	}
});
