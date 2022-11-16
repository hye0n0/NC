package co.newcomers.prj.itemlist.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.itemlist.service.ItemService;
import co.newcomers.prj.itemlist.service.impl.ItemServiceImpl;
import co.newcomers.prj.itemlist.vo.ItemVO;

public class Category implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 카테고리 보기
		System.out.println("확인");
		ItemService dao = new ItemServiceImpl();
		List<ItemVO> items = new ArrayList<>();
		
		String order = request.getParameter("order");
		if(order == null) {
			order = "01";
		}
		items = dao.itemSelectList(order); 
		
		HttpSession session = request.getSession();
		session.removeAttribute("category");
		String category = request.getParameter("category");
		System.out.println(category);
		if(category != null) {
			session.setAttribute("category", category);
		}
		String search = request.getParameter("search");
		
		
		String minP = request.getParameter("minPrice");
		String maxP = request.getParameter("maxPrice");
		
		
		if(search != null) {
			items = dao.itemSearchList(search);
		}
		
		if(minP != null && maxP != null) {
			int minPrice = Integer.parseInt(minP);
			int maxPrice = Integer.parseInt(maxP);
			items = dao.itemPriceSelectList(minPrice, maxPrice);
		}
		
		session.setAttribute("items", items);
		System.out.println(items);
		return "itemlist/category.tiles";
	}

}
