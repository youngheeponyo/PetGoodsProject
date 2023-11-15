package com.yedamMiddle.cart.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.common.service.CartJoinVO;

public interface MyCartMapper {
	public List<CartJoinVO> getCart(int memberNo);
	public int insert(MyCartVO vo);
	public int deleteCart(int[] productNos,int memberNo);
	public int updateCart(int productNo,int memberNo);
	public int deleteCartFromPayment(@Param("uno") int uno, @Param("array") int[] productNos);
	public List<CartJoinVO> getCartFromPayment(@Param("uno") int uno, @Param("array") int[] productNos);
}
