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
		map.put("/main.do", new MainCommand()); // 처음 보여줄 페이지 명령
		map.put("/cart.do", new Cart()); // 장바구니 이동
		map.put("/updateCart.do", new UpdateCart()); // 장바구니 수정
		map.put("/deleteCart.do", new DeleteCart()); // 장바구니 삭제
		map.put("/deleteAllCart.do", new DeleteAllCart()); // 장바구니 전부 삭제
		map.put("/checkout.do", new Checkout()); // 주문화면 이동
		map.put("/confirmation.do", new Confirmation()); // 주문결과 이동
		map.put("/addCart.do", new AddCart());

		map.put("/mainblog.do", new MainBlog());	
		map.put("/blog.do", new Blog()); // 블로그 이동
		map.put("/blogInsert.do", new BlogInsert()); // 블로그 등록
		map.put("/blogUpdate.do", new BlogUpdate()); // 블로그 수정
		map.put("/blogDelete.do", new BlogDelete()); // 블로그 삭제
		map.put("/likeChange.do", new LikeChange()); // 좋아요 추가,삭제
		// 동욱씨
		map.put("/myPageForm.do", new MyPageForm()); //내 페이지로 폼으로 가기
		map.put("/mypageUpdate.do", new MypageUpdate()); // 내정보비밀번호묻기 기능
		map.put("/myinfoUpdate.do", new MyinfoUpdate()); //내정보 수정
		map.put("/myorderlistform.do", new MyorderlistForm()); //주문목록 페이지로 가는 기능.
		map.put("/mydetailorderlist.do", new MydetailOrderList()); // 주문했던목록 불러오는기능
		map.put("/shipconfirm.do", new Shipconfirm()); // 구매확정기능.
		map.put("/showUpdateList.do", new ShowUpdateList()); //신청한애들 목록보기
		map.put("/ajaxapprove.do", new Ajaxapprove()); // 승인.기능
		map.put("/userAllList.do", new UserAllList()); //모든유저보기
		// 미현씨
		map.put("/memberList.do", new MemberList()); //전체회원조회
		map.put("/memberLoginForm.do", new MemberLoginForm()); //로그인폼 호출
		map.put("/memberLogin.do", new MemberLogin()); //로그인 처리
		map.put("/kakaoLogin.do", new KakaoLogin()); //카카오 로그인 처리
		map.put("/logout.do", new Logout()); //로그아웃
		map.put("/memberSignUpForm.do", new MemberSignUpForm()); //회원가입 화면
		map.put("/memberSingUp.do", new MemberSingUp()); //회원가입 처리
		map.put("/ajaxIdCheck.do", new AjaxIdCheck()); //아이디 중복 여부 체크
		map.put("/messageForm.do", new MessageForm()); //메세지 폼 호출
		map.put("/applySeller.do", new ApplySeller()); //판매자 권한 부여
		map.put("/memberDelete.do", new MemberDelete()); //회원 탈퇴
		map.put("/contactForm.do",new ContactForm());
		
		
		map.put("/confirmEmailForm.do", new ConfirmEmailForm()); //이메일 인증 폼 호출
		map.put("/confirmEmail.do", new ConfirmEmail()); //이메일 인증
		
		// 경미씨
		map.put("/main.do", new MainCommand());
		map.put("/mainPage.do", new MainPage()); // 로고띄우기
		map.put("/category.do", new Category()); //카테고리 페이지이동
		map.put("/categoryNum.do", new CategoryNum()); //갯수로 표현 
		
		// 상품등록 진재환
		map.put("/itemRsForm.do", new ItemRsForm());
		map.put("/ItemRs.do", new ItemRs());
		// 상품상세보기,리뷰
		map.put("/itemDetailForm.do", new ItemDetailForm());
		map.put("/itemDetail.do", new ItemDetail());
		map.put("/reviewRs.do", new ReviewRs());
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
