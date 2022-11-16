package co.newcomers.prj.itemlist.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.newcomers.prj.common.DataSource;
import co.newcomers.prj.itemlist.mapper.ItemMapper;
import co.newcomers.prj.itemlist.service.ItemService;
import co.newcomers.prj.itemlist.vo.ItemVO;

public class ItemServiceImpl implements ItemService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ItemMapper map = sqlSession.getMapper(ItemMapper.class);
	@Override
	public List<ItemVO> itemSelectList(String order) {
		// 상품전체조회
		return map.itemSelectList(order);
	}
	
	@Override
		public List<ItemVO> categorySelectList(String itemCategory) {
			// 카테고리별조회
			return map.categorySelectList(itemCategory);
		}
	
	@Override
	public List<ItemVO> itemPriceSelectList(int minPrice, int maxPrice) {
		// 상품가격별조회
		return map.itemPriceSelectList(minPrice, maxPrice);
	}
	
	@Override
	public List<ItemVO> itemSearchList(String itemSearch) {
		// 상품전체검색
		return map.itemSearchList(itemSearch);
	}
	@Override
	public ItemVO itemSelect(ItemVO vo) {
		// 상품코드로 조회
		return map.itemSelect(vo);
	}

	@Override
	public ItemVO itemSearch(ItemVO vo) {
		// 상품코드로 찾기
		return map.itemSearch(vo);
	}
	
	@Override
	public int itemInsert(ItemVO vo) {
		// TODO Auto-generated method stub
		return map.itemInsert(vo);
	}

	@Override
	public int itemDelete(ItemVO vo) {
		// TODO Auto-generated method stub
		return map.itemDelete(vo);
	}

	@Override
	public int itemUpdate(ItemVO vo) {
		// TODO Auto-generated method stub
		return map.itemUpdate(vo);
	}

	

	

	

	


}
