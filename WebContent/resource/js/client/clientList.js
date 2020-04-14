//clientList
//clientList
$(function(){
	$("#insertBt").click(function(){
		$("#clientForm")
		.attr("action","/client/clientInsertForm.crm")
		.submit();
	});
	
	$("#updateBt").click(function(){
		$("#clientForm")
		.attr("action","/user/userUpdateForm.crm")
		.submit();
	});
	
	$("#deleteBt").click(function(){
		if(confirm('퇴사를 진행할까요')){
			$("#clientForm")
			.attr("action","/user/userDelete.crm")
			.submit();
		}
	});
	
	$(".button").click(function(){
		var keyword = $("#keyword").val().trim();
		if(keyword == null || keyword ==""){
			$("#search").val("");
		}
		$("#clientForm")
		.attr("action","/client/clientSearchList.crm")
		.submit();
	});
	
	$("#keyword").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) { 	
        	var keyword = $("#keyword").val().trim();
    		if(keyword == null || keyword ==""){
    			$("#search").val("");
    		}
    		$("#clientForm")
    		.attr("action","/client/clientSearchList.crm")
    		.submit();
        }
    });
});

//clientList
function clientName(_c_Client_No){
	
	$("#c_Client_No").val(_c_Client_No); 
	
	if(confirm('고객 정보를 변경하시겠어요 ?')){
		
		$("#clientForm")
		.attr("action","/client/clientUpdateForm.crm")
		.submit();
	}
}
