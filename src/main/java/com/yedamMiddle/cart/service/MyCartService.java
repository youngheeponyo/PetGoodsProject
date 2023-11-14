package com.yedamMiddle.cart.service;


public interface MyCartService {
	public boolean addCart(MyCartVO vo);
	public MyCartVO myCartList(int memberNo);
}
