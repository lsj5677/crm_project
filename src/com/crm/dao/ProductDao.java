package com.crm.dao;

import java.util.List;

import com.crm.vo.ProductVO;

public interface ProductDao {
	public List<ProductVO> productList ();
	public List<ProductVO> productSearch (String param);
}
