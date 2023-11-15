package com.yedamMiddle.cart.mapper;



import java.util.List;

import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.common.service.CartJoinVO;

public interface MyCartMapper {
	public List<CartJoinVO> getCart(int memberNo);
	public int insert(MyCartVO vo);
	public int deleteCart(int[] productNos,int memberNo);
	public int updateCart(int productNo,int memberNo);
}
