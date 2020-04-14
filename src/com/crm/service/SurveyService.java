package com.crm.service;

import java.util.List;

import com.crm.vo.PagingVO;
import com.crm.vo.SurveyVO;

public interface SurveyService {
	
	public List<SurveyVO> surveyList(PagingVO pvo);
	public int surveyInsert(SurveyVO svo);
	public SurveyVO surveyDetail(SurveyVO svo);
	public SurveyVO surveyCheabun();
	//게시글 총 갯수 
	public int surveyCountBoard(PagingVO pvo);
}
