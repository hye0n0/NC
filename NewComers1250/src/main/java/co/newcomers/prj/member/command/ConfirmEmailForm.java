package co.newcomers.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.common.Command;

public class ConfirmEmailForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 이메일 인증 창 호출
		System.out.println("이메일 인증창 호출");
		return "member/confirmEmail";
	}

}
