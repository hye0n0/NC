package co.newcomers.prj.payment.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.payment.vo.CartVO;

public class Checkout implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		List<CartVO>  carts = (List<CartVO>) session.getAttribute("carts");
		System.out.println(carts);
		
		return "payment/checkout.tiles";
	}
}
