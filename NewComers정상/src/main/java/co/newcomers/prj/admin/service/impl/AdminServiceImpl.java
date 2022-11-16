package co.newcomers.prj.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.newcomers.prj.admin.mapper.AdminMapper;
import co.newcomers.prj.admin.service.AdminService;
import co.newcomers.prj.admin.vo.AdminVO;
import co.newcomers.prj.cart.mapper.CartMapper;
import co.newcomers.prj.common.DataSource;
import co.newcomers.prj.member.vo.MemberVO;

public class AdminServiceImpl implements AdminService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private AdminMapper map = sqlSession.getMapper(AdminMapper.class);
	
	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return map.memberList();
	}

	@Override
	public List<AdminVO> showUpdateList() {
		// TODO Auto-generated method stub
		return map.showUpdateList();
	}

	@Override
	public int updateResposibility(String id) {
		// TODO Auto-generated method stub
		return map.updateResposibility(id);
	}

	@Override
	public int deleteResposibility(String id) {
		// TODO Auto-generated method stub
		return map.deleteResposibility(id);
	}

}
