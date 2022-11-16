package co.newcomers.prj.blog.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.blog.service.BlogService;
import co.newcomers.prj.blog.service.impl.BlogServiceImpl;
import co.newcomers.prj.blog.vo.BlogVO;
import co.newcomers.prj.common.Command;

public class Blog implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
//		String seller = request.getParameter("seller");
		String nickname = request.getParameter("nickname");
		System.out.println(nickname);
		
		String seller = "uzgs";
		request.setAttribute("seller", nickname);
		
		
		List<BlogVO> blogs = new ArrayList<BlogVO>();
		BlogService dao = new BlogServiceImpl();
		seller = dao.getId(nickname);
		blogs = dao.blogSelectList(seller);

		// 줄바꿈 처리부분(수정예정)
//		if (blogs != null) {
//			for (BlogVO b : blogs) {
//				String context = b.getBlogContent().replace("\r\n", "<br>");
//				b.setBlogContent(context);
//			}
//		}
		request.setAttribute("blogs", blogs);

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		List<BlogVO> likes = new ArrayList<BlogVO>();
		likes = dao.likeSelect(id);
		
		session.setAttribute("likes", likes);

		return "blog/blog.tiles";
	}

}
