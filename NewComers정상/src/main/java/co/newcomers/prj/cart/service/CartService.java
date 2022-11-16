package co.newcomers.prj.cart.service;

import co.newcomers.prj.cart.vo.CartVO;
import co.newcomers.prj.member.vo.MemberVO;

public interface CartService {
	int mycartCount(MemberVO vo); //카트에 담긴갯수
	int cartAdd(String id, String itemtitle, String qty); //카트에 더하기
	int cartchk(String id, String itemtitle); // 중복..
	int cartupdate(String id,String itemtitle,String qty); // 중복인애들 업데이트
}
