$(function(){
	
	$.get("/board/boardNotice.crm",function(json) {
		for(var i=0; i <= 3; i++){
//			console.log(json[i].c_board_select);
//			console.log(json[i].c_board_name);
//			console.log(json[i].c_board_title);
//			console.log(json[i].c_board_insertdate);
//			console.log(json[i].c_board_no);
			
			var boardSelect = json[i].c_board_select;
			var boardName = json[i].c_board_name;
			var boardTitle = json[i].c_board_title;
			var boardInsertDate = json[i].c_board_insertdate;
			var boardNumber = json[i].c_board_no;
		
			$('#noticeTable').append(
					'<tbody><tr><td class="board_title">'+boardTitle
					+'<input type="hidden" class="board_no" name="c_board_no" value="'+boardNumber+'" /></td>'
					+'<td class="board_name">'+boardName+'</td>'
					+'<td class="board_insertdate">'+boardInsertDate+'</td></tr></tbody>');
		}
	},'json' )
	
	$('table').on('click', 'tr', function() {
		var c_board_no = $(this).find("[name='c_board_no']").val();
	    location.href = '/board/boardDetail.crm?c_board_no='+c_board_no;
	});
	
});
	