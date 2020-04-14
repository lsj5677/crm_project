//userList
 $(document).ready(function(){
	$("#insertBt").click(function(){
		$("#userForm")
		.attr("action","/user/userInsertForm.crm")
		.submit();
	});
	
	$("#updateBt").click(function(){
		$("#userUpdateForm")
		.attr("action","/user/userUpdateForm.crm")
		.submit();
	});
	
	$("#deleteBt").click(function(){
		if(confirm('퇴사를 진행할까요')){
			$("#userUpdateForm")
			.attr("action","/user/userDelete.crm")
			.submit();
		}
	});
	
	$(".client_List").click(function(){
		var clientList = $(this).parent().children().last().val();
		$("#c_ClientList").val(clientList);
		$("#userForm")
		.attr("action","/user/userList.crm")
		.submit();
	});
	
	$(".button").click(function(){
		var keyword = $("#keyword").val().trim();
		if(keyword == null || keyword ==""){
			$("#search").val("");
		}
		$("#userForm")
		.attr("action","/user/userSearchList.crm")
		.submit();
	});
	
	 $("#keyword").keydown(function(key) {
            //키의 코드가 13번일 경우 (13번은 엔터키)
            if (key.keyCode == 13) { 	
            	var keyword = $("#keyword").val().trim();
    			if(keyword == null || keyword ==""){
    				$("#search").val("");
    			}
    			$("#userForm")
    			.attr("action","/user/userSearchList.crm")
    			.submit();
            }
        });

});

function userDetailName(c_User_Id){
	$("#c_User_Id").val(c_User_Id); 
	$("#userForm")
	.attr("action","/user/userList.crm")
	.submit();
}

//userInsert
$(document).ready(function(){
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$("input").keyup(function(){
		var pwd1 = $("#c_User_Pw").val();
		var pwd2 = $("#c_User_Pw2").val();
		if(pwd1 != "" || pwd2 != ""){ 
			if(pwd1 == pwd2){
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#c_User_Pw").prop("readonly",true);
				$("#userClick").attr("disabled", false);
			}else{
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#c_User_Pw").prop("readonly",false);
				$("#userClick").attr("disabled", "disabled");
			} 
		}
	});
	
	$("#userInsert").click(function(){
		if(!chkSubmit2($("#c_User_Id"),"아이디")) return;
		else if(!chkSubmit2($("#c_User_Pw"),"비밀번호를")) return;
		else if(!chkSubmit2($("#c_User_Name"),"이름을")) return;
		else if(!chkSubmit2($("#c_User_Department"),"부서를")) return;
		else if(!chkSubmit2($("#c_User_Hp"),"전화번호를")) return;
		else if(!chkSubmit2($("#c_User_Email"),"이메일을")) return;
		else if(!chkSubmit2($("#c_User_Birth"),"생년월일을")) return;
		else if(!chkSubmit2($("#c_User_Addr"),"우편번호를")) return;
		else if(!chkSubmit2($("#c_User_Addr2"),"도로명주소를")) return;
		else if(!chkSubmit2($("#c_User_Addr3"),"상세주소를")) return;
		else if(!chkSubmit2($("#c_User_Level"),"직급을")) return;
		if($("#idCheck").val() != "OK"){
			alert("아이디 중복 확인을 해주세요");
			return;
		}else{
			if(confirm('등록을 진행할까요')){
				$("#userInsertForm")
				.attr("action","/user/userInsertOk.crm")
				.submit();
			}
		}
	});
	
	$("#userMain").click(function(){
		$("#userInsertForm")
		.attr("action","/user/userList.crm")
		.submit();
	});
	
	$("#idCheck").click(function(){
		$.ajax({
			url : "/user/userIdCheck.crm",
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
			alert(bool);
			if(bool){
				alert("아이디 사용가능");
				$("#c_User_Id").prop("readonly", true);
				$("#idCheck").val("OK");
			}else{
				alert("중복된 아이디가 있습니다");
				$("#c_User_Id").val('');
				$("#c_User_Id").focus();
			}
		}
		
		function htkError(){
			alert("에이작스 실패 ");
		}
	});
});

//userUpdate
$(document).ready(function(){
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$("input").keyup(function(){
		var pwd1 = $("#c_User_Pw").val();
		var pwd2 = $("#c_User_Pw2").val();
		if(pwd1 != "" || pwd2 != ""){ 
			if(pwd1 == pwd2){
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#c_User_Pw").prop("readonly",true);
				$("#userClick").attr("disabled", false);
			}else{
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#c_User_Pw").prop("readonly",false);
				$("#userClick").attr("disabled", "disabled");
			} 
		}
	});

	$("#userUpdate").click(function(){
			if(confirm('수정을 진행할까요')){
				$("#userUpdateForm")
				.attr("action","/user/userUpdateOk.crm")
				.submit();
			}	
	});
	
	$("#userMain").click(function(){
		$("#userUpdateForm")
		.attr("action","/user/userList.crm")
		.submit();
	})
});

//공통
function chkSubmit2(v_item, v_msg){
	if(v_item.val().replace(/\s/g,"")== ""){
		alert(v_msg + "확인해 주세요");
		v_item.val("");
		v_item.focus();
		return false;
	}else{
		return true;
	}
}

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('c_User_Addr').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('c_User_Addr2').value = fullRoadAddr;
            //document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
        }
    }).open();
}