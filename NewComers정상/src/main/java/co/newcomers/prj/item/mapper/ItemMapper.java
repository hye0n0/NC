package co.newcomers.prj.item.mapper;

import java.util.List;

import co.newcomers.prj.item.vo.ItemDetailVO;
import co.newcomers.prj.item.vo.ItemVO;
import co.newcomers.prj.item.vo.ReviewVO;

public interface ItemMapper {
	ItemDetailVO itemSelect(String itemtitle);	
	int itemInsert(ItemVO vo);
	int itemDetailInsert(ItemDetailVO vo);
	String seqNum();
	
	
	List<ReviewVO> reviewSelect(String itemtitle);  
	int reviewInsert(ReviewVO vo);		

}
