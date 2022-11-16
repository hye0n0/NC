package co.newcomers.prj.admin.common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.member.service.MemberService;
import co.newcomers.prj.member.service.impl.MemberServiceImpl;
import co.newcomers.prj.member.vo.MemberVO;

public class UserAllList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		MemberService dao = new MemberServiceImpl();
		List<MemberVO> members = new ArrayList();
		members = dao.memberList();
		System.out.println(members);
		request.setAttribute("members", members);
		
		return "admin/useralllist.tiles";
	}
	
}
