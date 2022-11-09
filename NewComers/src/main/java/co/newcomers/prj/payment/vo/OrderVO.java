package co.newcomers.prj.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO {
	private String orderCode;
	private int orderPrice;
	private int itemPrice;
	private int itemCount;
	private String orderDate;
	private String orderState;	
	private String itemImage;
}
