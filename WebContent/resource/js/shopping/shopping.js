//shoppingList
$(function(){
	$('.productDelete').click(function(){
		var c_shopping_id = $(this).parents('tr').children('td').children().eq(0).val();
		if(confirm("payment >>> ")){
			$('#c_shopping_id').val(c_shopping_id);
			$('#shoppingList').attr('action','/shopping/shoppingDelete.crm').submit();
		}
	});
	
	$('.productUpdate').click(function(){
		var c_shopping_id = $(this).parents("tr").children("td").children().eq(0).val();
		var c_id = $(this).parents("tr").children("td").children().eq(1).val();
		if(confirm("delete >>> ")){
			$('#c_shopping_id').val(c_shopping_id);
			$('#c_id').val(c_id);
			$('#shoppingList').attr('action','/shopping/shoppingUpdate.crm').submit();
		}
	});
});