package co.newcomers.prj.payment.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.newcomers.prj.common.DataSource;
import co.newcomers.prj.payment.mapper.PaymentMapper;
import co.newcomers.prj.payment.service.PaymentService;
import co.newcomers.prj.payment.vo.CartVO;

public class PaymentServiceImpl implements PaymentService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	PaymentMapper map =sqlSession.getMapper(PaymentMapper.class);
	@Override
	public List<CartVO> cartSelectList(String id) {

		return map.cartSelectList(id);
	}
	@Override
	public int cartInsert(CartVO vo) {

		return map.cartInsert(vo);
	}
	@Override
	public int cartDelete(CartVO vo) {

		return map.cartDelete(vo);
	}
	@Override
	public int cartUpdate(CartVO vo) {

		return map.cartUpdate(vo);
	}

}
