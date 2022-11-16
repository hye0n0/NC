package co.newcomers.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.common.Command;

public class AuthCodeCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 인증번호 확인
		HttpSession session = request.getSession();
		String resultNum = (String) request.getAttribute("resultNum");
		
		System.out.println(resultNum);
		return "member/authCodeCheck";
	}

}
