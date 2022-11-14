package co.newcomers.prj.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.newcomers.prj.main.MainCommand;
import co.newcomers.prj.member.command.MemberList;
import co.newcomers.prj.member.command.MemberLogin;
import co.newcomers.prj.member.command.MemberLoginForm;
import co.newcomers.prj.member.command.MemberSignUp;
import co.newcomers.prj.mypage.command.MyPageForm;
import co.newcomers.prj.mypage.command.MyinfoUpdate;
import co.newcomers.prj.mypage.command.MyorderlistForm;
import co.newcomers.prj.mypage.command.MypageUpdate;
import co.newcomers.prj.payment.command.Cart;
import co.newcomers.prj.payment.command.Checkout;
import co.newcomers.prj.payment.command.Confirmation;
import co.newcomers.prj.payment.command.DeleteAllCart;
import co.newcomers.prj.payment.command.DeleteCart;
import co.newcomers.prj.payment.command.UpdateCart;
import co.newcomers.prj.blog.command.Blog;
import co.newcomers.prj.common.Command;
import co.newcomers.prj.detailorder.command.MydetailOrderList;
import co.newcomers.prj.itemlist.command.Category;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainCommand()); // 처음 보여줄 페이지 명령
		map.put("/cart.do", new Cart()); // 장바구니 이동
		map.put("/updateCart.do", new UpdateCart()); // 장바구니 수정
		map.put("/deleteCart.do", new DeleteCart()); // 장바구니 삭제
		map.put("/deleteAllCart.do", new DeleteAllCart()); // 장바구니 전부 삭제
		map.put("/checkout.do", new Checkout()); // 주문화면 이동
		map.put("/confirmation.do", new Confirmation()); // 주문결과 이동
		map.put("/blog.do", new Blog()); // 블로그 이동

		// 동욱씨
		map.put("/myPageForm.do", new MyPageForm());
		map.put("/mypageUpdate.do", new MypageUpdate());
		map.put("/myinfoUpdate.do", new MyinfoUpdate());
		map.put("/myorderlistform.do", new MyorderlistForm());
		map.put("/mydetailorderlist.do", new MydetailOrderList());
		// MydetailOrderList
		// 미현씨
		map.put("/memberLoginForm.do", new MemberLoginForm());
		map.put("/memberSignUp.do", new MemberSignUp());
		map.put("/memberLogin.do", new MemberLogin());
		// 경미씨
		map.put("/category.do", new Category());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글깨짐방지
		String uri = request.getRequestURI(); // 요청한 uri를 구함
		String contextPath = request.getContextPath(); // 루트를 구함, context path
		String page = uri.substring(contextPath.length()); // 실제 수행할 요청을 구함

		Command command = map.get(page); // init 메소드에서 수행할 명령을 가져온다
		String viewPage = command.exec(request, response); // 명령을 수행하고 결과를 돌려받음
//		System.out.println(viewPage);

		// viewResolve 파트
		if (!viewPage.endsWith(".do") && viewPage != null) {
			// ajax 처리
			if (viewPage.startsWith("ajax:")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(viewPage.substring(5));
				return;
			}
			// 타일즈 돌아가는 곳
			if (!viewPage.endsWith(".tiles")) {
				viewPage = "/WEB-INF/views/" + viewPage + ".jsp"; // 타일즈를 안태움
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect(viewPage); // *.do로 들어올때 돌아가는 곳
		}
	}

}
