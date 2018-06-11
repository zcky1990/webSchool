class ContentController {
	constructor(config) {
		this.contex = config.contex;
		this.defaultContainer = config.defaultContainer;
		this.spinnerDialog = config.spinnerDialog;
		this.requestAPI = config.requestAPI;
		this.onSuccessSignOut = new signals.Signal();
	}

	bindUI(){
		var self = this;
		$('.sign-out-btn').on('click',function(){
			self.spinnerDialog.deleteCookies();
			self.onSuccessSignOut.dispatch();
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
	
	getTemplate(){
		var template = '<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">'
		     +' <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Dewantara</a>'
		     +' <ul class="navbar-nav px-3">'
		     +'   <li class="nav-item text-nowrap">'
		     +'     <a class="nav-link sign-out-btn" href="#">Sign out</a>'
		     +'  </li>'
		     +' </ul>'
		     +'</nav>';
		return template;
	}
}