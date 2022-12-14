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

import co.newcomers.prj.admin.common.Ajaxapprove;
import co.newcomers.prj.admin.common.ShowUpdateList;
import co.newcomers.prj.admin.common.UserAllList;
import co.newcomers.prj.blog.command.Blog;
import co.newcomers.prj.blog.command.BlogDelete;
import co.newcomers.prj.blog.command.BlogInsert;
import co.newcomers.prj.blog.command.BlogUpdate;
import co.newcomers.prj.blog.command.LikeChange;
import co.newcomers.prj.blog.command.MainBlog;
import co.newcomers.prj.cart.command.AddCart;
import co.newcomers.prj.common.Command;
import co.newcomers.prj.detailorder.command.MydetailOrderList;
import co.newcomers.prj.detailorder.command.Shipconfirm;
import co.newcomers.prj.item.command.ItemDetail;
import co.newcomers.prj.item.command.ItemDetailForm;
import co.newcomers.prj.item.command.ItemRs;
import co.newcomers.prj.item.command.ItemRsForm;
import co.newcomers.prj.item.command.ReviewRs;
import co.newcomers.prj.itemlist.command.Category;
import co.newcomers.prj.itemlist.command.CategoryNum;
import co.newcomers.prj.main.MainCommand;
import co.newcomers.prj.main.MainPage;
import co.newcomers.prj.member.command.AjaxIdCheck;
import co.newcomers.prj.member.command.ApplySeller;
import co.newcomers.prj.member.command.ConfirmEmail;
import co.newcomers.prj.member.command.ConfirmEmailForm;
import co.newcomers.prj.member.command.ContactForm;
import co.newcomers.prj.member.command.KakaoLogin;
import co.newcomers.prj.member.command.Logout;
import co.newcomers.prj.member.command.MemberDelete;
import co.newcomers.prj.member.command.MemberList;
import co.newcomers.prj.member.command.MemberLogin;
import co.newcomers.prj.member.command.MemberLoginForm;
import co.newcomers.prj.member.command.MemberSignUpForm;
import co.newcomers.prj.member.command.MemberSingUp;
import co.newcomers.prj.member.command.MessageForm;
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

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();

	}
	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainCommand()); // ?????? ????????? ????????? ??????
		map.put("/cart.do", new Cart()); // ???????????? ??????
		map.put("/updateCart.do", new UpdateCart()); // ???????????? ??????
		map.put("/deleteCart.do", new DeleteCart()); // ???????????? ??????
		map.put("/deleteAllCart.do", new DeleteAllCart()); // ???????????? ?????? ??????
		map.put("/checkout.do", new Checkout()); // ???????????? ??????
		map.put("/confirmation.do", new Confirmation()); // ???????????? ??????
		map.put("/addCart.do", new AddCart());

		map.put("/mainblog.do", new MainBlog());	
		map.put("/blog.do", new Blog()); // ????????? ??????
		map.put("/blogInsert.do", new BlogInsert()); // ????????? ??????
		map.put("/blogUpdate.do", new BlogUpdate()); // ????????? ??????
		map.put("/blogDelete.do", new BlogDelete()); // ????????? ??????
		map.put("/likeChange.do", new LikeChange()); // ????????? ??????,??????
		// ?????????
		map.put("/myPageForm.do", new MyPageForm()); //??? ???????????? ????????? ??????
		map.put("/mypageUpdate.do", new MypageUpdate()); // ??????????????????????????? ??????
		map.put("/myinfoUpdate.do", new MyinfoUpdate()); //????????? ??????
		map.put("/myorderlistform.do", new MyorderlistForm()); //???????????? ???????????? ?????? ??????.
		map.put("/mydetailorderlist.do", new MydetailOrderList()); // ?????????????????? ??????????????????
		map.put("/shipconfirm.do", new Shipconfirm()); // ??????????????????.
		map.put("/showUpdateList.do", new ShowUpdateList()); //??????????????? ????????????
		map.put("/ajaxapprove.do", new Ajaxapprove()); // ??????.??????
		map.put("/userAllList.do", new UserAllList()); //??????????????????
		// ?????????
		map.put("/memberList.do", new MemberList()); //??????????????????
		map.put("/memberLoginForm.do", new MemberLoginForm()); //???????????? ??????
		map.put("/memberLogin.do", new MemberLogin()); //????????? ??????
		map.put("/kakaoLogin.do", new KakaoLogin()); //????????? ????????? ??????
		map.put("/logout.do", new Logout()); //????????????
		map.put("/memberSignUpForm.do", new MemberSignUpForm()); //???????????? ??????
		map.put("/memberSingUp.do", new MemberSingUp()); //???????????? ??????
		map.put("/ajaxIdCheck.do", new AjaxIdCheck()); //????????? ?????? ?????? ??????
		map.put("/messageForm.do", new MessageForm()); //????????? ??? ??????
		map.put("/applySeller.do", new ApplySeller()); //????????? ?????? ??????
		map.put("/memberDelete.do", new MemberDelete()); //?????? ??????
		map.put("/contactForm.do",new ContactForm());
		
		
		map.put("/confirmEmailForm.do", new ConfirmEmailForm()); //????????? ?????? ??? ??????
		map.put("/confirmEmail.do", new ConfirmEmail()); //????????? ??????
		
		// ?????????
		map.put("/main.do", new MainCommand());
		map.put("/mainPage.do", new MainPage()); // ???????????????
		map.put("/category.do", new Category()); //???????????? ???????????????
		map.put("/categoryNum.do", new CategoryNum()); //????????? ?????? 
		
		// ???????????? ?????????
		map.put("/itemRsForm.do", new ItemRsForm());
		map.put("/ItemRs.do", new ItemRs());
		// ??????????????????,??????
		map.put("/itemDetailForm.do", new ItemDetailForm());
		map.put("/itemDetail.do", new ItemDetail());
		map.put("/reviewRs.do", new ReviewRs());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // ??????????????????
		String uri = request.getRequestURI(); // ????????? uri??? ??????
		String contextPath = request.getContextPath(); // ????????? ??????, context path
		String page = uri.substring(contextPath.length()); // ?????? ????????? ????????? ??????

		Command command = map.get(page); // init ??????????????? ????????? ????????? ????????????
		String viewPage = command.exec(request, response); // ????????? ???????????? ????????? ????????????
//		System.out.println(viewPage);

		// viewResolve ??????
		if (!viewPage.endsWith(".do") && viewPage != null) {
			// ajax ??????
			if (viewPage.startsWith("ajax:")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(viewPage.substring(5));
				return;
			}
			// ????????? ???????????? ???
			if (!viewPage.endsWith(".tiles")) {
				viewPage = "/WEB-INF/views/" + viewPage + ".jsp"; // ???????????? ?????????
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect(viewPage); // *.do??? ???????????? ???????????? ???
		}
	}

}
