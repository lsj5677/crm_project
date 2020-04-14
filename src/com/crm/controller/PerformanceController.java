package com.crm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crm.common.CrmSession;
import com.crm.common.datePicker;
import com.crm.service.PerformanceService;
import com.crm.vo.PerformanceVO;
import com.crm.vo.UserVO;


@Controller
@RequestMapping("/performance")
public class PerformanceController {
	
	@Autowired PerformanceService pfs;
	
	//실적 등록폼
	@RequestMapping("/performanceInsertForm")
	public String performanceInsertForm(){
		System.out.println("PerformanceController.performanceInsertForm()함수 시작");
		return "performance/performanceInsert"; 
	}
	
	//실적 수정폼
	@RequestMapping("/performanceUpdateForm")
	public ModelAndView performanceUpdateForm(@ModelAttribute PerformanceVO pvo){
		System.out.println("PerformanceController.performanceUpdateForm()함수 시작");
		
		ModelAndView mav = new ModelAndView("performance/performanceUpdate");
		
		List<PerformanceVO> detail = pfs.performanceUpdateForm(pvo);
		System.out.println("detail");
		mav.addObject("detail" ,detail);
				
		return mav;
	}
	//실적등록 완료
	@RequestMapping("/performanceInsertOk")
	public ModelAndView performanceInsertOk(@ModelAttribute PerformanceVO pvo){
		System.out.println("PerformanceController.performanceInsertOk()함수 시작");
		ModelAndView mav = new ModelAndView("redirect:/performance/performanceInsertForm.crm");
		int result = pfs.performanceInsertOk(pvo);
		return mav;
	}
	//실적 수정완료
	@RequestMapping("/performanceUpdateOk")
	public ModelAndView performanceUpdateOk(@ModelAttribute PerformanceVO pvo){
		System.out.println("PerformanceController.performanceUpdateOk()함수 시작");
		
		ModelAndView mav = new ModelAndView("redirect:/performance/performanceList.crm");
		int result = pfs.performanceUpdateOk(pvo);
		System.out.println("result >> : "+ result);
		return mav;
	}
	//실적 삭제완료
	@RequestMapping("/performanceDelete")
	public ModelAndView performanceDelete(@ModelAttribute PerformanceVO pvo){
		System.out.println("PerformanceController.performanceDelete()함수 시작");
		ModelAndView mav = new ModelAndView("redirect:/performance/performanceList.crm");
		int result = pfs.performanceDelete(pvo);
		return mav;
	}
	@RequestMapping("/performanceList")
	public ModelAndView performanceList(HttpServletRequest req) throws Exception{
		System.out.println("PerformanceController.performanceList()함수 시작");
		ModelAndView mav = new ModelAndView("performance/performanceList");
		PerformanceVO pvo = new PerformanceVO();
		pvo.setC_User_Id(CrmSession.getSession(req).getC_User_Id());
		mav.addObject("list" , pfs.performanceList(pvo));
		return mav;
	}
	//Ajax이용한 매출합친 그래프
	@RequestMapping("/performanceResult")
	@ResponseBody
	public List performanceResult(@RequestParam(required = false) String datepicker, HttpServletRequest req) throws Exception{
		System.out.println("PerformanceController.performanceResult()함수 시작");
		String c_User_Id = CrmSession.getSession(req).getC_User_Id();
		String level = CrmSession.getSession(req).getC_User_Level();
		String[] today = datePicker.getDate(datepicker, 3);
		
		HashMap<String,Object> map = null;
		List list = new ArrayList();
		for(int i=0; i < today.length; i++){
			map = new HashMap<>();
			map.put("c_Performance_Insertdate", today[i]);
			map.put("c_User_Id", c_User_Id);
			map.put("level", level);
			
			PerformanceVO pvo = pfs.performanceResult(map);
			pvo.setC_Performance_Insertdate(today[i]);
			list.add(pvo);
		}
		map = new HashMap<>();
		map.put("c_Performance_Insertdate",datepicker.substring(0,5));
		map.put("c_User_Id", c_User_Id);
		map.put("level", level);
		PerformanceVO pvo = pfs.performanceSessionMonth(map);
		pvo.setC_Performance_Insertdate(datepicker.substring(0,5));
		list.add(pvo);
		System.out.println(list);
		return list;
	}
	//매출합친 그래프 이동
	@RequestMapping("/performanceMove")
	public String performanceMove(){
		return "performance/performanceResult";
	}
	//Ajax 담당 직원 확인
	@RequestMapping("/userCheck")
	public @ResponseBody String userCheck(@RequestParam String c_User_Id){
		System.out.println("PerformanceController.userCheck()함수 시작");
	
		String bool ="";
		
		int count = pfs.userCheck(c_User_Id);
		if(count == 1){ bool ="true"; }
		else{ bool ="false"; }
		
		return bool;
	}
	//매출 페이지에서 가져갈 데이터
	@RequestMapping("/performanceMonth")
	public @ResponseBody List performanceMonth(@RequestParam() String monthVal){
		String[] month = {"/01", "/02", "/03", "/04", "/05", "/06", "/07", "/08", "/09", "/10", "/11", "/12"};
		monthVal = monthVal.substring(2);
		List list = new ArrayList();
		for(int i=0; i<month.length; i++){
			String setMonth = monthVal + month[i];
			PerformanceVO pvo = pfs.performanceResultMonth(setMonth);
			list.add(pvo);
		}
		return list;
	}
	//실적 DB등록용
	@RequestMapping("/performanceInsertOk2")
	public ModelAndView performanceInsertOk2(@ModelAttribute PerformanceVO pvo){
		System.out.println("PerformanceController.performanceInsertOk()함수 시작");
		/*ModelAndView mav = new ModelAndView("redirect:/performance/performanceInsert.crm");*/
		ModelAndView mav = new ModelAndView("redirect:/performance/performanceInsertForm.crm");
		String[] sa = {"dohwanm","dohwanm1", "dohwanm2"};
		for(int i=0; i < sa.length; i++){
			String saaa = sa[i];
			for(int j=0; j<9; j++){
				int s = (int)(Math.random()*30000) + 1;
				String sVal = String.valueOf(s);
				pvo.setC_User_Id(saaa);
				if(j == 0){
					j = 1;
				}
				pvo.setC_Performance_Insertdate("18/0"+(j+1)+"/"+ i + j);
				pvo.setC_Performance_Result(sVal);
				System.out.println(pvo.getC_Performance_Insertdate());
				int result = pfs.performanceInsertOk(pvo);
			}
		}
		return mav;
	}

}
