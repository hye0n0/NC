package co.newcomers.prj.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.payment.service.PaymentService;
import co.newcomers.prj.payment.service.impl.PaymentServiceImpl;
import co.newcomers.prj.payment.vo.CartVO;

public class UpdateCart implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cartCode = request.getParameter("cartCode");
		int itemCount = Integer.parseInt(request.getParameter("itemCount"));
		CartVO vo = new CartVO();
		vo.setCartCode(cartCode);
		vo.setItemCount(itemCount);
		PaymentService dao = new PaymentServiceImpl();
		dao.cartUpdate(vo);
		
		
		return "payment/cart.tiles";
	}

}
