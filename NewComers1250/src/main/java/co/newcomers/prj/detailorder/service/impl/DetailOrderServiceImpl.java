package co.newcomers.prj.detailorder.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.newcomers.prj.common.DataSource;
import co.newcomers.prj.detailorder.mapper.DetailOrderMapper;
import co.newcomers.prj.detailorder.service.DetailOrderService;
import co.newcomers.prj.detailorder.vo.DetailOrderVO;
import co.newcomers.prj.member.mapper.MemberMapper;

public class DetailOrderServiceImpl implements DetailOrderService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private DetailOrderMapper map = sqlSession.getMapper(DetailOrderMapper.class);
	@Override
	public List<DetailOrderVO> myShipping(String id) {
		// TODO Auto-generated method stub
		return map.myShipping(id);
	}
	@Override
	public List<DetailOrderVO> myEndShipping(String id) {
		// TODO Auto-generated method stub
		return map.myEndShipping(id);
	}
	@Override
	public int Shipconfirm(String id, String itemname) {
		// TODO Auto-generated method stub
		return map.Shipconfirm(id,itemname);
	}

}
