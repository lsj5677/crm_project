package com.crm.common;

import com.crm.service.ShoppingService;

public class ShoppingTimer implements Runnable {
	
	private ShoppingService shoppingService;
	private String shoppingId;
	
	public ShoppingTimer(){
		
	}

	public ShoppingTimer(String shoppingId){
		System.out.println();
		shoppingService = (ShoppingService) BeanUtils.getBean("shoppingService");
		this.shoppingId = shoppingId;
	}
	
	@Override
	public void run(){
		// TODO Auto-generated method stub
			try {
				System.out.println(">>>> " + shoppingId);
				Thread.sleep(5000);
				shoppingService.shoppingAutoDel(shoppingId);

				System.out.println("<<<< " + shoppingId);
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("	Error >>> " + e.getMessage());
			}		
		
	}

}
