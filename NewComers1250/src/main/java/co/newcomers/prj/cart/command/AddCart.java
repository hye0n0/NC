package co.newcomers.prj.cart.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.cart.service.CartService;
import co.newcomers.prj.cart.service.impl.CartServiceImpl;
import co.newcomers.prj.common.Command;
import co.newcomers.prj.item.service.ItemService;
import co.newcomers.prj.item.service.impl.ItemServiceImpl;

public class AddCart implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession(); // 세션값을 사용하기 위해
		CartService dao = new CartServiceImpl();
		String job = request.getParameter("job");
		String itemtitle = request.getParameter("itemtitle");
		System.out.println(itemtitle);
		String id = (String) session.getAttribute("id");
		System.out.println("addcart 내아이디"+id);
		String qty = request.getParameter("qty");
		System.out.println(qty);
		String result = "0";
		if(job.equals("main")) {
			int chk = dao.cartchk(id, itemtitle); // 중복체크
			if(chk>0) { //중복일때 update
				System.out.println("메인홈페이지에서 이미 담긴 카트 카운트 +1");
				dao.cartupdate(id, itemtitle,qty);
				result = "1";
			}else { //중복이아닐때 insert

				System.out.println("메인홈페이지에서 카트에 담기지 않은아이 새로넣기");
				dao.cartAdd(id, itemtitle,qty);
				result ="1";
			}		
		}else if(job.equals("detail")) {
			int chk = dao.cartchk(id, itemtitle); // 중복체크
			if(chk>0) { //중복일때 update
				System.out.println("디테일페이지에서 이미 담긴 카트 카운트 +1");
				dao.cartupdate(id, itemtitle,qty);
				result = "1";
			}else { //중복이아닐때 insert
				System.out.println("디테일페이지에서 카트에 담기지 않은아이 새로넣기");
				dao.cartAdd(id, itemtitle,qty);
				result ="1";
			}			
		}
	return"ajax:"+result;
}

}
