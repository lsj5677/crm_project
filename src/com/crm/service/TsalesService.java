package com.crm.service;


import java.util.List;

import com.crm.vo.TsalesVO;

public interface TsalesService {
		
		public List<TsalesVO> tsalesList();
//		public TsalesVO tsalesList();
		public TsalesVO tsalesSearch(String year);
		public int tsalesInsert(TsalesVO tvo);
		public int tsalesUpdate(TsalesVO tvo);
}
