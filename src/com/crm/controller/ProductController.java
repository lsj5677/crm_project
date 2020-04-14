package com.crm.controller;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crm.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	private static final String PATH = "product";
	Logger logger = Logger.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	/*list*/
	@RequestMapping("/productList")
	public ModelAndView productList(ModelAndView mav){
		logger.info("ProductController.productList >>> start");
		
		mav.addObject("list", productService.productList());
		mav.setViewName(PATH + "/productList");
		return mav;
	}// productList()
	
	/*search*/
	@RequestMapping("/productSearch")
	public ModelAndView productSearch(@RequestParam(required = false) String productName, ModelAndView mav){
		logger.info("ProductController.productSearch >>> start");
		logger.info("ProductController.productSearch >>> param : productName = " + productName);
		
		mav.addObject("list", productService.productSearch(productName));
		mav.setViewName(PATH + "/productList");
		return mav;
	}// productSearch()
	
}// ProductController class
