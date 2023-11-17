package com.yedamMiddle.cart.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.common.service.CartJoinVO;

public interface MyCartMapper {
	public List<CartJoinVO> getCart(int memberNo);
	//장바구니 추가
	public int insert(MyCartVO vo);
	public int update(@Param("selectCnt") int selectCnt,@Param("productNo") int productNo, @Param("memberNo")int memberNo);
	public MyCartVO cartCheck(@Param("productNo") int productNo, @Param("memberNo")int memberNo);
	public int insertCart(MyCartVO vo);
	public int deleteCart(@Param("productNo") int productNo, @Param("memberNo")int memberNo);
	//public int deleteCart(int[] productNos,int memberNo);
	public int deleteCartFromPayment(@Param("uno") int uno, @Param("array") int[] productNos);
	public List<CartJoinVO> getCartFromPayment(@Param("uno") int uno, @Param("array") int[] productNos);
}
