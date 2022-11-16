package co.newcomers.prj.itemlist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.newcomers.prj.itemlist.vo.ItemVO;

public interface ItemMapper {
	List<ItemVO> itemSelectList(String order);  
	List<ItemVO> categorySelectList(String itemCategory); 
	List<ItemVO> itemPriceSelectList(@Param("minPrice") int minPrice, 
			@Param("maxPrice") int maxPrice);	
	List<ItemVO> itemSearchList(String itemSearch);
	ItemVO itemSelect(ItemVO vo);
	ItemVO itemSearch(ItemVO vo);
	int itemInsert(ItemVO vo);		
	int itemDelete(ItemVO vo);		
	int itemUpdate(ItemVO vo);
	
	List<ItemVO> itemSearchCount(@Param("order") String order, @Param("num") int num);
}
