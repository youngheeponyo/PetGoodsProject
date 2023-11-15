package com.yedamMiddle.cart.service;

import java.util.List;

import com.yedamMiddle.common.service.CartJoinVO;

public interface MyCartService {
	public boolean addCart(MyCartVO vo);
	public List<CartJoinVO> getCart(int memberNo);
	public boolean delCart(int[] productNos,int memberNo);
	public boolean modCart(int productNo,int memberNo);
}
