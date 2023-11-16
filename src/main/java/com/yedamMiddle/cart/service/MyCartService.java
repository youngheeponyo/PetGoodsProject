package com.yedamMiddle.cart.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.common.service.CartJoinVO;

public interface MyCartService {
	public boolean addCart(MyCartVO vo);
	public boolean insertCart(MyCartVO vo);
	public List<CartJoinVO> getCart(int memberNo);
	public boolean delCart(int productNo,int memberNo);
	public boolean delCartFromPayment(int uno, int[] productNos);
	public List<CartJoinVO> getCartFromPayment(int uno, int[] productNos);
}
