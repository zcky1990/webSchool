//used to test if datatable is function
function test(response){
	alert(JSON.stringify(response));
}

$(document).ready(function() {
    $('#example').DataTable();
    
    $('.test-btn').on('click',function(){
    		request('/test?email="ai"',"GET","",function(response){
    			test(response);
    		},function(errorResponse){
    			test(errorResponse);
    		});
    })
} );