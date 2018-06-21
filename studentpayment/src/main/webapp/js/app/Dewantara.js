Clazz.createPackage("com.dewantara");

Clazz.com.dewantara.Dewantara = Clazz.extend(Clazz.WidgetWithTemplate, {
	defaultContainer : "overview\\:main-body-container",
	templateUrl : "../../template/mainPage.tmp",
	onSuccessSignOut : null,
	spinnerController: null,
	cookiesController: null,
	requestAPI: null, 

	initialize: function(config){
		this.spinnerController = config.spinnerController;
		this.cookiesController = config.cookiesController;
		this.requestAPI = config.requestAPI;
		
	},
	
	bindUI : function (){
		
		 
	},
	
	postRender: function(){
		 $('#list-siswa').DataTable({
			 "columnDefs": [
		            {
		                "targets": [ 3 ],
		                "visible": false,
		                "searchable": false
		            }
		        ]
		 });
	},
	
	showPage : function(){
		$('.home-page').removeClass('hide');
		$('.home-page').addClass('show');
	},
	
	hidePage : function(){
		$('.home-page').removeClass('show');
		$('.home-page').addClass('hide');
	},
	
	setData: function(listSiswa){
		this.data.ListSiswa = listSiswa;
	}
});
