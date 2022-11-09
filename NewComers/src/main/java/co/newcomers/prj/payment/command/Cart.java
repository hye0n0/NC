package co.newcomers.prj.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.common.Command;

public class Cart implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "payment/cart";
	}

}
