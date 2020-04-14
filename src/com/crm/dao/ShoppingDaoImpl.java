package com.crm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.vo.ShoppingVO;

@Repository
public class ShoppingDaoImpl implements ShoppingDao {
	Logger logger = Logger.getLogger(ShoppingDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<ShoppingVO> shoppingList(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingDaoImpl.shoppingList >>>");
		logger.info("ShoppingDaoImpl.shoppingList <<<");
		return session.selectList("shoppingList",svo);
	}

	@Override
	public ShoppingVO shoppingChaebun() {
		// TODO Auto-generated method stub
		logger.info("ShoppingDaoImpl.shoppingChaebun >>>");
		logger.info("ShoppingDaoImpl.shoppingChaebun <<<");
		return session.selectOne("shoppingChaebun");
	}

	@Override
	public int shoppingInsert(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingDaoImpl.shoppingInsert >>>");
		logger.info("ShoppingDaoImpl.shoppingInsert <<<");
		return session.insert("shoppingInsert",svo);
	}

	@Override
	public int shoppingStock(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingDaoImpl.shoppingStock >>>");
		logger.info("ShoppingDaoImpl.shoppingStock <<<");
		return session.update("shoppingStock",svo);
	}
	
	@Override
	public int shoppingDelete(String c_shopping_id) {
		// TODO Auto-generated method stub
		logger.info("ShoppingDaoImpl.shoppingdelete >>>");
		logger.info("ShoppingDaoImpl.shoppingdelete <<<");
		return session.delete("shoppingDelete",c_shopping_id);
	}

	@Override
	public int shoppingStockPlus(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingDaoImpl.shoppingStockPlus >>>");
		logger.info("ShoppingDaoImpl.shoppingStockPlus <<<");
		return session.update("shoppingStockPlus",svo);
	}
	
	@Override
	public int shoppingUpdate(ShoppingVO svo) {
		// TODO Auto-generated method stub
		logger.info("ShoppingDaoImpl.shoppingUpdate >>>");
		logger.info("ShoppingDaoImpl.shoppingUpdate <<<");
		return session.update("shoppingUpdate",svo);
	}

	@Override
	public int shoppingAutoDel(String c_shopping_id) {
		// TODO Auto-generated method stub
		logger.info("ShoppingDaoImpl.shoppingAutoDel >>>");
		logger.info("ShoppingDaoImpl.shoppingAutoDel <<<");
		return session.delete("shoppingDelete",c_shopping_id);
	}


}
