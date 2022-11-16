package co.newcomers.prj.item.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.newcomers.prj.blog.service.BlogService;
import co.newcomers.prj.blog.service.impl.BlogServiceImpl;
import co.newcomers.prj.blog.vo.BlogVO;
import co.newcomers.prj.common.Command;
import co.newcomers.prj.item.service.ItemService;
import co.newcomers.prj.item.service.impl.ItemServiceImpl;
import co.newcomers.prj.item.vo.ItemDetailVO;
import co.newcomers.prj.item.vo.ItemVO;

public class ItemRs implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 상품등록
		HttpSession session = request.getSession();
		ItemService dao = new ItemServiceImpl();
		ItemVO vo = new ItemVO();
		ItemDetailVO dvo = new ItemDetailVO();
		String id = (String) session.getAttribute("id");
		System.out.println("아이템등록에 들어갈 아이디" + id);
				
		
//소현씨꺼		
		String saveDir = request.getServletContext().getRealPath("upload/item");
		System.out.println(saveDir);
		String encod = "UTF-8";
		int maxSize = 5 * 1024 * 1024; // 5 메가 제한
		
		try {
			MultipartRequest mr = new MultipartRequest(
					request, // 요청정보
					saveDir, // 저장위치
					maxSize, // 파일크기
					encod, // 인코딩
					new DefaultFileRenamePolicy()
					);
			String ItemCategory = mr.getParameter("itemCategory");
			String ItemName = mr.getParameter("itemName");
			String ItemTitle = mr.getParameter("itemTitle");
			String ItemPrice = mr.getParameter("itemPrice");
			String ItemContent = mr.getParameter("itemContent");		
			
			vo.setItemName(ItemName);
			vo.setItemCategory(ItemCategory);
			vo.setItemPrice(Integer.parseInt(ItemPrice));
			vo.setItemId(id);
			
			String itemImage1 = mr.getFilesystemName("itemImage1");
			String itemImage2 = mr.getFilesystemName("itemImage2");
			String itemImage3 = mr.getFilesystemName("itemImage3");
			String itemImage4 = mr.getFilesystemName("itemImage4");
			
			dvo.setItemTitle(ItemTitle);
			dvo.setItemContent(ItemContent);
			dvo.setItemImage1(itemImage1);
			dvo.setItemImage2(itemImage2);
			dvo.setItemImage3(itemImage3);
			dvo.setItemImage4(itemImage4);
			
			System.out.println("여기까진되라");
			String seqnum = dao.seqNum();
			System.out.println("여기왔나요");
			dvo.setItemCode(seqnum);
			String a = dvo.getItemCode();
			System.out.println(a);
			dao.itemDetailInsert(dvo);
			int n = dao.itemInsert(vo);
			if(n > 0) {
				System.out.println("상품등록 완료!");
			}else {
				System.out.println("상품등록 실패");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return "item/itemRsForm.tiles";
	}
}
