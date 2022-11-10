package co.newcomers.prj.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private String cartCode;
	private String memberId;
	private String itemCode;
	private String itemTitle;
	private int itemPrice;
	private int itemCount;
	private String itemImage;
}
