package com.crm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.common.CrmSession;
import com.crm.service.CalendarService;
import com.crm.vo.CalendarVO;

@RequestMapping(value="/fullCalendar")
@Controller
public class CalendarController {
	
	Logger logger = Logger.getLogger(CalendarController.class);
	
	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping("/schedule")
	public String schedule () {
		logger.info("CalendarController.schedule() >>> start");
		return "/fullCalendar/schedule";
	}// schedule()
	
	@RequestMapping("/addEvent")
	@ResponseBody
	public ResponseEntity<String> addEvent(HttpServletRequest request, @ModelAttribute CalendarVO calVO) throws Exception {
		logger.info("CalendarController.addEvent() >>> start");
		logger.info("CalendarController.addEvent() >>> session : c_User_Id = " + CrmSession.getSession(request).getC_User_Id());

		calVO.setC_User_Id(CrmSession.getSession(request).getC_User_Id());
		logger.info("CalendarController.addEvent() >>> param : CalendarVO = " + calVO.toString());
		
		ResponseEntity<String> entity;
		if(calendarService.addEvent(calVO)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}// addEvent()
	
	@RequestMapping("/getAllEvents")
	@ResponseBody
	public ResponseEntity<List<CalendarVO>> getAllEvents(HttpServletRequest request, @ModelAttribute CalendarVO calVO) throws Exception {
		logger.info("CalendarController.getAllEvents() >>> start");
		logger.info("CalendarController.getAllEvents() >>> session : c_User_Id = " + CrmSession.getSession(request).getC_User_Id());

		calVO.setC_User_Id(CrmSession.getSession(request).getC_User_Id());
		logger.info("CalendarController.getAllEvents() >>> param : CalendarVO = " + calVO.toString());
		
		List<CalendarVO> list = calendarService.getAllEvents(calVO);
		
		ResponseEntity<List<CalendarVO>> entity;
		if(list != null) {
			entity = new ResponseEntity<List<CalendarVO>>(list, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}// getAllEvents()
	
	@RequestMapping("/getTodayEvents")
	@ResponseBody
	public ResponseEntity<List<CalendarVO>> getTodayEvents(HttpServletRequest request, CalendarVO calVO) throws Exception {
		logger.info("CalendarController.getTodayEvents() >>> start");
		logger.info("CalendarController.getTodayEvents() >>> session : c_User_Id = " + CrmSession.getSession(request).getC_User_Id());

		calVO.setC_User_Id(CrmSession.getSession(request).getC_User_Id());
		logger.info("CalendarController.getTodayEvents() >>> param : CalendarVO = " + calVO.toString());
		
		List<CalendarVO> list = calendarService.getTodayEvents(calVO);
		
		ResponseEntity<List<CalendarVO>> entity;
		if(list != null) {
			entity = new ResponseEntity<List<CalendarVO>>(list, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}// getTodayEvents()
	
}// CalendarController class
