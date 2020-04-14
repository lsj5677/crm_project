package com.crm.service;

import java.util.List;

import com.crm.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList ();
	public List<ProductVO> productSearch (String param);
}
