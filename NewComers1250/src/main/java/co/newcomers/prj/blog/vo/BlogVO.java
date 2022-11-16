package co.newcomers.prj.blog.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BlogVO {
	private String blogCode;
	private String blogContent;
	private String blogImage;
	private String blogWriter;
	private int blogLike;
	private String blogDate;
	private String memberId;
}
