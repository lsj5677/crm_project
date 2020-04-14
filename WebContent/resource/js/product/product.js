//productList
$(function(){
	$('.holdBtn').click(function(){
		var c_id = $(this).parents("dd").children("ul").children("li").children().eq(0).val();
		var c_name = $(this).parents("dd").children("ul").children("li").children().eq(1).val();
		var insertUrl = "/shopping/shoppingInsert.crm"
		$.ajax({
			url : insertUrl,
			type : "post",
			data : {
				c_id : c_id,
				c_name : c_name
			},
			error : function(){
				alert("Error >>> ");
			},
			success : function(data){
				
				var bool = eval(data);
				if(bool){
					if(confirm("상품 예약하시겠습니까?")){
						location.href="/shopping/shoppingList.crm";
					}
				}else {
					alert("hold Error >>> ")
				}
			}
		});// end of ajax
	});// end of c_name click function
});// end of jquery function