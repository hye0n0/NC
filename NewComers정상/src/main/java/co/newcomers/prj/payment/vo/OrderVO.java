package co.newcomers.prj.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO {
	private String orderCode;
	private String orderId;
	private int orderTotal;
	private String itemCode;
	private int itemCount;
}
