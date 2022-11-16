package co.newcomers.prj.item.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.newcomers.prj.common.DataSource;
import co.newcomers.prj.item.mapper.ItemMapper;
import co.newcomers.prj.item.service.ItemService;
import co.newcomers.prj.item.vo.ItemDetailVO;
import co.newcomers.prj.item.vo.ItemVO;
import co.newcomers.prj.item.vo.ReviewVO;

public class ItemServiceImpl implements ItemService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private ItemMapper map = sqlSession.getMapper(ItemMapper.class);
	@Override
	public ItemDetailVO itemSelect(String itemtitle) {
		// TODO Auto-generated method stub
		return map.itemSelect(itemtitle);
	}
	@Override
	public int itemInsert(ItemVO vo) {
		// TODO Auto-generated method stub
		return map.itemInsert(vo);
	}
	@Override
	public List<ReviewVO> reviewSelect(String itemtitle) {
		// TODO Auto-generated method stub
		return map.reviewSelect(itemtitle);
	}
	@Override
	public int reviewInsert(ReviewVO vo) {
		// TODO Auto-generated method stub
		return map.reviewInsert(vo);
	}
	@Override
	public int itemDetailInsert(ItemDetailVO vo) {
		// TODO Auto-generated method stub
		return map.itemDetailInsert(vo);
	}
	@Override
	public String seqNum() {
		// TODO Auto-generated method stub
		return map.seqNum();
	}


}
