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

function popup(){
    var url = "/imageSearch/imageSearch.jsp";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, option);
}