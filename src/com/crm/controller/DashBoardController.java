package com.crm.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.common.OpenAPI;

@Controller
@RequestMapping(value="/dashBoard")
public class DashBoardController {
	Logger logger = Logger.getLogger(DashBoardController.class);
	
	@RequestMapping(value="/home")
	public String home(HttpServletRequest request) throws Exception {
		logger.info("DashBoardController.home >>> start");
		return "main";
	}// mainPage()
	
	@RequestMapping(value="/getWeather", method=RequestMethod.GET, produces = "application/xml; charset=utf8")
	@ResponseBody
	public String getWeather() throws Exception{
		logger.info("DashBoardController.getWeather() >>> start");
		logger.info("DashBoardController.getWeather() >>> return : XML = " + OpenAPI.weatherRssXML());
		return OpenAPI.weatherRssXML();
	}// getWeather()
	
	@RequestMapping(value="/getDust", method=RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String getDust() throws Exception{
		logger.info("DashBoardController.getDust() >>> start");
		logger.info("DashBoardController.getDust() >>> return : json = " + OpenAPI.dustApi());
		return OpenAPI.dustApi();
	}// getDust()
	
}// DashBoardController class
