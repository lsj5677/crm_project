package com.crm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.PerformanceDao;
import com.crm.vo.PerformanceVO;


@Service("pfs")
@Transactional
public class PerformanceServiceImpl implements PerformanceService {
	
	Logger logger = Logger.getLogger(PerformanceServiceImpl.class);
	
	@Autowired PerformanceDao pfd;
	//직원 확인 
	@Override
	public int userCheck(String c_User_Id) {
		// TODO Auto-generated method stub
		System.out.println("PerformanceServiceImpl.userCheck()함수 시작");
		System.out.println("PerformanceServiceImpl.userCheck()함수 끝");
		return pfd.userCheck(c_User_Id);
	}
	
	@Override
	public int performanceInsertOk(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		System.out.println("PerformanceServiceImpl.performanceInsertOk()함수 시작");
		System.out.println("PerformanceServiceImpl.performanceInsertOk()함수 끝");
		return pfd.performanceInsertOk(pvo);
	}
	
	@Override
	public List<PerformanceVO> performanceList(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		System.out.println("PerformanceServiceImpl.performanceList()함수 시작");
		
		
		System.out.println("PerformanceServiceImpl.performanceList()함수 끝");
		return pfd.performanceList(pvo);
	}

	@Override
	public List<PerformanceVO> performanceUpdateForm(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		System.out.println("PerformanceServiceImpl.performanceUpdateForm()함수 시작");
		System.out.println("값 > :"+ pvo.toString());
		System.out.println("PerformanceServiceImpl.performanceUpdateForm()함수 끝");
		return pfd.performanceUpdateForm(pvo);
	}

	@Override
	public int performanceUpdateOk(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		System.out.println("PerformanceServiceImpl.performanceUpdateOk()함수 시작");
		System.out.println("값 > :"+ pvo.toString());
		System.out.println("PerformanceServiceImpl.performanceUpdateOk()함수 끝");
		return pfd.performanceUpdateOk(pvo);
	}

	@Override
	public int performanceDelete(PerformanceVO pvo) {
		// TODO Auto-generated method stub
		System.out.println("PerformanceServiceImpl.performanceDelete()함수 시작");
		System.out.println("값 > :"+ pvo.toString());
		System.out.println("PerformanceServiceImpl.performanceDelete()함수 끝");
		return pfd.performanceDelete(pvo);
	}

	@Override
	public PerformanceVO performanceResult(HashMap map) {
		// TODO Auto-generated method stub
		System.out.println("PerformanceServiceImpl.performanceResult()함수 시작");
		System.out.println("PerformanceServiceImpl.performanceResult()함수 끝");		
		return pfd.performanceResult(map);
		
	}

	@Override
	public PerformanceVO performanceResultMonth(String day) {
		System.out.println("day >> : "+ day);
		return pfd.performanceResultMonth(day);
	}

	@Override
	public PerformanceVO performanceSessionMonth(HashMap map) {
		// TODO Auto-generated method stub
		logger.info("performanceMonth");
		return pfd.performanceSessionMonth(map);
	}
	
}
