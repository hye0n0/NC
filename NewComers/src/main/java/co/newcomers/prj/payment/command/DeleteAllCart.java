package co.newcomers.prj.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.payment.service.PaymentService;
import co.newcomers.prj.payment.service.impl.PaymentServiceImpl;
import co.newcomers.prj.payment.vo.CartVO;

public class DeleteAllCart implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
		CartVO vo = new CartVO();
		vo.setMemberId(memberId);

		PaymentService dao = new PaymentServiceImpl();
		dao.allCartDelete(vo);
		return "payment/cart.tiles";
	}

}
