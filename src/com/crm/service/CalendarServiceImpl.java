package com.crm.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.CalendarDAO;
import com.crm.vo.CalendarVO;

@Service
@Transactional
public class CalendarServiceImpl implements CalendarService {

	Logger logger = Logger.getLogger(CalendarServiceImpl.class);
	
	@Autowired
	private CalendarDAO calendarDAO;

	@Override
	public boolean addEvent(CalendarVO calVO) {
		logger.info("CalendarServiceImpl.addEvent() >>> start");
		logger.info("CalendarServiceImpl.addEvent() >>> param : CalendarVO = " + calVO.toString());
		
		if(calendarDAO.addEvent(calVO) > 0){ return true; }
		return false;
	}// addEvent()

	@Override
	public List<CalendarVO> getAllEvents(CalendarVO calVO) {
		logger.info("CalendarServiceImpl.getAllEvents() >>> start");
		logger.info("CalendarServiceImpl.getAllEvents() >>> param : CalendarVO = " + calVO.toString());
		return calendarDAO.getAllEvents(calVO);
	}// getAllEvents()

	@Override
	public List<CalendarVO> getTodayEvents(CalendarVO calVO) {
		logger.info("CalendarServiceImpl.getTodayEvents() >>> start");
		logger.info("CalendarServiceImpl.getTodayEvents() >>> param : CalendarVO = " + calVO.toString());
		return calendarDAO.getTodayEvents(calVO);
	}// getTodayEvents()
	
	
	
}
