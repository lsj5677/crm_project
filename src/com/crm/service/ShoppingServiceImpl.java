package com.crm.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.ShoppingDao;
import com.crm.vo.ShoppingVO;

@Service("shoppingService")
@Transactional
public class ShoppingServiceImpl implements ShoppingService {

	Logger logger = Logger.getLogger(ShoppingServiceImpl.class);
	
	@Autowired
	private ShoppingDao shoppingDao;
	
	/*list*/
	@Override
	public List<ShoppingVO> shoppingList(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingServiceImpl.shoppingList >>>");
		logger.info("ShoppingServiceImpl.shoppingList <<<");
		return shoppingDao.shoppingList(svo);
	}

	@Override
	public ShoppingVO shoppingChaebun() {
		// TODO Auto-generated method stub
		logger.info("ShoppingServiceImpl.shoppingChaebun >>>");
		logger.info("ShoppingServiceImpl.shoppingChaebun <<<");
		return shoppingDao.shoppingChaebun();
	}

	@Override
	public int shoppingInsert(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingServiceImpl.shoppingInsert >>>");
		logger.info("ShoppingServiceImpl.shoppingInsert <<<");
		return shoppingDao.shoppingInsert(svo);
	}

	@Override
	public int shoppingStock(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingServiceImpl.shoppingStock >>>");
		logger.info("ShoppingServiceImpl.shoppingStock <<<");
		return shoppingDao.shoppingStock(svo);
	}

	@Override
	public int shoppingDelete(String c_shopping_id) {
		// TODO Auto-generated method stub
		logger.info("ShoppingServiceImpl.shoppingDelete >>>");
		logger.info("ShoppingServiceImpl.shoppingDelete <<<");
		return shoppingDao.shoppingDelete(c_shopping_id);
	}

	@Override
	public int shoppingStockPlus(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingServiceImpl.shoppingStockPlus >>>");
		logger.info("ShoppingServiceImpl.shoppingStockPlus <<<");
		return shoppingDao.shoppingStockPlus(svo);
	}

	@Override
	public int shoppingUpdate(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingServiceImpl.shoppingUpdate >>>");
		logger.info("ShoppingServiceImpl.shoppingUpdate <<<");
		return shoppingDao.shoppingUpdate(svo);
	}

	@Override
	public int shoppingAutoDel(String c_shopping_id) {
		// TODO Auto-generated method stub
		logger.info("ShoppingServiceImpl.shoppingAutoDel >>>");
		logger.info("ShoppingServiceImpl.shoppingAutoDel <<<");
		return shoppingDao.shoppingAutoDel(c_shopping_id);

	}

}
