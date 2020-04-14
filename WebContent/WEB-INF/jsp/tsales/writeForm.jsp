<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Target Sales Write</title>
		<link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/board/boardInsert.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
		<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
		<script type="text/javascript" src="/resource/js/common/jquery.xdomainajax.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>
		
		<script src="/resource/js/chart/tsales.js"></script>
			
	</head>
	<body>
	<div class="wrap">
		<!--header-->
		<header class="header">
			<%@include file="../common/header.jsp"%>
		</header>
		<!-- //header -->

		<!-- sidebar -->
		<aside class="sidebar">
			<%@include file="../common/sidebar.jsp"%>
		</aside>
		<!-- //sidebar -->

		<div class="container">
			<div class="wrap board-wrap">	
				<!--title-->
				<div class="title">	
					<h3>Target Sales Write</h3>
					<p>매출 입력</p>
				</div>	
				
				<div class="subWrap">
					<div class="contents">
						<form id="targetForm" name="targetForm" enctype="application/x-www-form-urlencoded">
							<table>
		
								<tr>
									<th>Year/Month</th>
									<th>Target Sales</th>
								</tr>
								<tr>
									<td>연도 </td>
									<td><input type="text" id="year" name="year"></td>
								</tr>
								<tr>
									<td>1월 </td>
									<td><input type="text" id="jan" name="jan"></td>
								</tr>
								<tr>
									<td>2월</td>
									<td><input type="text" id="feb" name="feb"></td>
								</tr>
								<tr>
									<td>3월</td>
									<td><input type="text" id="mar" name="mar"></td>
								</tr>
								<tr>
									<td>4월</td>
									<td><input type="text" id="apr" name="apr"></td>
								</tr>
								<tr>
									<td>5월</td>
									<td><input type="text" id="may" name="may"></td>
								</tr>
								<tr>
									<td>6월</td>
									<td><input type="text" id="jun" name="jun"></td>
								</tr>
								<tr>
									<td>7월</td>
									<td><input type="text" id="jul" name="jul"></td>
								</tr>
								<tr>
									<td>8월</td>
									<td><input type="text" id="aug" name="aug"></td>
								</tr>
								<tr>
									<td>9월</td>
									<td><input type="text" id="sep" name="sep"></td>
								</tr>
								<tr>
									<td>10월</td>
									<td><input type="text" id="oct" name="oct"></td>
								</tr>
								<tr>
									<td>11월</td>
									<td><input type="text" id="nov" name="nov"></td>
								</tr>
								<tr>
									<td>12월</td>
									<td><input type="text" id="dec" name="dec"></td>
								</tr>
								<tr>
									<td colspan="2" align="right"><input type="button" id="donebtn" class="crmButton" value="등록하기"></td>
								</tr>
							</table>
						</form>
					</div>	
				</div>
			</div>
			</div>
		<!--footer-->
		<footer class="footer">
			<%@include file="../common/footer.jsp"%>
		</footer>
		<!-- //footer -->
		</div>
	</body>
</html>