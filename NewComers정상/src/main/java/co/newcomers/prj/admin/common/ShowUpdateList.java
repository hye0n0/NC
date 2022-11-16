package co.newcomers.prj.admin.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.admin.service.AdminService;
import co.newcomers.prj.admin.service.impl.AdminServiceImpl;
import co.newcomers.prj.admin.vo.AdminVO;
import co.newcomers.prj.common.Command;

public class ShowUpdateList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		AdminService dao = new AdminServiceImpl();
		List<AdminVO> list = new ArrayList<AdminVO>();
		list = dao.showUpdateList();

		request.setAttribute("list", list);

		return "admin/userapplicaion.tiles";
	}

}
