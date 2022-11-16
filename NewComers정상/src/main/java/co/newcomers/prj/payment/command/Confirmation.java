package co.newcomers.prj.payment.command;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tiles.definition.dao.BaseLocaleUrlDefinitionDAO;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.payment.service.PaymentService;
import co.newcomers.prj.payment.service.impl.PaymentServiceImpl;
import co.newcomers.prj.payment.vo.CartVO;
import co.newcomers.prj.payment.vo.OrderVO;

public class Confirmation implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		PaymentService dao = new PaymentServiceImpl();
		String uid = request.getParameter("merchant_uid");
		int total = Integer.parseInt(request.getParameter("total"));
		OrderVO vo = new OrderVO();
		vo.setOrderCode(uid);
		vo.setOrderTotal(total);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setOrderId(id);
		dao.orderInsert(vo);
		List<CartVO> list = (List<CartVO>) session.getAttribute("carts");
		for(CartVO c : list) {
			vo.setItemCode(c.getItemCode());
			vo.setItemCount(c.getItemCount());
			dao.detailOrderInsert(vo);
		}
		CartVO cart = new CartVO();
		cart.setMemberId(id);
		dao.allCartDelete(cart);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String nowTime = sdf.format(now);
		request.setAttribute("nowTime", nowTime);
		request.setAttribute("uid", uid);
		request.setAttribute("total", total);
		
		return "payment/confirmation.tiles";
	}

}
