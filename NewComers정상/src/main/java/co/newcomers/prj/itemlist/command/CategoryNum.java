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

public class CategoryNum implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ItemService dao = new ItemServiceImpl();
		List<ItemVO> items = new ArrayList<>();
		HttpSession session = request.getSession();
		String order = request.getParameter("order");
		int num = Integer.valueOf(request.getParameter("num"));
		
		System.out.println(order + "===========" + num);
		session.removeAttribute("items");
		items = dao.itemSearchCount(order, num);
		request.setAttribute("items", items);
		return "itemlist/category.tiles";
	}

}
