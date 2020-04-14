package com.crm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crm.mail.SendMail;
import com.crm.service.ClientService;
import com.crm.vo.ClientVO;
import com.crm.vo.PagingVO;

@Controller
@RequestMapping("/client")
public class ClientController {
	Logger logger = Logger.getLogger(ClientController.class);
	
	@Autowired
	private ClientService clientService;
	
	@RequestMapping("/mail")
	public ModelAndView mail(@RequestParam (required=false)String to_Client_Email
							,@RequestParam (required=false)String to_Client_Name
							,@RequestParam (required=false)String to_user_Name){
		logger.info("ClientController.mail >>> start");
		logger.info("ClientController.mail >>> 매개변수 값 >> : "+to_Client_Email);
		logger.info("ClientController.mail >>> 매개변수 값 >> : "+to_Client_Name);
		logger.info("ClientController.mail >>> 매개변수 값 >> : "+to_user_Name);
		
		List<String> list = new ArrayList<String>();
		
		ModelAndView mav = new ModelAndView("mail/survey");
//		list.add(to_Client_Email);
//		list.add(to_Client_Name);
//		list.add(to_user_Name);
		HashMap map = new HashMap<>();
		map.put("to_Client_Email", to_Client_Email);
		map.put("to_Client_Name", to_Client_Name);
		map.put("to_user_Name", to_user_Name);
		
		mav.addObject("map", map);
		return mav; 
	}// clientInsertForm()
	
	//고객 등록 페이지 이동
	@RequestMapping("/clientInsertForm")
	public String clientInsertForm(){
		logger.info("ClientController.clientInsertForm >>> start");
		return "client/clientInsert"; 
	}// clientInsertForm()
	
	//고객 등록 완료
	@RequestMapping("/clientInsertOk")
	public String clientInsertOk(HttpServletResponse response ,@ModelAttribute ClientVO clientVO) throws Exception{
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		logger.info("ClientController.clientInsertOk >>> start");
		logger.info("ClientController.clientInsertOk >>> param : ClientVO = " + clientVO.toString());

		String result = "Failed";
		if(clientService.clientInsertOk(clientVO)) { 
			result = "Success";
			SendMail sm = new SendMail(clientVO);
			sm.mailSending();
		}
		
		return "redirect:/client/clientList.crm?result=" + result;
	}// clientInsertOk()
	//고객 수정 페이지 이동
	@RequestMapping("/clientUpdateForm")
	public ModelAndView clientUpdateForm(@RequestParam String c_Client_No){
		logger.info("ClientController.clientUpdateForm >>> start");
		logger.info("ClientController.clientUpdateForm >>> param : c_Client_No = " + c_Client_No);
		ModelAndView mav = new ModelAndView("client/clientUpdate");
		mav.addObject("detail", clientService.clientNo(c_Client_No));
		return mav;
	}// clientUpdateForm()
	//고객 등록 완료
	@RequestMapping("/clientUpdateOk")
	public String clientUpdateOk(@ModelAttribute ClientVO clientVO){
		logger.info("ClientController.clientUpdateOk >>> start");
		logger.info("ClientController.clientUpdateOk >>> param : ClientVO = " + clientVO.toString());
		String result = "Failed";
		if(clientService.clientUpdateOk(clientVO)) { result = "Success"; }
		return "redirect:/client/clientList.crm?result=" + result;
	}// clientUpdateOk()
	
	//고객 삭제 완료
	@RequestMapping("/clientDeleteOk")
	public String clientDeleteOk(@RequestParam String c_Client_No){
		logger.info("ClientController.clientDeleteOk >>> start");
		logger.info("ClientController.clientDeleteOk >>> param : c_Client_No = " + c_Client_No);
		String result = "Failed";
		if(clientService.clientDeleteOk(c_Client_No)) { result = "Success"; }
		return "redirect:/client/clientList.crm?result=" + result;
	}// clientDeleteOk()
	
	//Ajax 고객등록 담당사원 확인 여부
	@RequestMapping("/clientCheck")
	public @ResponseBody String clientCheck(@RequestParam String c_User_Id){
		logger.info("ClientController.clientCheck >>> start");
		logger.info("ClientController.clientCheck >>> param : c_User_Id = " + c_User_Id);
		return clientService.clientCheck(c_User_Id);
	}// clientList()
	//고객 리스트
	@RequestMapping("clientList")
	public ModelAndView clientList(PagingVO pvo
								 ,@RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage
								 ,@RequestParam(value="cntPerPage", required=false, defaultValue="10")String cntPerPage){
		logger.info("ClientController.clientList >>> start");
		int total = clientService.clientCountBoard(pvo);
		pvo =  new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		ModelAndView mav = new ModelAndView("client/clientList");
		mav.addObject("paging", pvo);
		logger.info("paging >> : "+ pvo);
		mav.addObject("clientList", clientService.clientList(pvo));
		return mav; 
	}
	//고객 검색
	@RequestMapping("clientSearchList")
	public ModelAndView clientSearchList(@ModelAttribute PagingVO pvo
										,@RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage
										,@RequestParam(value="cntPerPage", required=false, defaultValue="10")String cntPerPage){
		logger.info("ClientController.clientSearchList >>> start");
		int total = clientService.clientCountBoard(pvo);
		ModelAndView mav = new ModelAndView("client/clientList");
		
		if(pvo.getSearch() != null || pvo.getSearch() != ""){
			String search = pvo.getSearch();
			String keyword = pvo.getKeyword();
			pvo =  new PagingVO(total, Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
			pvo.setSearch(search);
			pvo.setKeyword(keyword);
		}else{
			pvo =  new PagingVO(total, Integer.parseInt(nowPage),Integer.parseInt(cntPerPage) );
		}
		mav.addObject("paging", pvo);
		mav.addObject("clientList", clientService.clientList(pvo));
		return mav; 
	}
	

}// ClientController class
