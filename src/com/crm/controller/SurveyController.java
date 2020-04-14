package com.crm.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crm.mail.SendMail;
import com.crm.service.SurveyService;
import com.crm.vo.PagingVO;
import com.crm.vo.SurveyVO;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {
			private static final String CONTEXT_PATH = "survey";
			Logger logger = Logger.getLogger(SurveyController.class);
			
			@Autowired
			private SurveyService surveyService;
			
			@RequestMapping(value="/surveyList")
			public ModelAndView surveyList(@ModelAttribute PagingVO pvo
										  ,@RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage
										  ,@RequestParam(value="cntPerPage", required=false, defaultValue="10")String cntPerPage){
				ModelAndView mav = new ModelAndView("survey/surveyList");
				logger.info("surveyList 호출성공");
				int total = surveyService.surveyCountBoard(pvo);
				List<SurveyVO> surveyList = surveyService.surveyList(pvo);
				logger.info("total >> : " + total);
				logger.info("nowpage >>  "+ nowPage);
				pvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				System.out.println("pvo >> : "+ pvo.toString2());
				System.out.println("surveyList : " + surveyList);
				System.out.println("surveyList : " + surveyList.toString());
				
				mav.addObject("paging", pvo);
				mav.addObject("surveyList", surveyService.surveyList(pvo));
				mav.setViewName(CONTEXT_PATH + "/surveyList");
				return mav;
				
			}
			
			@RequestMapping(value="/surveyInsert")
			public ModelAndView surveyInsert(@ModelAttribute SurveyVO svo){
				logger.info("surveyInsert 호출성공");
				
				ModelAndView mav = new ModelAndView();
				
				SurveyVO cb = surveyService.surveyCheabun();
				String ch = cb.getC_client_no();
				logger.info("ch >>> : "+ ch);
				if(1==ch.length()){
					ch = "000" + ch;				
				}
				if(2==ch.length()){
					ch = "00" + ch;		
				}
				if(3==ch.length()){
					ch = "0" + ch;		
				}
				ch = "S" + ch;
				logger.info("ch >>> : "+ ch);
				svo.setC_client_no(ch);
				logger.info("VO >>> : " + svo.toString());
				int result = surveyService.surveyInsert(svo);
				System.out.println("result >>> : " + result);
				
				mav.addObject("result", result);
				mav.setViewName(CONTEXT_PATH + "/surveyComplete");
				
				return mav;

			}
			
			@RequestMapping(value="/surveyDetail")
			public ModelAndView surveyDetail(@ModelAttribute SurveyVO svo){
				logger.info("surveyDetail 호출성공");
				logger.info("c_client_no : " + svo.getC_client_no());
				
				SurveyVO detail = surveyService.surveyDetail(svo);
				System.out.println("detail >>> : " + detail);
				
				ModelAndView mav = new ModelAndView();
				mav.addObject("detail", detail);
				mav.setViewName(CONTEXT_PATH + "/surveyDetail");
				return mav;
			}
			
			@RequestMapping(value="/surveyChaebun")
			public ModelAndView surveyChaebun(@RequestParam("getC_client_no") String getC_client_no){
				logger.info("surveyChaebun 호출성공");
				ModelAndView mav = new ModelAndView();
				if(getC_client_no.equals("")){
					mav.addObject("mode", "chaebun");
				}else{
					mav.addObject("SurveyVO", surveyService.surveyCheabun());
					mav.addObject("mode", "chaebun");
				}
					mav.setViewName(CONTEXT_PATH + "/surveyList");
					
					return mav;
				
			}
//			@RequestMapping(value="/sendMail", method=RequestMethod.GET)
//			public String sendMail() throws Exception{
//				logger.info("sendMail() 호출성공");
//				
//				SurveyVO svo = new SurveyVO();
//				svo.setTo_Client("tots2626@hotmail.com");
//				svo.setTo_ClientName("�?병욱 고객?��..");
//				String userId = "?��?���?";
//			
//				SendMail sm = new SendMail(svo, userId);
//				sm.mailSending();
//				
//				return "redirect:/index.jsp" ;
//			}
}
