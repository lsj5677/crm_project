package com.crm.service;

import java.util.List;

import com.crm.vo.ShoppingVO;

public interface ShoppingService {
	public List<ShoppingVO> shoppingList(ShoppingVO svo);
	public ShoppingVO shoppingChaebun();
	public int shoppingInsert(ShoppingVO svo);
	public int shoppingStock(ShoppingVO svo);
	public int shoppingStockPlus(ShoppingVO svo);
	public int shoppingDelete(String c_shopping_id);
	public int shoppingUpdate(ShoppingVO svo);
	public int shoppingAutoDel(String c_shopping_id);
}
