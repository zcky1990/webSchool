class ContentController {	
	constructor(config) {
		this.contex = config.contex;
		this.defaultContainer = config.defaultContainer;
		this.spinnerDialog = config.spinnerDialog;
		this.requestAPI = config.requestAPI;
		this.onSuccessSignOut = new signals.Signal();
		this.accessLevel = null;

		Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
			switch (operator) {
			case '===':
				return (v1 === v2) ? options.fn(this) : options.inverse(this);
			default:
				return options.inverse(this);
			}
		});
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
		var theCompiledHtml = theTemplate(this.contex);
		$('.'+this.defaultContainer).html(theCompiledHtml);
		this.bindUI()
	}

	setAccessLevel(accessLevel){
		this.contex = {};
		this.contex.accessLevel = accessLevel;
	}

	getTemplate(){
		var template = '<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">'
			+' <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Dewantara</a>'
			+' <ul class="navbar-nav px-3">'
			+'   <li class="nav-item text-nowrap">'
			+'     <a class="nav-link sign-out-btn" href="#">Sign out</a>'
			+'  </li>'
			+' </ul>'
			+'</nav><div class="main-content-container"><div class="row">'
			+'<div class="left-nav col-sm-2">' 
			+'<ul class="nav flex-column">'
			+'<li class="nav-item">'
			+'<a class="nav-link active" href="#">'
			+'  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>'
			+'  Dashboard <span class="sr-only">(current)</span>'
			+'</a>'
			+' </li>'
			+'{{#ifCond accessLevel "===" 0}}'
			+'<li class="nav-item">'
			+'		<a class="nav-link" href="#">'
			+'  		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>'
			+'  	Orders'
			+'		</a>'
			+'</li>'
			+'{{/ifCond}}'
			+'</ul> </div>'
			+'<div class="main-content"> adsadas </div>'
			+'</div></div>';
		return template;
	}
}