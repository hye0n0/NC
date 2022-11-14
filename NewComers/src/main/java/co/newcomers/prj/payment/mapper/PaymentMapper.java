package co.newcomers.prj.payment.mapper;

import java.util.List;

import co.newcomers.prj.payment.vo.CartVO;
import co.newcomers.prj.payment.vo.OrderVO;

public interface PaymentMapper {
	List<CartVO> cartSelectList(String id); // 장바구니 목록 가져오기
	int cartInsert(CartVO vo); // 장바구니 등록
	int cartDelete(CartVO vo); // 장바구니 삭제
	int cartUpdate(CartVO vo); // 장바구니 수정
	int allCartDelete(CartVO vo); //장바구니 전부 삭제
	int orderInsert(OrderVO vo); // 주문테이블 등록
	int detailOrderInsert(OrderVO vo); // 주문상세테이블에 등록
	
	int mycartCount(CartVO vo); //카트에 담긴갯수
}
