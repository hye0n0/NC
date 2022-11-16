package co.newcomers.prj.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.cart.service.CartService;
import co.newcomers.prj.cart.service.impl.CartServiceImpl;
import co.newcomers.prj.common.Command;
import co.newcomers.prj.itemlist.service.ItemService;
import co.newcomers.prj.itemlist.service.impl.ItemServiceImpl;
import co.newcomers.prj.itemlist.vo.ItemVO;
import co.newcomers.prj.member.service.MemberService;
import co.newcomers.prj.member.service.impl.MemberServiceImpl;
import co.newcomers.prj.member.vo.MemberVO;

public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ItemService dao = new ItemServiceImpl();
		List<ItemVO> items = new ArrayList<>();
		
		items = dao.itemSelectList("01");
		System.out.println(items);
		session.setAttribute("mainitems", items);
		
		return "main/main";
	}

}
