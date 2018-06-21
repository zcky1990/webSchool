Clazz.createPackage("com.dewantara");

Clazz.com.dewantara.ContentController = Clazz.extend(Clazz.WidgetWithTemplate, {
	defaultContainer : "overview\\:main-container",
	templateUrl : "../../template/main-content.tmp",
	onSuccessSignOut : null,
	spinnerController: null,
	cookiesController: null,
	requestAPI: null, 
	dewantaraPageMain : null,
	dewantaraAdminPageMain : null,
	listSiswa:[],

	initialize: function(config){
		this.spinnerController = config.spinnerController;
		this.cookiesController = config.cookiesController;
		this.requestAPI = config.requestAPI;
		this.onSuccessSignOut = new signals.Signal();
		this.listSiswa = [];

		Handlebars.registerHelper('ifCond', function (v1, operator, v2, options) {
			switch (operator) {
			case '==':
				return (v1 == v2) ? options.fn(this) : options.inverse(this);
			default:
				return options.inverse(this);
			}
		});
		
		this.dewantaraPageMain = new Clazz.com.dewantara.Dewantara({
			'spinnerController' : this.spinnerController,
			'cookiesController' : this.cookiesController,
			'requestAPI' : this.requestAPI
		});
	},
	removeActiveTab : function(){
		var tabs = $('.tab');
		for(var i = 0 ; i < tabs.length; i++){
			var tab = tabs[i];
			if($(tab).has('tab-active')){
				$(tab).removeClass('tab-active');
			}
		}
	},
	bindUI: function (){
		var self = this;
		$('.sign-out-btn').on('click',function(){
			self.cookiesController.deleteCookies();
			self.onSuccessSignOut.dispatch();
		});

		$('.home').on('click',function(){
			self.removeActiveTab();
			$(this).addClass('tab-active');
			self.dewantaraPageMain.showPage();
		});

		$('.admin').on('click',function(){
			self.removeActiveTab();
			$(this).addClass('tab-active');
			self.dewantaraPageMain.hidePage();
		});
	},
	setAccessLevel : function (accessLevel){
		this.data = {};
		this.data.accessLevel = accessLevel;
	},
	successLogin : function (){
		this.setAccessLevel(this.cookiesController.getAccessLevel());
		this.render();
	},
	
	postRender: function (){
		var self = this;
		self.spinnerController.showSpinner();
		var username = self.cookiesController.getCookie('username');
		self.requestAPI.request('/getSiswaList',"GET","username="+username , function(response){
			self.spinnerController.hideSpinner();
			if(response.status == 'success'){
				self.dewantaraPageMain.setData(response.ListSiswa);
				self.dewantaraPageMain.render();
			}
		},function(errorResponse){
			self.spinnerController.hideSpinner();
		});
	}
});
