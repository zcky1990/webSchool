var defaultPath = '';
var version = "1.0.0";

$(document).ready(function(){
	requirejs.config({
		urlArgs : "version="+version,
		baseUrl : "../../js/",
		waitSeconds: 50,
		paths : {
			"lib" : "../lib",
			"api" : "api",
			"app" : "app"
		},

		shim : {
			"framework/Class" : {
				exports : "Class"
			},

			"framework/Base" : {
				deps : ["framework/Class"],
				exports : "Base"
			},

			"framework/TemplateProvider" : {
				deps : ["framework/Base"],
				exports : "TemplateProvider"
			},

			"framework/Widget" : {
				deps : ["framework/TemplateProvider"],
				exports : "Widget"
			},

			"framework/WidgetWithTemplate" : {
				deps : ["framework/Widget", "framework/TemplateProvider"],
				exports : "WidgetWithTemplate"
			},

			"api/JiraAPI" : {
				deps : ["framework/Base"],
				exports : "JiraAPI"
			}
		},

		deps : ["framework/WidgetWithTemplate"],

		callback : function() {
			var dashboardFiles = [  
				"framework/NavigationController", 
				"framework/AnimationProvider",
				"api/Spinner",
				"api/RequestAPI",
				"api/Cookies",
				"app/ContentController",
				"app/LoginPage",
				"app/Dewantara",
				];
			require(dashboardFiles,function() {
				var spinner  = new Clazz.com.dewantara.Spinner();
				spinner.render();
				var requestAPI = new Clazz.com.dewantara.RequestAPI();
				var cookies  = new Clazz.com.dewantara.Cookies();
				var login = new Clazz.com.dewantara.LoginPage({
					'spinnerController' : spinner,
					'cookiesController' : cookies,
					'requestAPI' : requestAPI
				});
				
				var mainContent = new Clazz.com.dewantara.ContentController({
					'spinnerController' : spinner,
					'cookiesController' : cookies,
					'requestAPI' : requestAPI
				});
					
				mainContent.onSuccessSignOut.add(login.render,login);
				login.onSuccessSubmit.add(mainContent.successLogin, mainContent);
				var isCookiesExist = cookies.checkCookie();
				if(isCookiesExist == true){
					mainContent.setAccessLevel(cookies.getAccessLevel());
					mainContent.render();
				}else{
					login.render();
				}
			});
		}
	});
});