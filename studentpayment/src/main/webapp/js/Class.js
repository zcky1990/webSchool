class request  {
	constructor() {
	}
	request(url, methodType, dataRequest, callbackFunction, errorHandler, _timeout) {
		$.ajax({
			type : methodType,
			url : url,
			contentType : "application/json",
			data : dataRequest,
			timeout : _timeout === undefined ? 500000 : _timeout,
					header : {
						'Access-Control-Allow-Headers' : 'x-requested-with',
						'Accept': 'application/json',
						'Content-Type': 'application/json',
						'Access-Control-Allow-Origin': '*',
						'Access-Control-Allow-Methods': 'PUT, DELETE, POST, GET'
					},
					error : function(jqXHR) {
						if (errorHandler !== undefined) {
							errorHandler(jqXHR);
						} else{
							console.log("error : "+jqXHR);
						};
					},
					success : function(data, status, jqXHR) {
						callbackFunction(data, status);
					}
		});
	}
};

class common {
	constructor() {
	}
	showSpinner (){
		$( ".dialog" ).append( '<div class=dialog-spinner spiner-container><div class="spinner-background"></div><div class="spinner"></div></div>' );
	}
	hideSpinner (){
		$( ".dialog-spinner" ).remove();
	}
	setCookie (response) {
		var d = new Date();
		d.setTime(d.getTime() + (1*24*60*60*1000));
		var expires = "expires="+ d.toUTCString();
		var details = response.details[0];
		var cname = details.username;
		var lvl = details.level;
		document.cookie = "username=" + cname + ";" + expires + ";path=/";
		document.cookie = "access=" + lvl + ";" + expires + ";path=/";
	}
	getCookie (cname) {
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
		return "";
	}
	checkCookie() {
		var user = this.getCookie("username");
		if (user != "") {
			return true;
		} else {
			return false;
		}
	}
	getAccessLevel(){
		return this.getCookie("access");
	}
	deleteCookies(){
		this.setCookiesExpired("username");
		this.setCookiesExpired("access");
	}
	setCookiesExpired(name){
		document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	}
}



