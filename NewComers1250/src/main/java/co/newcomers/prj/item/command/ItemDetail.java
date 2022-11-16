package co.newcomers.prj.item.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.item.service.ItemService;
import co.newcomers.prj.item.service.impl.ItemServiceImpl;
import co.newcomers.prj.item.vo.ItemDetailVO;
import co.newcomers.prj.item.vo.ReviewVO;

public class ItemDetail implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("확인");
		HttpSession session = request.getSession(); //세션값을 사용하기 위해
		ItemService dao = new ItemServiceImpl();
		
		String itemtitle = request.getParameter("itemtitle");
		System.out.println(itemtitle);
	
		
		// 아이템 상세보기
		ItemDetailVO item = new ItemDetailVO();
		item = dao.itemSelect(itemtitle);
		System.out.println(item);
	
		session.setAttribute("item", item);
		
		// 리뷰 상세보기
		List<ReviewVO> reviews = new ArrayList<>();
		reviews = dao.reviewSelect(itemtitle);
		System.out.println(reviews);
		session.setAttribute("reviews", reviews); 


		return "item/itemDetailForm.tiles";

	}
}
