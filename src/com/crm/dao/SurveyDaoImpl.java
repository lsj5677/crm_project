package com.crm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.PagingVO;
import com.crm.vo.SurveyVO;


@Repository
public class SurveyDaoImpl implements SurveyDao {

		@Autowired
		private SqlSession session;
		
	@Override
	public List<SurveyVO> surveyList(PagingVO pvo) {
		return session.selectList("surveyList", pvo);
	}

	@Override
	public int surveyInsert(SurveyVO svo) {
		return session.insert("surveyInsert",svo);
	}

	
	@Override
	public int surveyCountBoard(PagingVO pvo) {
		return (int)session.selectOne("surveyCountBoard", pvo);
	}

	@Override
	public SurveyVO surveyDetail(SurveyVO svo) {
		return (SurveyVO)session.selectOne("surveyDetail",svo);
	}

	@Override
	public SurveyVO surveyCheabun() {
		return session.selectOne("surveyChaebun");
	}

}
