var defaultPath = '';

function request (url, methodType, dataRequest, callbackFunction, errorHandler, _timeout) {
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