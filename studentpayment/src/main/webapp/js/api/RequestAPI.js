Clazz.createPackage("com.dewantara");

Clazz.com.dewantara.RequestAPI = Clazz.extend(Clazz.Base, {
	xhr : null,
	timeLimit : 45000,
	timeOut : 90000,
	//to solve caching issue for iOS 6
	//always send current time to differ every request.
	getTimeStamp : function(){
		var date = new Date();
		return date.getTime(); 
	},

	ajaxRequest : function(jiraUrl, postBody, callbackFunction, scope) {

		$.ajax({
			url: jiraUrl,
			data : JSON.stringify(postBody),
			contentType: 'application/json',
			type : "POST",
			dataType : "json",
			timeout: 7000000,
			header : {
				'Access-Control-Allow-Headers' : 'x-requested-with',
				'Accept': 'application/json',
				'Content-Type': 'application/json',
				'Access-Control-Allow-Origin': '*'
			},
		})
		.done(function(jsonResult) {
			callbackFunction(jsonResult, scope);
		})
		.fail(function(jqXHR, textStatus) {
			$("#spinnerLoading").css('display','none');
			$(".spinner-background").css('display','none');
			window.spinner.stop();
			if(!navigator.onLine){
				widgetPopUP.showPopUp(); 
			}
			console.log( "There is an error fetching the data : " + textStatus );
		});
	},

	postDashboardResult: function(psUrl, dashboardResult, callbackFunction, scope) {
		$.ajax({
			url: psUrl,
			data : JSON.stringify(dashboardResult),
			contentType: 'application/json',
			type : "POST",
			dataType : "json",
			timeout: 7000000,
			header : {
				'Access-Control-Allow-Headers' : 'x-requested-with',
				'Accept': 'application/json',
				'Content-Type': 'application/json',
				'Access-Control-Allow-Origin': '*'
			},
		})
		.done(function(jsonResult) {
			callbackFunction(jsonResult, scope);
		})
		.fail(function(jqXHR, textStatus) {
			$("#spinnerLoading").css('display','none');
			$(".spinner-background").css('display','none');
			window.spinner.stop();
			console.log( "There is an error fetching the data : " + textStatus );
		});
	},

	request : function(url, methodType, dataRequest, callbackFunction, errorHandler, _timeout) {
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
	},
	
	initiateRequest : function(url, postBody, callbackFunction, scope){
		$.ajax({
			url: url,
			data : JSON.stringify(postBody),
			contentType: 'application/json',
			type : "POST",
			dataType : "json",
			timeout: 7000000,
			header : {
				'Access-Control-Allow-Headers' : 'x-requested-with',
				'Accept': 'application/json',
				'Content-Type': 'application/json',
				'Access-Control-Allow-Origin': '*'
			},
		})
		.done(function(jsonResult) {
			callbackFunction(jsonResult, scope);
		})
		.fail(function(jqXHR, textStatus) {
			$("#spinnerLoading").css('display','none');
			$(".spinner-background").css('display','none');
			window.spinner.stop();
			if(!navigator.onLine){
				widgetPopUP.showPopUp(); 
			}
			console.log( "There is an error fetching the data : " + textStatus );
		});
	}
});