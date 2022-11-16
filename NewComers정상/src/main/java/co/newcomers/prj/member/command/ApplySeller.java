package co.newcomers.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.member.service.MemberService;
import co.newcomers.prj.member.service.impl.MemberServiceImpl;
import co.newcomers.prj.member.vo.MemberVO;

public class ApplySeller implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 관리자에게 판매자격 신청.
		HttpSession session = request.getSession();
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		String id = (String) session.getAttribute("id");
		String email = (String) session.getAttribute("email");
		String address = (String) session.getAttribute("address");
		System.out.println(id);
		vo.setId(id);
		vo.setEmail(email);
		vo.setAddress(address);
		int n = dao.memberApplySeller(vo);
		if(n > 0) {
			System.out.println("신청완료");		
		}else {
			System.out.println("신청불가");
			return "mypage/mypageUpdate.tiles";
		}
		
		return "main/main.tiles";
	}

}
