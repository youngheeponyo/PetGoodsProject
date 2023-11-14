package com.yedamMiddle.cart.mapper;



import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.common.service.CartJoinVO;

public interface MyCartMapper {
	public CartJoinVO myCartList(int memberNo);
	public int insert(MyCartVO vo);
	
}
