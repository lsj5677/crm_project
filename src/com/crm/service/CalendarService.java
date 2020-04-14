package com.crm.service;

import java.util.List;

import com.crm.vo.CalendarVO;

public interface CalendarService  {
	
	public boolean addEvent(CalendarVO calVO);
	public List<CalendarVO> getAllEvents(CalendarVO calVO);
	public List<CalendarVO> getTodayEvents(CalendarVO calVO);


}
