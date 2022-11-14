package co.newcomers.prj.blog.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.common.Command;

public class Blog implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		return "blog/blog.tiles";
	}

}
