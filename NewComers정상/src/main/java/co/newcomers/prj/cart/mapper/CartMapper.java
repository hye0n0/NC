package co.newcomers.prj.cart.mapper;

import org.apache.ibatis.annotations.Param;

import co.newcomers.prj.cart.vo.CartVO;
import co.newcomers.prj.member.vo.MemberVO;

public interface CartMapper {
	int mycartCount(MemberVO vo); //카트에 담긴갯수
	int cartAdd(@Param("id") String id,@Param("itemtitle") String itemtitle,@Param("qty") String qty);
	int cartchk(@Param("id") String id,@Param("itemtitle") String itemtitle); // 중복..
	int cartupdate(@Param("id") String id,@Param("itemtitle") String itemtitle,@Param("qty") String qty); // 중복인애들 업데이트

}
