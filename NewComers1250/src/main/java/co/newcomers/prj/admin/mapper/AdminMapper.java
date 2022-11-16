package co.newcomers.prj.admin.mapper;

import java.util.List;

import co.newcomers.prj.admin.vo.AdminVO;
import co.newcomers.prj.member.vo.MemberVO;

public interface AdminMapper {
	List<MemberVO> memberList(); // 모든회원목록
	List<AdminVO> showUpdateList(); // 권한 신청한 목록
	int updateResposibility(String id); // 권한신청승인 기능
	int deleteResposibility(String id); // 승인후 행 삭제를 위한 테이블내용 삭제.
}
