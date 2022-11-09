package co.newcomers.prj.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private String itemCode;
	private String itemName;
	private int itemPrice;
	private int itemCount;
	private String itemImage;
}
