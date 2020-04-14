package com.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.SurveyDao;
import com.crm.vo.PagingVO;
import com.crm.vo.SurveyVO;
import com.sun.istack.internal.logging.Logger;


@Service
@Transactional
public class SurveyServiceImpl implements SurveyService {
		Logger logger = Logger.getLogger(SurveyServiceImpl.class);
	
		@Autowired
		private SurveyDao surveyDao;
	
	@Override
	public List<SurveyVO> surveyList(PagingVO pvo) {
		logger.info("SurveyServiceImpl surveyList >>> ");
		logger.info("SurveyServiceImpl surveyList >>> " + pvo.toString() );
		return surveyDao.surveyList(pvo);
	}
	
	

	@Override
	public int surveyInsert(SurveyVO svo) {
		logger.info("SurveyServiceImpl surveyInsert >>> ");
		return surveyDao.surveyInsert(svo);
	}

	public int surveyCountBoard(PagingVO pvo){
		logger.info("SurveyServiceImpl surveyCountBoard >>> ");
		logger.info("SurveyServiceImpl surveyCountBoard >>> " + pvo.toString() );
		return surveyDao.surveyCountBoard(pvo);
	}

	@Override
	public SurveyVO surveyDetail(SurveyVO svo) {
		logger.info("SurveyServiceImpl surveyDetail >>> ");
		return surveyDao.surveyDetail(svo);
	}

	@Override
	public SurveyVO surveyCheabun() {
		logger.info("SurveyServiceImpl surveyCheabun >>> ");
		return surveyDao.surveyCheabun();
	}

}
