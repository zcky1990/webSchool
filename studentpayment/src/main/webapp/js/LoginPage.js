class login {
	constructor(config) {
		this.contex = config.contex;
		this.defaultContainer = config.defaultContainer;
		this.spinnerDialog = config.spinnerDialog;
		this.requestAPI = config.requestAPI;
		this.onSuccessSubmit = new signals.Signal();
	}

	bindUI(){
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
				var username = $('.input-login-username').text();
				var password = $('.input-login-password').text();
				var postModel = self.getLoginModel(username,password);
				self.spinnerDialog.showSpinner();
				self.requestAPI.request('/login',"POST", JSON.stringify(postModel) , function(response){
					self.spinnerDialog.hideSpinner();
					if(response.status == 'success'){
						self.spinnerDialog.setCookie(response);
						self.onSuccessSubmit.dispatch();
					}
				},function(errorResponse){
					self.spinnerDialog.hideSpinner();
				});
			}
		});

		$('.input-login').on('click',function(){
			self.hideValidate();
		});
	}

	render(){
		$('.'+this.defaultContainer).empty();
		var template = this.getTemplate();
		var theTemplate = Handlebars.compile(template);
		var theCompiledHtml = theTemplate(this.context);
		$('.'+this.defaultContainer).html(theCompiledHtml);
		this.bindUI()
	}
	getLoginModel (username, password){
		var loginModel = {};
		loginModel.username = username;
		loginModel.password = password;
		return loginModel;
	}
	validate (input) {
		if($(input).val().trim() == ''){
			return false;
		}
	}
	showValidate (input) {
		var message ='';
		if($(input).attr('name') == 'username'){
			message = "*Username cannot be blank!";
		}else{
			message = "*Password cannot be blank!"
		}
		$('.error-message').text(message);
		$('.error-message').removeClass('hide');
		$('.error-message').addClass('show');
	}
	hideValidate() {
		$('.error-message').removeClass('show');
		$('.error-message').addClass('hide');
	}
	getTemplate(){
		var template = '<div class="container-login">'
			+'	<div class="wrap-login p-l-55 p-r-55 p-t-65 p-b-50">'
			+'<div class="login-form validate-form">'
			+'	<span class="login-form-title p-b-33"> Login </span>'
			+'	<div class="wrap-input validate-input"'
			+'		data-validate="Username is required">'
			+'		<input class="input input-login input-login-username" type="text" name="username"'
			+'			placeholder="Username"> <span class=" focus-input-1"></span>'
			+'		<span class="focus-input-2"></span>'
			+'	</div>'
			+'	<div class="wrap-input rs1 validate-input" data-validate="Password is required">'
			+'		<input class="input input-login input-login-password"  type="password" name="password"'
			+'			placeholder="Password"> <span class="focus-input-1"></span>'
			+'		<span class="focus-input-2"></span>'
			+'	</div>'
			+'	<div class="container">'
			+'		<div class="row">'
			+'			<div class="col-sm-12 error-message hide">	text message</div>'
			+'		</div>'
			+'	</div>'
			+'	<div class="container-login-form-btn m-t-20">'
			+'		<button class="login-form-btn login-btn-submit">Sign in</button>'
			+'	</div>'
			+'</div>'
			+'</div>'
			+'</div>';
		return template;
	}
}