Clazz.createPackage("com.dewantara");

Clazz.com.dewantara.Spinner = Clazz.extend(Clazz.WidgetWithTemplate, {
	defaultContainer : "overview\\:dialog",
	templateUrl : "../../template/spiner.tmp",

	showSpinner: function(){
		$( ".dialog" ).css('display','block');
	},
	hideSpinner: function(){
		$( ".dialog" ).css('display','none');
	}
});
