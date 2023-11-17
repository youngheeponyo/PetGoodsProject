package com.yedamMiddle.cart.service;

import java.util.List;


import com.yedamMiddle.common.service.CartJoinVO;

public interface MyCartService {
	public boolean addCart(MyCartVO vo);
	public boolean update(int selectCnt,int productNo,int memberNo);
	public boolean insertCart(MyCartVO vo);
	public List<CartJoinVO> getCart(int memberNo);
	public boolean delCart(int productNo,int memberNo);
	public boolean delCartFromPayment(int uno, int[] productNos);
	public List<CartJoinVO> getCartFromPayment(int uno, int[] productNos);
	public MyCartVO cartCheck(int productNo,int memberNo);
}
