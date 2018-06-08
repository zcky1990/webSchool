//used to test if datatable is function
function test(response){
	alert(JSON.stringify(response));
}

$(document).ready(function() {
    $('#example').DataTable();
    
    $('.test-btn').on('click',function(){
    	var asd = {};
    	asd.username ="admin";
    	asd.password ="admin";
    		request('/login',"POST",JSON.stringify(asd),function(response){
    			test(response);
    		},function(errorResponse){
    			test(errorResponse);
    		});
    })
} );