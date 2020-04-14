package com.crm.controller;


import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crm.service.TsalesService;
import com.crm.vo.TsalesVO;
import com.sun.istack.internal.logging.Logger;

@Controller
@RequestMapping(value="/tsales")
public class TsalesController {
		private static final String CONTEXT_PATH="tsales";
		Logger logger = Logger.getLogger(TsalesController.class);
		
		@Autowired
		private TsalesService tsalesService; 
		
		//LIST--------------------------------------------------------
		@RequestMapping("/tsalesList") //������ tsalesList�� year�� �̾ƿ´�
		public ModelAndView tsalesList(){
			logger.info("TsalesController tsalesList >>> ");
			
			ModelAndView mav = new ModelAndView(); 
			
			List<TsalesVO> yearList = tsalesService.tsalesList(); //list�� �ޱ����� yearList�� ���� ���� , service���� ���� �޴´�.
			System.out.println("yearList : " + yearList.toString());
			
			TsalesVO monthData = tsalesService.tsalesSearch(yearList.get(yearList.size() - 1).getYear());
			System.out.println("monthData : " + monthData.toString());
			
			mav.addObject("monthData", monthData);
			mav.addObject("yearList", yearList); //�޾ƿ� ���� Ű�� �����ϰ� ��´�
			mav.setViewName(CONTEXT_PATH + "/tsalesList"); //jsp tsales��  tsalesList�� ������
			return mav;
		}
		
		@RequestMapping("/tsalesSearch")
		public ModelAndView tsalesSearch(@RequestParam("year") String _year){
			logger.info("TsalesController tsalesSearch >>> ");
			logger.info("_year >>>" + _year);
		
			ModelAndView mav = new ModelAndView();

			TsalesVO monthData = tsalesService.tsalesSearch(_year);
			System.out.println("monthData : " + monthData.toString());
			
			List<TsalesVO> yearList = tsalesService.tsalesList();
			System.out.println("yearList : " + yearList.toString());
			
			mav.addObject("monthData", monthData);
			mav.addObject("yearList", yearList);
			
			mav.setViewName(CONTEXT_PATH + "/tsalesList");
			
			return mav;
			
			
		}
		//INSERT--------------------------------------------------------
		@RequestMapping("/tsalesInsert")
		public ModelAndView tsalesInsert(@ModelAttribute TsalesVO tvo){
			logger.info("TsalesController tsalesInsert >>> ");
		System.out.println("TsalesVO >>> : " + tvo);	
		int result = tsalesService.tsalesInsert(tvo);
		System.out.println("result : " + result);
		ModelAndView mav = new ModelAndView();
		
		if(result == 1){
			List<TsalesVO> tsalesList = tsalesService.tsalesList();
//				TsalesVO tsalesList = tsalesService.tsalesList();

			mav.addObject("tsalesList", tsalesList);
			mav.setViewName(CONTEXT_PATH + "/surveyList");
		}				
		return mav;
		}
		
		@RequestMapping("/writeForm")
		public String writeForm(){
			logger.info("TsalesController writeForm >>>");
			return "/tsales/writeForm";
		}
		
		@RequestMapping("/searchForm")
		public String searchForm(){
			logger.info("TsalesController searchForm >>>");
			return "/tsales/tsalesSearch";
		}
//			//UPDATE--------------------------------------------------------
//			@RequestMapping("/tsalesUpdate")
//			public ModelAndView tsalesUpdate(@ModelAttribute TsalesVO tvo){
//				logger.info("TsalesController tsalesUpdate >>> ");
//				int result = tsalesService.tsalesUpdate(tvo);
//				System.out.println("result : " + result);
//				ModelAndView mav = new ModelAndView();
//				if(result == 1){
//					List<TsalesVO>  tsalesList = tsalesService.tsalesList();
////					String tsalesList = tsalesService.tsalesList();
//					mav.addObject("tsalesList", tsalesList);
//					mav.setViewName(CONTEXT_PATH + "/tsalesList");
//				}		
//				
//				return mav;
//			}


		//ajax
		@RequestMapping(value="/getData", method=RequestMethod.GET)
		@ResponseBody
		public Map<String, Object> get(@RequestParam(required=false) String param){
			logger.info("TsalesController.get() >>> start");
			logger.info("TsalesController.get() >>> param = " + param);
			
			List<TsalesVO> yearList = tsalesService.tsalesList();
			logger.info("TsalesController.get() >>> return = " + yearList.toString());
			
			TsalesVO monthData = tsalesService.tsalesSearch(yearList.get(yearList.size() - 1).getYear());
			logger.info("TsalesController.get() >>> return = " + monthData.toString());

			List<String> year = new ArrayList<>();
			for(int i = 0; i < tsalesService.tsalesList().size(); i++){
				TsalesVO tvo = new TsalesVO();
				tvo = yearList.get(i);
				year.add(tvo.getYear());
			}
			
			Map<String, Object> map = new LinkedHashMap<>();
			map.put("year", year);
			map.put("month", monthData);
			
			return map;
		}// get()

		@RequestMapping(value="/searchData", method=RequestMethod.GET)
		@ResponseBody
		public TsalesVO search(@RequestParam("year") String param){
			logger.info("TsalesController.search() >>> start");
			logger.info("TsalesController.search() param >>>" + param);
		
			return tsalesService.tsalesSearch(param);
		}// search()

}
