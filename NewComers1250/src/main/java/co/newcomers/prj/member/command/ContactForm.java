package co.newcomers.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.common.Command;

public class ContactForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 지도폼 호출
		return "member/contactForm.tiles";
	}

}
