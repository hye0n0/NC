package co.newcomers.prj.detailorder.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.detailorder.service.DetailOrderService;
import co.newcomers.prj.detailorder.service.impl.DetailOrderServiceImpl;
import co.newcomers.prj.detailorder.vo.DetailOrderVO;

public class MydetailOrderList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		DetailOrderService dao = new DetailOrderServiceImpl();
		List<DetailOrderVO> myshipping = new ArrayList<DetailOrderVO>();//배송중인 내 목록을 띄울애..
		List<DetailOrderVO> myendship = new ArrayList<DetailOrderVO>();//배송중인 내 목록을 띄울애..
		//item
	
		myshipping = dao.myShipping(id);
	
// 값 담기 아래3개가 배송완료
		myendship = dao.myEndShipping(id);
		
		request.setAttribute("myshipping", myshipping);
		
		request.setAttribute("myendship", myendship);
		
		return "mypage/myorderlistform.tiles";
	}

}
