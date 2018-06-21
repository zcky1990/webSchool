Clazz.createPackage("com.dewantara");

Clazz.com.dewantara.Cookies = Clazz.extend(Clazz.WidgetWithTemplate, {
	setCookie : function (response) {
		var d = new Date();
		d.setTime(d.getTime() + (1*24*60*60*1000));
		var expires = "expires="+ d.toUTCString();
		var details = response.details[0];
		var cname = details.username;
		var lvl = details.level;
		document.cookie = "username=" + cname + ";" + expires + ";path=/";
		document.cookie = "access=" + lvl + ";" + expires + ";path=/";
	},
	getCookie : function(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for(var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				return c.substring(name.length, c.length);
			}
		}
		return null;
	},
	checkCookie: function () {
		var user = this.getCookie("username");
		if (user != "" && user != null) {
			return true;
		} else {
			return false;
		}
	},
	getAccessLevel: function(){
		return this.getCookie("access");
	},
	deleteCookies : function(){
		this.setCookiesExpired("username");
		this.setCookiesExpired("access");
	},
	setCookiesExpired: function (name){
		document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	}
});