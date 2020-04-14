package com.crm.dao;


import java.util.List;

import com.crm.vo.TsalesVO;

public interface TsalesDao {
	
	public List<TsalesVO> tsalesList();
//	public TsalesVO tsalesList();
	public TsalesVO tsalesSearch(String year);

	public int tsalesInsert(TsalesVO tvo);
	public int tsalesUpdate(TsalesVO tvo);
}
