//surveyList
$(function(){
	$(".goDetail").click(function(){
		var c_client_no = $(this).parents("tr").attr("data-num");
		$("#c_client_no").val(c_client_no);
		$("#detailForm").attr({
			"method":"get",
			"action":"/survey/surveyDetail.crm"
		});
		$("#detailForm").submit();
	});
});