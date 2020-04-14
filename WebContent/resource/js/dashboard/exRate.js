$(function(){
	
	var country = ['USD','JPY','CNY','EUR'];
	var url = 'https://quotation-api-cdn.dunamu.com/v1/forex/recent?codes=FRX.KRW';
	
	for(var key in country){
		getRate(url+country[key]);	
	}
	
	function getRate(url){
		$.ajax({ 
			url: url, 
			type: "get", 
			dataType : 'json',
			success: function(data){ 
				for(var key in data){
//					console.log(data);
					
					$('#exRate').append('<ul class="exRateBox exConBox">'
							+'<li class="name">'+ data[key].name +'<span class="currencyImg"></span></li>'
							+'<li class="basePrice">'+ data[key].basePrice +'</li>'
							+'<li class="cashBuyingPrice price"> <span class="price-title">Buying Price  </span>'+ data[key].cashBuyingPrice +'</li>'
							+'<li class="cashSellingPrice price"> <span class="price-title">Selling Price  </span>'+ data[key].cashSellingPrice +'</li>');
				}
			} 
		});
	}
});