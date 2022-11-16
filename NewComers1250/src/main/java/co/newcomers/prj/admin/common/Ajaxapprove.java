package co.newcomers.prj.admin.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.admin.service.AdminService;
import co.newcomers.prj.admin.service.impl.AdminServiceImpl;
import co.newcomers.prj.common.Command;

public class Ajaxapprove implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println(id);
		int result = 0;
		AdminService dao = new AdminServiceImpl();
			if(dao.updateResposibility(id)>0) {
				dao.updateResposibility(id);
				dao.deleteResposibility(id);
				result = 1;
				System.out.println("성공");
			}else {
				System.out.println("실패");
			}
		return "ajax:"+result;
	}

}
