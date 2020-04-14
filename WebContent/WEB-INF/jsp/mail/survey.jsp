<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객경험설문조사</title>
			<style type="text/css">
			#sform{
					width: 80%;
					margin: auto;
				    padding: 20px;
					
			}
			#sform h1{
					text-align: center;
			}
			#opinion{
					width: 100%;
					height: 200px;
					resize: none;
					background-color: transparent;
				
			}
			#dropdown{
					background-color: transparent;
			}
			body{
					background-color: #f5f5f5;
			}
		
			#donebtn{
					display: block;
					margin: auto;
			}
			.essential{
					margin-bottom: 30px;
   					border-bottom: 1px dotted #ddd;
    				padding-bottom: 30px;
			}
			.essential:first-child,
			.essential:last-child {
				border-bottom: none;
			}
			
			.essential h3 {
				font-size: 15px;
			}
			.essential.cgroup {
				border-bottom: none;
				text-align: right;
			    font-size: 13px;
			}
			.cgroup input{
					border: none;
					border-bottom: 1px solid #ddd;
					background-color: transparent; 
					margin-bottom: 5px;
					padding: 3px 10px;
			}
			
			.label-group {
				margin-top: 20px;
			}
			
			.label-group label {
				margin-right: 5px;
				font-size: 13px;
   				vertical-align: middle;
			}
			
			.label-group label input {
			   	vertical-align: text-top;
			}
			.opini_content{
					width: 100%; 
					height: 180px; 
					resize:none;
					padding: 10px;
					outline: none;
					box-sizing: border-box;
					border-color: #ddd;
					font-family: sans-serif;
			}
			
			.bytes-wrapper {
				text-align: right;
			}
			
			.bytes-wrapper .bytes {
				margin-right: 5px;
			}
			
			#fback {
				text-align: center;
			}
			
			#donebtn {
				background-color: #ddd;
			    border: 1px solid #aaa;
			    padding: 10px 50px;
			    border-radius: 3px;
			    font-size: 14px;
			    margin-top: 10px;
			    cursor: pointer;
			}
			
			#donebtn:hover {
				background-color: #ccc;
				transition: .3s all ease;
			}
			</style>
	</head>
			<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
			<script type="text/javascript">
					$(function(){
						$("#donebtn").click(function(){
							$("#sform").attr("action", "/survey/surveyInsert.crm").submit();
						});
						
						$('.opini_content').keyup(function(){
							cut_300(this);
						});
						$('.opini_content').click(function(){
							if(getTextLength($('.opini_content').val()) < 300){
								return false;
							}
						});
					});
					function getTextLength(str){
						var len = 0;
						for(var i = 0; i < str.length; i++){
							if(escape(str.charAt(i)).length==6){
								len++;
							}
							len++;
						}
						return len;
					}
					function cut_300(obj){
						var text = $(obj).val();
						var leng = text.length;
						while(getTextLength(text) > 300){
							leng--;
							text = text.substring(0, leng);
						}
						$(obj).val(text);
						$('.bytes').text(getTextLength(text));
					}
			</script>
	<body>
			
			<form id="sform" name="sform" method="post" enctype="application/x-www-form-urlencoded">
			<div class="essential">
				<h1>고객만족도 설문조사서</h1>
			</div>
				<div class="essential cgroup">
						*고객명:<input type="text" id="c_name" name="c_client_name" readonly="readonly" value="<c:out value="${map.to_Client_Name}"/>">
						*이메일:<input type="email" id="c_email" name="c_client_email" readonly="readonly" value="<c:out value="${map.to_Client_Email}"/>">
						*담당사원:<input type="text" id="user_id" name="c_user_name" readonly="readonly" value="<c:out value="${map.to_user_Name}"/>">
				</div>
				
				<div class="essential">	
				<div id="q1">
				<h3>1.브랜드 서비스에 대해 평가해주세요.</h3>
				</div> 
				<div id="selection" class="label-group">
				<label><input type="radio" name="c_overall" value="만족">만족</label>
				<label><input type="radio" name="c_overall" value="보통">보통</label>
				<label><input type="radio" name="c_overall" value="불만족">불만족</label>
		        </div>
		        </div>
		        
		        <div class="essential">
			    <div id="q2">
			      <h3>2.가장 만족스러우셨던 서비스 부분을 체크해주세요:</h3>
			    </div>
			      <div id="checkbox" class="label-group">
			        <label><input type="radio" name="c_satisf" value="따뜻한매장분위기">따뜻한 매장 분위기</label>
			        <label><input type="radio" name="c_satisf" value="직원들의친절도">직원들의 친절도</label>
			        <label><input type="radio" name="c_satisf" value="우수한매장시설">우수한 매장시설</label>
			        <label><input type="radio" name="c_satisf" value="우수한무선인터넷">우수한 무선인터넷</label>
			        <label><input type="radio" name="c_satisf" value="우수한접대서비스">우수한 접대서비스</label>
			        <label><input type="radio" name="c_satisf" value="매장의청결도">매장의 청결도</label>
			        <label><input type="radio" name="c_satisf" value="없음">없음</label>
			     </div>
				 </div>
				 
				<div class="essential">
			    <div id="q3">
			      <h3>3.가장 만족스럽지 못하신 서비스 부분을 체크해주세요:</h3>
			    </div>
			      <div id="checkbox2" class="label-group">
			        <label><input type="radio" name="c_feedback" value="차가운매장분위기">차가운 매장 분위기</label>
			        <label><input type="radio" name="c_feedback" value="직원들의불친절함">직원들의 불친절함</label>
			        <label><input type="radio" name="c_feedback" value="부실한매장시설">부실한 매장시설</label>
			        <label><input type="radio" name="c_feedback" value="느린무선인터넷">느린 무선인터넷</label>
			        <label><input type="radio" name="c_feedback" value="부실한접대서비스">부실한 접대서비스</label>
			        <label><input type="radio" name="c_feedback" value="청결하지못한매장">청결하지 못한 매장</label>
     			    <label><input type="radio" name="c_feedback" value="없음">없음</label>
			        
			     </div>
				 </div>
				 
				 <div class="essential">
		         <div id="q4">
		          	<h3>4.본 매장의 방문을 주변인에게 추천해줄 의향이 있으십니까?</h3>
		         </div>
		         <div id="radioBtn" class="label-group">
		            <label><input type="radio" name="c_recommend" value="그렇다">그렇다</label>
		            <label><input type="radio" name="c_recommend" value="아마도">아마도</label>
		            <label><input type="radio" name="c_recommend" value="아니다">아니다</label>
	            </div>
      			</div>
      			
      			<div class="essential">
      			<div id="q5">
      				<h3>5.고객님의 의견을 들려주세요.</h3>
   				</div>
   				<div class="opitext">
      				<textarea class="opini_content" id="c_opinion" name="c_opinion" placeholder="여기에 작성해주세요. 입력가능한 글자수는 300bytes입니다." ></textarea>
      				<div class="bytes-wrapper">
							<span class="bytes">0</span>bytes
						</div>
      				<p id="fback">* 작성해주셔서 감사합니다.</p>
      				<input type="button" id="donebtn" value="완료">
   				</div>      	
      			</div>
			</form>
	</body>
</html>