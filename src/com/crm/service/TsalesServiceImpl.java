package com.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.TsalesDao;
import com.crm.vo.TsalesVO;
import com.sun.istack.internal.logging.Logger;

@Service
@Transactional
public class TsalesServiceImpl implements TsalesService {
	Logger logger = Logger.getLogger(TsalesServiceImpl.class);

	@Autowired
	private TsalesDao tsalesDao;
	// @Override
	// public List<TsalesVO> tsalesList() {
	// public String tsalesList() {
	//
	// logger.info("tsalesServiceImpl tsalesList >>> ");
	// List<TsalesVO> list = tsalesDao.tsalesList();
	// String list = tsalesDao.tsalesList();
	//
	// System.out.println("list : " + list);
	// return list;
	// }

	@Override
	public List<TsalesVO> tsalesList() {
		// public TsalesVO tsalesList() {
		// TODO Auto-generated method stub
		List<TsalesVO> list = new ArrayList<TsalesVO>();
		list = tsalesDao.tsalesList();
		// TsalesVO list = tsalesDao.tsalesList();

		System.out.println("listToString : " + list.toString());
		return list;
	}

	@Override
	public TsalesVO tsalesSearch(String year) {
		// TODO Auto-generated method stub
		System.out.println("tsalesServiceImpl.tsalesSearch()�Լ� ����");

		return tsalesDao.tsalesSearch(year);
	}

	@Override
	public int tsalesInsert(TsalesVO tvo) {
		logger.info("tsalesServiceImpl tsalesInsert()�Լ� ���� ");
		System.out.println("tvo : " + tvo.toString());
		int result = tsalesDao.tsalesInsert(tvo);
		return result;
	}

	@Override
	public int tsalesUpdate(TsalesVO tvo) {
		logger.info("tsalesServiceImpl tsalesUpdate()�Լ� ���� ");
		return tsalesDao.tsalesUpdate(tvo);
	}

}
