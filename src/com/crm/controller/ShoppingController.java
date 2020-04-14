package com.crm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crm.common.Chaebun;
import com.crm.common.ShoppingTimer;
import com.crm.service.ShoppingService;
import com.crm.vo.ShoppingVO;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	private static final String PATH = "shopping";
	private static SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
	
	Logger logger = Logger.getLogger(ShoppingController.class);
	
	@Autowired
	private ShoppingService shoppingService;
	
	/*list*/
	@RequestMapping("/shoppingList")
	public ModelAndView shoppingList(@ModelAttribute ShoppingVO svo){
		logger.info("ShoppingController.shoppingList >>>");
		
		ModelAndView mav = new ModelAndView();
		List<ShoppingVO> list = shoppingService.shoppingList(svo);
		
		logger.info("list >>> " + list.toString());
		
		mav.addObject("list", list);
		mav.setViewName(PATH+"/shoppingList");
		
		logger.info("ShoppingController.shoppingList <<<");
		return mav;
	}
	
	/*insert*/
	@RequestMapping(value="/shoppingInsert")
	@ResponseBody 
	public String shoppingInsert(@ModelAttribute ShoppingVO svo, HttpServletRequest req)throws IllegalStateException, IOException{
		logger.info("ShoppingController.shoppingInsert >>>");

		ModelAndView mav = new ModelAndView();
		System.out.println(">>>>>>>>>>>>>>>>" + svo.getc_id());
		int svoStock = shoppingService.shoppingStock(svo);
		
		// chaebun
		ShoppingVO svoChaebun = shoppingService.shoppingChaebun();
		String chaebun = svoChaebun.getC_shopping_id();

		// 숫자 자리수에 따라 0붙이기
		if (1 == chaebun.length()) {
			chaebun = "000" + chaebun;
		}
		// 숫자 자릿수가 두 개 일때 00 + 숫자
		if (2 == chaebun.length()) {
			chaebun = "00" + chaebun;
		}
		// 숫자 자릿수가 세 개 일때 0 + 숫자
		if (3 == chaebun.length()) {
			chaebun = "0" + chaebun;
		}

		chaebun = "S" + chaebun;
		logger.info("chaebun >>> " + chaebun);
		
		svo.setC_shopping_id(chaebun);
		svo.setC_user_id("aaa");
		
		String c_shopping_id = svo.getC_shopping_id();

		System.out.println(svo.toString());

		
		// insert
		int result = shoppingService.shoppingInsert(svo);
		logger.info("result >>> " + result);
		
		String bool = "true";
		
		if(result==1){
			logger.info("Success");
			mav.addObject("bool", bool );
			
			ShoppingTimer st = new ShoppingTimer(c_shopping_id);
			Thread t = new Thread(st);
			
			t.start();
			
			System.out.println("Success");
			
		}else{
			logger.info("Error");
			bool = "false";
		}
		
		logger.info("ShoppingController.shoppingInsert <<<");
		return bool;
	}
	
	/*update == deletebtn*/
	@RequestMapping("/shoppingUpdate")
	public ModelAndView shoppingUpdate(@ModelAttribute ShoppingVO svo, HttpServletRequest req)throws IllegalStateException, IOException{
		logger.info("ShoppingController.shoppingUpdate >>>");
		
		ModelAndView mav = new ModelAndView("redirect:/shopping/shoppingList.crm");
		System.out.println("c_shopping_id >>> " + svo.getC_shopping_id());
		System.out.println("c_product_id >>> " + svo.getc_id());
		
		System.out.println(">>>" + svo.toString());

		//update
		int result = shoppingService.shoppingUpdate(svo);
		logger.info("result >>> " + result);
		
		if(result==1){
			int svoStockPlus = shoppingService.shoppingStockPlus(svo);
			
			logger.info("Success");
			System.out.println("Success");
		}else{
			logger.info("Error");
			System.out.println("Error");
		}

		
		logger.info("ShoppingController.shoppingUpdate <<<");
		return mav;
	}
	
	
	/*delete == paymentbtn*/
	@RequestMapping("/shoppingDelete")
	public ModelAndView shoppingDelete(@RequestParam String c_shopping_id, HttpServletRequest req)throws IOException{
		logger.info("ShoppingController.shoppingDelete >>>");
		
		ModelAndView mav = new ModelAndView("redirect:/shopping/shoppingList.crm");
		
		logger.info("c_shopping_id >>> " + c_shopping_id);
		
		int result = shoppingService.shoppingDelete(c_shopping_id);
				
		logger.info("ShoppingController.shoppingDelete <<<");
		
		return mav;
	}
	
	@RequestMapping("/shoppingAutoDel")
	public ModelAndView shoppingAutoDel(@RequestParam ShoppingVO svo, String c_shopping_id)throws IOException{
		logger.info("ShoppingController.shoppingAutoDel >>>");
		
		ModelAndView mav = new ModelAndView("redirect:/shopping/shoppingList.crm");
		
		logger.info("c_shopping_id >>> " + c_shopping_id);
		
		int result = shoppingService.shoppingAutoDel(c_shopping_id);
		
		if(result==1){
			int svoStockPlus = shoppingService.shoppingStockPlus(svo);
			
			logger.info("Success");
			System.out.println("Success");
		}else{
			logger.info("Error");
			System.out.println("Error");
		}
				
		logger.info("ShoppingController.shoppingAutoDel <<<");
		
		return mav;
	}
	
}
