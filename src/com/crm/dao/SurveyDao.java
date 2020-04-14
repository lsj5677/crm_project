package com.crm.dao;

import java.util.List;

import com.crm.vo.PagingVO;
import com.crm.vo.SurveyVO;

public interface SurveyDao {

	public List<SurveyVO> surveyList(PagingVO pvo);
	public int surveyInsert(SurveyVO svo);
	public SurveyVO surveyDetail(SurveyVO svo);
	public SurveyVO surveyCheabun();
	
	public int surveyCountBoard(PagingVO pvo);
	
	
}
