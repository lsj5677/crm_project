<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
	    
	    <link rel="stylesheet" href="/resource/css/common/reset.css">
		<link rel="stylesheet" href="/resource/css/common/common.css">
		<link rel="stylesheet" href="/resource/css/common/sub_common.css">
		<link rel="stylesheet" href="/resource/css/common/responsive.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap" rel="stylesheet">
		
		<link rel=" shortcut icon" href="/resource/api/fullCalendar_v3.9.0/image/favicon.ico">
   	    <link rel="stylesheet" href="/resource/api/fullCalendar_v3.9.0/vendor/css/bootstrap.min.css">
 	    <link rel="stylesheet" href="/resource/api/fullCalendar_v3.9.0/vendor/css/fullcalendar.min.css" />
   	    <link rel="stylesheet" href="/resource/api/fullCalendar_v3.9.0/vendor/css/bootstrap.min.css">
    	<link rel="stylesheet" href='/resource/api/fullCalendar_v3.9.0/vendor/css/select2.min.css' />
    	<link rel="stylesheet" href='/resource/api/fullCalendar_v3.9.0/vendor/css/bootstrap-datetimepicker.min.css' />
    	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    	<link rel="stylesheet" href="/resource/api/fullCalendar_v3.9.0/css/main.css">

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
		    	<!--title-->
				<div class="title">	
					<h3>Calendar</h3>
					<p>캘린더</p>
				</div>	
		    	<div class="subWrap">
					<div class="contents">
			        <div id="wrapper">
			            <div id="loading"></div>
			            <div id="calendar"></div>
			        </div>
			
			        <!-- MODAL -->
			        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
			            <div class="modal-dialog" role="document">
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                        	<span aria-hidden="true">&times;</span>
			                        </button>
			                        <h4 class="modal-title">일정 추가</h4>
			                    </div>
			                    <div class="modal-body">
			
			                        <div class="row">
			                           	<div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-title">제목</label>
			                                <input class="inputModal" type="text" id="edit-title" required />
			                           	</div>
			                        </div>
			                       
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-start">시작일</label>
			                                <input class="inputModal" type="date" id="edit-start" />
			                            </div>
			                        </div>
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-start-time">시작 시간</label>
			                                <input class="inputModal" type="time" id="edit-start-time" />
			                            </div>
			                        </div>
			                        
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-end">종료일</label>
			                                <input class="inputModal" type="date" id="edit-end" />
			                            </div>
			                        </div>
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-end">종료 시간</label>
			                                <input class="inputModal" type="time" id="edit-end-time" />
			                            </div>
			                        </div>
			                        
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-color">배경색상</label>
			                                <select class="inputModal" id="edit-color">
			                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
			                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
			                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
			                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
			                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
			                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
			                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
			                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
			                                    <option value="#495057" style="color:#495057;">검정색</option>
			                                </select>
			                            </div>
			                        </div>
			                        
			                        <div class="row">
			                            <div class="col-xs-12">
			                                <label class="col-xs-4" for="edit-desc">설명</label>
			                                <textarea rows="4" cols="50" class="inputModal" id="edit-desc"></textarea>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="modal-footer modalBtnContainer-addEvent" id="addBtn">
			                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
			                    </div>
			                    <div class="modal-footer modalBtnContainer-modifyEvent" id="modifyBtn">
			                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
			                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
			                    </div>
			                </div><!-- /.modal-content -->
			            </div><!-- /.modal-dialog -->
			        </div><!-- /.modal -->
					</div><!-- /.contents -->
				</div><!-- /.subWrap -->
		    </div>
		    <!-- /.container -->
	    
			<!--footer-->
			<footer class="footer">
				<%@include file="../common/footer.jsp"%>
			</footer>
			<!-- //footer -->
			</div>
	
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    	<script src="/resource/api/fullCalendar_v3.9.0/vendor/js/jquery.min.js"></script>
    	<script type="text/javascript" src="/resource/js/common/common.js"></script>
		<script type="text/javascript" src="/resource/js/common/responsive.js"></script>
		<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
	
	    <script src="/resource/api/fullCalendar_v3.9.0/vendor/js/jquery.min.js"></script>
	    <script src="/resource/api/fullCalendar_v3.9.0/vendor/js/moment.min.js"></script>
	    <script src="/resource/api/fullCalendar_v3.9.0/vendor/js/fullcalendar.min.js"></script>
	    <script src="/resource/api/fullCalendar_v3.9.0/vendor/js/ko.js"></script>
	    <script src="/resource/api/fullCalendar_v3.9.0/vendor/js/select2.min.js"></script>
	    <script src="/resource/api/fullCalendar_v3.9.0/vendor/js/bootstrap.min.js"></script>
	    <script src="/resource/api/fullCalendar_v3.9.0/js/main.js"></script>
	    <script src="/resource/api/fullCalendar_v3.9.0/js/addEvent.js"></script>
	    
	</body>

</html>