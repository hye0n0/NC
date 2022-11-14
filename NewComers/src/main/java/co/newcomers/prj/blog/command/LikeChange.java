package co.newcomers.prj.blog.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.blog.service.BlogService;
import co.newcomers.prj.blog.service.impl.BlogServiceImpl;
import co.newcomers.prj.blog.vo.BlogVO;
import co.newcomers.prj.common.Command;

public class LikeChange implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int likeCount = Integer.parseInt(request.getParameter("likeCount"));
		System.out.println(likeCount);
		String blogCode = request.getParameter("blogCode");
		System.out.println(blogCode);
		String val = request.getParameter("val");
		System.out.println(val);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		
		BlogVO vo = new BlogVO();
		vo.setBlogCode(blogCode);
		vo.setBlogLike(likeCount);
		vo.setMemberId(id);
		
		BlogService dao = new BlogServiceImpl();
		dao.likeUpdate(vo);
		if(val.equals("add")){
			dao.likeInsert(vo);
		}else if(val.equals("del")){
			dao.likeDelete(vo);
		}
		
		return "blog/blog.tiles";
	}

}
