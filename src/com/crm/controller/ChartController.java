package com.crm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.vo.ChartVO;

@RequestMapping(value = "/chart")
@Controller
public class ChartController {

	@RequestMapping(value = "chart")
	public String chart() {
		
		return "/chart/chart";
	}
	
	@RequestMapping(value = "/chartApi")
	public @ResponseBody List<String> chartApi(@RequestParam("year") String year) {
		
		List<String> aList = new ArrayList<>();
		ChartVO cvo = new ChartVO(year);
		
		aList.add(cvo.getJan());
		aList.add(cvo.getFeb());
		aList.add(cvo.getMar());
		aList.add(cvo.getApr());
		aList.add(cvo.getMay());
		aList.add(cvo.getJun());
		aList.add(cvo.getJul());
		aList.add(cvo.getAug());
		aList.add(cvo.getSep());
		aList.add(cvo.getOct());
		aList.add(cvo.getNov());
		aList.add(cvo.getDec());
		aList.add(cvo.getYear());
		
		for(int i = 0; i < aList.size(); i++) {
			System.out.println(aList.get(i));
		}
		
		return aList;
	}
	
}// Chart class
