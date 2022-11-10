package co.newcomers.prj.payment.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.payment.service.PaymentService;
import co.newcomers.prj.payment.service.impl.PaymentServiceImpl;
import co.newcomers.prj.payment.vo.CartVO;

public class Cart implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		System.out.println(id);
		
		PaymentService dao = new PaymentServiceImpl();
		List<CartVO> carts = new ArrayList<CartVO>();
		carts = dao.cartSelectList(id);
		for(CartVO c : carts) {
			System.out.println(c.getItemTitle());
			System.out.println(c.getItemImage());
		}
		
		request.setAttribute("carts", carts);
		return "payment/cart.tiles";
	}

}
