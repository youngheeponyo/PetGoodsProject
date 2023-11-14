package com.yedamMiddle.cart.mapper;



import com.yedamMiddle.cart.service.MyCartVO;

public interface MyCartMapper {
	public MyCartVO myCartList(int memberNo);
	public int insert(MyCartVO vo);
	
}
