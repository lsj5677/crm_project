<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>설문참여완료</title>
		<style>
			body {
				background-color: #f5f5f5;
				position: relative;
			}
			.wrap {
				width: 100%;
				height: 100vh;
			}
			.subWrap {
				width: 80%;
				margin: 0 auto;
			}
			
			#cmpltform {
				position: absolute;
			    width: 100%;
			    top: 50%;
			    left: 50%;
			    transform: translate(-50%,-50%);
			    text-align: center;
			}
			
			#cmpltform h1 {
				font-size: 30px;
			}
			
			#closebtn {
				background-color: #ccc;
			    border: 1px solid #aaa;
			    padding: 10px 30px;
			    border-radius: 3px;
			    font-size: 14px;
			    margin-top: 10px;
			    cursor: pointer;
			    
			}
			
			#closebtn:hover {
				background-color: #eee;
				transition: .3s all ease;
			}
			
			
		</style>
		<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
		<script type="text/javascript">
		
		$(function(){
			$("#closebtn").click(function(){
				window.open('https://www.hermes.com/us/en/', '_self', '');
				window.close();
			});
		});
		</script>
	</head>
	<body>
		<div class="wrap">
			<div class="subWrap">
				<form id="cmpltform" name="cmpltform" enctype="application/x-www-form-urlencoded">
					<h1>참여해주셔서 감사합니다. <br>고객님의 성원에 보답하겠습니다.</h1>
					<input type="button" id="closebtn" value="상품둘러보기">
				</form>
			</div>
		</div>
	</body>
</html>