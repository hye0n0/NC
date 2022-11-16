package co.newcomers.prj.detailorder.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.newcomers.prj.detailorder.vo.DetailOrderVO;

public interface DetailOrderMapper {
	//매개변수값 세션으로 들어오는 id
	List<DetailOrderVO> myShipping(String id); //배송완료를 제외한 목록을 띄우기 위한애..
	List<DetailOrderVO> myEndShipping(String id); //배송완료를 한 목록 띄우기 위한애..
	int Shipconfirm(@Param("id")String id, @Param("itemname")String itemname);	
}
