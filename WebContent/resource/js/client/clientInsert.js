//clientInsert
$(function(){
	
	$("#clientBt").click(function(){
		if(!chkSubmit2($("#c_Client_Name"),"고객 이름을")) return;
		else if(!chkSubmit2($("#c_Client_Hp"),"번호를")) return;
		else if(!chkSubmit2($("#c_Client_Email"),"이메일을")) return;
		else if(!chkSubmit2($("#c_Client_Birth"),"생년월일을")) return;
		else if(!chkSubmit2($("#c_Client_Addr"),"우편번호를")) return;
		else if(!chkSubmit2($("#c_Client_Addr2"),"도로명주소를")) return;
		else if(!chkSubmit2($("#c_Client_Addr3"),"상세주소를")) return;
		if($("#userCheck").val() == "OK"){
			if(confirm('등록을 진행할까요')){
				$("#clientInsertForm")
				.attr("action","/client/clientInsertOk.crm")
				.submit();
			}
		}else{
			alert("직원 확인을 해주세요");
			return;
		}
	});

	$("#userMain").click(function(){
		$("#clientInsertForm")
		.attr("action","/client/clientList.crm")
		.submit();
	})

	$("#userCheck").click(function(){
		
		$.ajax({
			url : "/client/clientCheck.crm",
			type : "POST",
			data : {
				c_User_Id : $("#c_User_Id").val()
			},
			success : htkSuccess,
			error   : htkError
		});
		
		function htkSuccess(data){
			
			var result = data;
			var bool = eval(result);
			
			if(bool){
				alert("직원 확인");
				$("#c_User_Id").prop("readonly", true);
				$("#userCheck").val("OK");
			}else{
				alert("직원을 다시 확인해 주세요");
				$("#c_User_Id").val('');
				$("#c_User_Id").focus();
			}
		}
		
		function htkError(){
			alert("에이작스 실패 ");
		}
	});
});	