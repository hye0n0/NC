package co.newcomers.prj.detailorder.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.detailorder.service.DetailOrderService;
import co.newcomers.prj.detailorder.service.impl.DetailOrderServiceImpl;
import co.newcomers.prj.detailorder.vo.DetailOrderVO;
import co.newcomers.prj.member.service.MemberService;
import co.newcomers.prj.member.service.impl.MemberServiceImpl;
import co.newcomers.prj.mypage.service.MypageService;
import co.newcomers.prj.mypage.service.impl.MypageServiceImpl;

public class Shipconfirm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		DetailOrderService dao = new DetailOrderServiceImpl();
		String itemName = request.getParameter("itemname");
		System.out.println(itemName);
		int chk = dao.Shipconfirm(id, itemName);
		if (chk > 0) {
			System.out.println("업데이트 완료");
		} else {
			System.out.println("오류");
		}

		return "mypage/mypage.tiles";
	}

}
