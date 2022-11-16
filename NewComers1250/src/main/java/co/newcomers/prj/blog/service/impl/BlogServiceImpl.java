package co.newcomers.prj.blog.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.newcomers.prj.blog.mapper.BlogMapper;
import co.newcomers.prj.blog.service.BlogService;
import co.newcomers.prj.blog.vo.BlogVO;
import co.newcomers.prj.common.DataSource;

public class BlogServiceImpl implements BlogService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	BlogMapper map = sqlSession.getMapper(BlogMapper.class);
	@Override
	public List<BlogVO> blogSelectList(String id) {

		return map.blogSelectList(id);
	}

	@Override
	public int blogInsert(BlogVO vo) {

		return map.blogInsert(vo);
	}

	@Override
	public int blogDelete(BlogVO vo) {

		return map.blogDelete(vo);
	}

	@Override
	public int blogUpdate(BlogVO vo) {

		return map.blogUpdate(vo);
	}

	@Override
	public int likeUpdate(BlogVO vo) {

		return map.likeUpdate(vo);
	}

	@Override
	public List<BlogVO> likeSelect(String id) {

		return map.likeSelect(id);
	}

	@Override
	public int likeInsert(BlogVO vo) {

		return map.likeInsert(vo);
	}

	@Override
	public int likeDelete(BlogVO vo) {

		return map.likeDelete(vo);
	}

}
