package com.yedamMiddle.cart.service;

import com.yedamMiddle.common.service.CartJoinVO;

public interface MyCartService {
	public boolean addCart(MyCartVO vo);
	public CartJoinVO myCartList(int memberNo);
}
