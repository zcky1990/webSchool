function setCookie(response) {
    var d = new Date();
    d.setTime(d.getTime() + (1*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    var details = response.details[0];
    var cname = details.username;
    var lvl = details.level;
    document.cookie = "username=" + cname + ";" + expires + ";path=/";
    document.cookie = "access=" + lvl + ";" + expires + ";path=/";
}

function getCookie(cname) {
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

function checkCookie() {
    var user = getCookie("username");
    var user = getCookie("access");
    if (user != "") {
        alert("Welcome again " + user);
    } else {
    	 	alert("please login ");
    }
}

function test(response){
	alert(JSON.stringify(response));
}

function getLoginModel(username, password){
  	var loginModel = {};
  	loginModel.username =username;
  	loginModel.password =password;
  	return loginModel;
}

$(document).ready(function() {
	checkCookie();
    $('#example').DataTable();
    
    $('.test-btn').on('click',function(){
    		request(defaultPath+'/login',"POST", JSON.stringify(getLoginModel('admin','admin')) , function(response){
    			test(response);
    			setCookie(response);
    		},function(errorResponse){
    			test(errorResponse);
    		});
    })
} );