package com.crm.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crm.vo.PagingVO;
import com.crm.vo.UserVO;
import com.crm.common.CrmSession;
import com.crm.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	// login
	@RequestMapping(value="/userLogin", method=RequestMethod.POST)
	public String userLogin(@ModelAttribute UserVO userVO, HttpServletRequest request) throws Exception {
		logger.info("UserController.userLogin >>> start");
		logger.info("UserController.userLogin >>> param : UserVO = " + userVO.toString());
		CrmSession.setSession(request, userService.userLogin(userVO));
		return "redirect:/";
	}// userLogin()
	// logout
	@RequestMapping(value="/userLogout")
	public String userLogout(HttpServletRequest request) throws Exception {
		logger.info("UserController.userLogout >>> start");
		CrmSession.killSession(request);
		return "redirect:/";
	}// userLogout()
	//사원 회원가입 페이지 이동
	@RequestMapping("/userInsertForm")
	public String userInsertForm(){
		logger.info("UserController.userInsertForm >>> start");
		return "user/userInsert"; 
	}// userInsertForm()
	//사원 등록완료
	@RequestMapping("/userInsertOk")
	public String userInsertOk(@ModelAttribute UserVO userVO ){
		logger.info("UserController.userInsertOk >>> start");
		logger.info("UserController.userInsertOk >>> param : UserVO = " + userVO.toString());
		String result = "Failed";
		if(userService.userInsertOk(userVO)) { result = "Success"; }
		return "redirect:/user/userList.crm?result=" + result;
	}// userInsertOk()
	//사원 수정 이동 페이지
	@RequestMapping("/userUpdateForm")
	public ModelAndView userUpdateForm(@RequestParam String user_Id) throws Exception {
		logger.info("UserController.userUpdateForm >>> start");
		logger.info("UserController.userUpdateForm >>> param : user_Id = " + user_Id);
		ModelAndView mav = new ModelAndView("/user/userUpdate");
		mav.addObject("userVO", userService.userDetail(user_Id));
		return mav;
	}// userUpdateForm()
	//사원 수정완료
	@RequestMapping("/userUpdateOk")
	public String userUpdateOk(@ModelAttribute UserVO userVO){
		logger.info("UserController.userUpdateOk >>> start");
		logger.info("UserController.userUpdateOk >>> param : UserVO = " + userVO.toString());
		String result = "Failed";
		if(userService.userUpdateOk(userVO)) { result = "Success"; }
		return "redirect:/user/userList.crm?result=" + result;
	}// userUpdateOK()
	//사원 퇴사완료
	@RequestMapping("/userDelete")
	public String userDelete(@RequestParam String user_Id){
		logger.info("UserController.userDelete >>> start");
		logger.info("UserController.userDelete >>> param : user_Id = " + user_Id);
		String result = "Failed";
		if(userService.userDelete(user_Id)) { result = "Success"; }
		return "redirect:/user/userList.crm?result=" + result;
	}// userDelete()
	//사원 리스트
	@RequestMapping("/userList")
	public ModelAndView userList(PagingVO pvo, @RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage
			,@RequestParam (required=false, defaultValue="Success") String result
			,@RequestParam(value = "c_User_Id", required=false, defaultValue="") String c_User_Id
			,@RequestParam(value = "c_ClientList", required=false, defaultValue="") String c_ClientList, HttpServletRequest req)
	throws Exception{
		logger.info("UserController.userList >>> start");
		ModelAndView mav = new ModelAndView("/user/userList");
		mav.addObject("userLevel", CrmSession.getSession(req).getC_User_Level());
		logger.info("권한 >> : " +CrmSession.getSession(req).getC_User_Level());
		if(result.equals("Success")){
			int total = userService.userCountBoard(pvo);
			logger.info("total >> : " + total);
			logger.info("nowpage >>  "+ nowPage);
			pvo =  new PagingVO(total, Integer.parseInt(nowPage), 10);
			mav.addObject("paging", pvo);
			mav.addObject("userList", userService.userList(pvo));
			logger.info("c_User_Id >> : "+ c_User_Id);
			if(!c_User_Id.equals("")){
				logger.info("c_User_Id if臾� 吏꾩엯");
				mav.addObject("detailVO", userService.userDetailId(c_User_Id));
			}
			logger.info("c_ClientList >> : "+ c_ClientList);
			if(!c_ClientList.equals("")){
				logger.info("c_ClientList if臾� 吏꾩엯");
				mav.addObject("clientList", userService.userClientList(c_ClientList));
			}
		}else{
			int total = userService.userCountBoard(pvo);
			logger.info("total >> : " + total);
			logger.info("nowpage >>  "+ nowPage);
			pvo =  new PagingVO(total, Integer.parseInt(nowPage), 10);
			mav.addObject("paging", pvo);
			mav.addObject("userList", userService.userList(pvo));
			
			HttpServletResponse res = null;
			PrintWriter out = res.getWriter();
			out.println("<script>alert('등록or수정을 실패하였습니다.');</script>");
		}
		return mav;
	}// userList()
	//사원 검색
	@RequestMapping("/userSearchList")
	public ModelAndView userSearchList(@ModelAttribute PagingVO pvo, @RequestParam(value="nowPage", required=false, defaultValue="1")String nowPage){
		logger.info("UserController.userSearchList >>> start");
		ModelAndView mav = new ModelAndView("user/userList");
		int total = userService.userCountBoard(pvo);
		logger.info("total >> : " + total);
		logger.info("nowpage >>  "+ nowPage);
		if(pvo.getSearch() != null || pvo.getSearch() != ""){
			String search = pvo.getSearch();
			String keyword = pvo.getKeyword();
			pvo =  new PagingVO(total, Integer.parseInt(nowPage), 10);
			pvo.setSearch(search);
			pvo.setKeyword(keyword);
		}else{
			pvo =  new PagingVO(total, Integer.parseInt(nowPage), 10);
		}
		mav.addObject("paging", pvo);
		mav.addObject("userList", userService.userList(pvo));
		return mav; 
	}
	//Ajax 사원 등록시 아이디 중복 체크
	@RequestMapping("/userIdCheck")
	@ResponseBody
	public String userIdCheck(@RequestParam String c_User_Id){
		logger.info("UserController.userIdCheck >>> start");
		logger.info("UserController.userIdCheck >>> param : c_User_Id = " + c_User_Id);
		return userService.userIdCheck(c_User_Id);
	}// userIdCheck()

}// UserController class
