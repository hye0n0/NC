package co.newcomers.prj.blog.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.newcomers.prj.blog.service.BlogService;
import co.newcomers.prj.blog.service.impl.BlogServiceImpl;
import co.newcomers.prj.blog.vo.BlogVO;
import co.newcomers.prj.common.Command;

public class BlogInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("확인");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String saveDir = request.getServletContext().getRealPath("upload/blog");
		System.out.println(saveDir);
		String encod = "UTF-8";
		int maxSize = 5 * 1024 * 1024; // 5 메가 제한
		
		try {
			MultipartRequest mr = new MultipartRequest(
					request, // 요청정보
					saveDir, // 저장위치
					maxSize, // 파일크기
					encod, // 인코딩
					new DefaultFileRenamePolicy()
					);
			String blogContent = mr.getParameter("blog_content");
			String blogImage = mr.getFilesystemName("blog_image");
			System.out.println(blogContent);
			System.out.println(blogImage);
			BlogVO vo = new BlogVO();
			vo.setBlogContent(blogContent);
			vo.setBlogImage(blogImage);
			vo.setBlogWriter(id);
			BlogService dao = new BlogServiceImpl();
			dao.blogInsert(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "blog.do";
	}

}
