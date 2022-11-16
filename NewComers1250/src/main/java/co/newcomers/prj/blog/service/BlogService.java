package co.newcomers.prj.blog.service;

import java.util.List;

import co.newcomers.prj.blog.vo.BlogVO;

public interface BlogService {
	List<BlogVO> blogSelectList(String id); // 블로그 목록 가져오기
	int blogInsert(BlogVO vo); // 글 등록
	int blogDelete(BlogVO vo); // 글 삭제
	int blogUpdate(BlogVO vo); // 글 수정
	int likeUpdate(BlogVO vo); // 좋아요 추가
	
	List<BlogVO> likeSelect(String id); // 좋아요 조회
	int likeInsert(BlogVO vo); // 좋아요테이블 등록
	int likeDelete(BlogVO vo); // 좋아요테이블 삭제
}