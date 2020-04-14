package com.crm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao {
	Logger logger = Logger.getLogger(ProductDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ProductVO> productList() {
		logger.info("ProductDaoImpl.productList >>> start");
		return session.selectList("productList");
	}// productList()

	@Override
	public List<ProductVO> productSearch(String param) {
		logger.info("ProductDaoImpl.productSearch >>> start");
		return session.selectList("productSearch", param);
	}// productSearch()
	
}// ProductDaoImpl class
