package co.newcomers.prj.blog.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.blog.service.BlogService;
import co.newcomers.prj.blog.service.impl.BlogServiceImpl;
import co.newcomers.prj.blog.vo.BlogVO;
import co.newcomers.prj.common.Command;

public class BlogUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String blogCode = request.getParameter("blogCode");
		String blogContent = request.getParameter("blogContent");
		
		BlogVO vo = new BlogVO();
		vo.setBlogCode(blogCode);
		vo.setBlogContent(blogContent);
		BlogService dao = new BlogServiceImpl();
		dao.blogUpdate(vo);
		
		return "blog/blog.tiles";
	}

}
