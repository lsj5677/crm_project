<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="user" value="${sessionScope.c_User_Id}" /> 
<!--sidebar-wrap-->
<div class="sidebar-wrap">
	<!--sidebar-logo-wrap-->
	<div class="sidebar-logo-wrap">
		<!--sidebar-logo-content-->
		<div class="sidebar-logo-content">
			<a href="/dashBoard/home.crm" title="Dashboard"> 
				<img src="/resource/img/logo.png" alt="crm logo" />
			</a>
		</div>
		<!--logo-content-->
	</div>
	<!--//logo-wrap-->
	<!--sidebar-menu-wrap-->
	<nav class="sidebar-menu-wrap">
		<!--sidebar-menu-content-->
		<div class="sidebar-menu-content">
			<ul>
				<!--sidebar-search-wrap-->
				<li class="sidebar-1depth-menu sidebar-search-wrap">
					<div>
						<div class="input-group">
							<form name="productForm" method="post">
								<input type="text" class="input-text" id="productName"name="productName" placeholder="Text Search" onkeydown="JavaScript:Enter_Check();">
							</form>
							<button class="input-button" style="right: 20px;" onclick="searchProduct()" >
								<i class="fa fa-search fa-sm"></i>
							</button>
							<button class="input-button" data-toggle="modal" data-target="#imageSearch">
								<i class="fas fa-camera fa-sm"></i>
							</button>
						</div>
					</div>
				</li>
				<!--//sidebar-search-wrap-->
				<li class="sidebar-1depth-menu">
					<a href="/dashBoard/home.crm" title="Dashboard" class="menu-on"> 
						<i class="fa fa-th-large"></i> 
						<span>Dashboard</span>
					</a>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="/fullCalendar/schedule.crm" title="Calendar">
						<i class="fa fa-table"></i> 
						<span>Calendar</span>
					</a>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="#" title="Chart" class="slide-toggle"> 
						<i class="fa fa-bar-chart-o"></i> 
						<span>Chart</span>
						<i class="fa fa-angle-right fa-right"></i>
					</a>
					<ul class="sidebar-2depth-menu">
						<li><a href="/tsales/tsalesList.crm" title="매출">매출</a></li>
						<li><a href="/performance/performanceMove.crm" title="실적">실적</a></li>
					</ul>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="#" title="My client" class="slide-toggle">
						<i class="fa fa-user-tie"></i> 
						<span>My client</span>
						<i class="fa fa-angle-right fa-right"></i>
					</a>
					<ul class="sidebar-2depth-menu">
						<li><a href="/client/clientList.crm" title="list">List</a></li>
						<li><a href="/client/clientInsertForm.crm" title="insert">Insert</a></li>
					</ul>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="/product/productList.crm" title="Product">
						<i class="fa fa-gem"></i> 
						<span>Product</span>
					</a>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="/shopping/shoppingList.crm" title="Hold List">
						<i class="fa fa-shopping-cart"></i> 
						<span>Hold List</span>
					</a>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="#" title="Board" class="slide-toggle">
						<i class="fa fa-laptop"></i> 
						<span>Board</span>
						<i class="fa fa-angle-right fa-right"></i>
					</a>
					<ul class="sidebar-2depth-menu">
						<li><a href="/board/boardList.crm?c_board_select=전체" title="전체게시판">전체게시판</a></li>
						<li><a href="/board/boardList.crm?c_board_select=공지사항" title="공지사항">공지사항</a></li>
						<li><a href="/board/boardList.crm?c_board_select=자유게시판" title="자유게시판">자유게시판</a></li>
						<li><a href="/materials/listBoard.crm" title="자료실">자료실</a></li>
					</ul>
				</li>
				<li class="sidebar-1depth-menu">
					<a href="/survey/surveyList.crm" title="Survey">
						<i class="fa fa-envelope-open"></i> 
						<span>Survey</span>
					</a>
				</li>
				<c:if test="${sessionScope.c_User_Id.c_User_Level eq '0'}">
					<li class="sidebar-1depth-menu">
						<a href="#" title="My User" class="slide-toggle">
							<i class="fa fa-user"></i> 
							<span>User</span>
							<i class="fa fa-angle-right fa-right"></i>
						</a>
						<ul class="sidebar-2depth-menu">
							<li><a href="/user/userList.crm" title="list">List</a></li>
							<li><a href="/user/userInsertForm.crm" title="insert">Insert</a></li>
						</ul>
					</li>
				</c:if>
			</ul>
		</div>
		<!--//sidebar-menu-content-->
	</nav>
	<!--//sidebar-menu-wrap-->
</div>
<!--//sidebar-wrap-->

<!-- Modal -->
<div class="modal fade" id="imageSearch" tabindex="-1" role="dialog" aria-labelledby="imageSearch" aria-hidden="true">
 	<div class="modal-dialog" role="document">
    	<div class="modal-content">
      		<div class="modal-header">
		        <h5 class="modal-title" id="imageSearch">Image Search</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          	<span aria-hidden="true">&times;</span>
		        </button>
	 		</div>
      		<div class="modal-body">
			    <div class="container file-upload">
			        <div class="image-upload-wrap">
			            <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />
			            <div class="drag-text">
			                <h3 class="mb-5 pb-5 pt-4  upload-text">Upload Picture</h3>
			            </div>
			        </div>
			        <div class="file-upload-content">
			            <img class="file-upload-image" id="upload-image" src="#" alt="your image" />
			            
			            <div id="loading" class="animated bounce">
			                <div class="spinner-border" role="status">
			                    <span class="sr-only">Loading...</span>
			                </div>
			                <p class="text-center">Analyzing...</p>
			            </div>
			            <p class="result-message"></p>
			            <div id="label-container" class="d-flex flex-column justify-content-around"></div>
			            <div class="addthis_inline_share_toolbox_6lz1"></div>
			            
			            <div class="image-title-wrap">
			                <button type="button" onclick="window.location.reload()" class="try-again-btn">
                  					<span class="try-again-text">retry</span>
              					</button>
			            </div>
			        </div>
			    </div>
			</div>
      		<div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      	</div>
    	</div>
  	</div>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>

<!-- Text Search -->
<script>
	function Enter_Check(){
		if(event.keyCode == 13){
			searchProduct();
		}
	}

	function searchProduct(){
		var productForm = document.productForm;
		var text = productForm.productName.value;
		
		if(text != ''){
			productForm.action="/product/productSearch.crm";
			productForm.submit();
		}
		return;
	}
</script>