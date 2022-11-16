package co.newcomers.prj.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.newcomers.prj.member.vo.MemberVO;

public interface MemberMapper {

	List<MemberVO> memberList(); //전체 회원 정보
	MemberVO memberSelect(MemberVO vo); //회원 한명의 정보
	MemberVO memberSelect2(String id);
	MemberVO memberSelectEmail(MemberVO vo);
	
	int memberInsert(MemberVO vo); //회원 가입
	int memberDelete(MemberVO vo); //회원 탈퇴
	int memberUpdate(MemberVO vo); //회원 정보수정.
	public void memberPasswordUpdate(@Param ("email") String email, @Param ("password") String password); //회원 비밀번호 수정.
	
	int memberApplySeller(MemberVO vo); //판매자격신청
	MemberVO memberLogin(@Param ("id") String id, @Param ("password") String password); //로그인
	boolean isMemberIdCheck(String id); //아이디 중복 체크
	public String sendMail(String toId, String subject, String content); //이메일발송
	
	
}
