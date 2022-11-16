package co.newcomers.prj.member.command;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.newcomers.prj.common.Command;
import co.newcomers.prj.member.service.MemberService;
import co.newcomers.prj.member.service.impl.MemberServiceImpl;
import co.newcomers.prj.member.vo.MemberVO;

public class ConfirmEmail implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 이메일 인증 창
		HttpSession session = request.getSession();
		System.out.println("ConfirmEmail(1) 호출 성공.");
		MemberService dao = new MemberServiceImpl();	
		MemberVO vo = new MemberVO();
		
		String email = (String) request.getParameter("email");
		vo.setEmail(email);
		
		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int letter = 6;
		String resultNum = "";
		vo = dao.memberSelectEmail(vo);
		
		if(vo != null) {
		System.out.println("해당하는 아이디 값:"+vo.getId());
		}
		String id = (String) request.getParameter("id");
		if(vo != null && vo.getId().equals(id)) {
		for(int i=0; i<letter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resultNum += ranNum;	
		} //인증번호 생성 끝 ->resultNum에 저장
		
		String subject = "NewComers에서 발송된 인증번호입니다.";	//제목지정
		String authMail = "인증번호는 " + resultNum + "입니다.";		//저장된 인증번호와 함께 메일 context 지정
		//fetch 함수에 담겨진 email값과 제목, context를 매개변수로 메소드 실행		
		String result = dao.sendMail(email, subject, authMail);
		System.out.println(result);
		
		if (result == "Fail") {
			System.out.println("ConfirmEmail실패");
			return "ajax:failed";
		}
		System.out.println("ConfirmEmail성공!");
		
		vo.setEmail(email);
		vo.setPassword(resultNum);
		System.out.println(vo.getPassword());
		dao.memberPasswordUpdate(vo.getEmail(), vo.getPassword());
		System.out.println("ConfirmEmail(2) 호출 성공.");
		return "ajax:" + resultNum;
		
		}else {
			System.out.println("db에 등록 된 정보가 없습니다.");
			return "ajax:failed";
		}
		

	}

}
