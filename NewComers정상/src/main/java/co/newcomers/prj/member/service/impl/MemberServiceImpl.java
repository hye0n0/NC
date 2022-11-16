package co.newcomers.prj.member.service.impl;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.session.SqlSession;

import co.newcomers.prj.common.DataSource;
import co.newcomers.prj.member.mapper.MemberMapper;
import co.newcomers.prj.member.service.MemberService;
import co.newcomers.prj.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);
	@Override
	public List<MemberVO> memberList() {
		//회원 전체 리스트
		return map.memberList();
	} 

	@Override
	public MemberVO memberSelect(MemberVO vo) {
		//회원 개인 리스트
		return map.memberSelect(vo);
	}
	
	@Override
	public MemberVO memberSelect2(String id) {
		// 회원 개인 리스트 불러오기2
		return map.memberSelect2(id);
	}
	
	@Override
	public MemberVO memberSelectEmail(MemberVO vo) {
		//회원 개인 리스트 불러오기3
		
		return map.memberSelectEmail(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		// 회원가입
		return map.memberInsert(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		// 회원탈퇴
		return map.memberDelete(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		//회원수정
		return map.memberUpdate(vo);
	}
	
	@Override
	public void memberPasswordUpdate(String id, String password) {
		// 회원비밀번호수정
		map.memberPasswordUpdate(id, password);
	}

	@Override
	public MemberVO memberLogin(String id, String password) {
		//로그인
		return map.memberLogin(id, password);
	}

	@Override
	public boolean isMemberIdCheck(String id) {
		//중복체크
		return map.isMemberIdCheck(id);
	}
	


	@Override
	public int memberApplySeller(MemberVO vo) {
		// 판매자격신청
		return map.memberApplySeller(vo);
	}

	@Override
	//이메일 발송
	public String sendMail(String toId, String subject, String content) {
		String _email = "rnjsalgus211@naver.com";
		String _password = "Dnfqjt@24";
 
		String title = subject;
		String fromMail = "rnjsalgus211@naver.com";// "cholee@yedam.ac";
		String fromName = "보내는사람이름";
		String toMail = toId;// "leadon@naver.com"; // 콤마(,) 나열 가능

		// mail properties
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.naver.com"); // use Gmail
		props.put("mail.smtp.port", "587"); // set port

		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true"); // use TLS
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() { // set authenticator
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(_email, _password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(mailSession);

			// 한글의 경우 endcoding 필요
			message.setFrom(new InternetAddress(fromMail, MimeUtility.encodeText(fromName, "UTF-8", "B"))); 
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toMail));
			message.setSubject(title);
			message.setContent(content, "text/html;charset=UTF-8"); // 내용 설정 (HTML 형식)
			message.setSentDate(new java.util.Date());

			Transport t = mailSession.getTransport("smtp");
			t.connect(_email, _password);
			t.sendMessage(message, message.getAllRecipients());
			t.close();

			return "Success";
			
		} catch (javax.mail.internet.AddressException ae) {
			ae.printStackTrace();
			return "Fail";
		} catch (javax.mail.MessagingException me) {
			me.printStackTrace();
			return "Fail";
		} catch (java.io.UnsupportedEncodingException ue) {
			ue.printStackTrace();
			return "Fail";
		}  catch (NullPointerException e1) {
			System.out.println("존재하지 않는 회원 아이디입니다.");
			return "Fail";
		} catch (Exception e) {
			e.printStackTrace();
			return "Fail";
		}

	}


}
