package com.yedamMiddle.cart.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.common.service.CartJoinVO;

public interface MyCartMapper {
	public List<CartJoinVO> getCart(int memberNo);
	public int insert(MyCartVO vo);
	public int deleteCart(@Param("productNo") int productNo, @Param("memberNo")int memberNo);
	public int updateCart(MyCartVO vo);
}
