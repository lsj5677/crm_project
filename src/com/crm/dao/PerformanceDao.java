package com.crm.dao;

import java.util.HashMap;
import java.util.List;

import com.crm.vo.PerformanceVO;


public interface PerformanceDao {
	public int userCheck(String c_User_Id);
	public int performanceInsertOk(PerformanceVO pvo);
	public int performanceUpdateOk(PerformanceVO pvo);
	public int performanceDelete(PerformanceVO pvo);
	public List<PerformanceVO> performanceList(PerformanceVO pvo);
	public List<PerformanceVO> performanceUpdateForm(PerformanceVO pvo);
	public PerformanceVO performanceResultMonth(String day);
	
	public PerformanceVO performanceSessionMonth(HashMap map);
	public PerformanceVO performanceResult(HashMap map); 
	
}
