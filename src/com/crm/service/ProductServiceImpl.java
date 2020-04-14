package com.crm.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.ProductDao;
import com.crm.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	Logger logger = Logger.getLogger(ProductServiceImpl.class);
	
	@Autowired
	private ProductDao productDao;
	
	@Override
	public List<ProductVO> productList() {
		logger.info("ProductServiceImpl.productList >>> start");
		return productDao.productList();
	}// productList()

	@Override
	public List<ProductVO> productSearch(String param) {
		logger.info("ProductServiceImpl.productSearch >>> start");
		return productDao.productSearch(param);
	}// productSearch()
	
}// ProductServiceImpl class
