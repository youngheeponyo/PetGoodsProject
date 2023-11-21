package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.coupon.service.CouponService;
import com.yedamMiddle.coupon.serviceImpl.CouponServiceImpl;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.service.Pwsha256;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class LoginControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uid = req.getParameter("userId");
		String upw = req.getParameter("userPw");
		String encryPassword = Pwsha256.encrypt(upw);
		System.out.println(encryPassword);
		
		LoginService svc = new LoginServiceImpl();
		UserVO vo = svc.loginUser(uid, encryPassword);
		
		if(svc.loginUser(uid, encryPassword)!=null) {
			HttpSession session = req.getSession();
			session.setAttribute("uno", vo.getUserNo());	//로그인한 회원번호 기억 후 사용
			session.setAttribute("uid", vo.getUserId());
			session.setAttribute("permission", vo.getUserPermission());	//사용자 계정으로 로그인했는지 구분하기 위함
			session.setAttribute("nickName", vo.getNickName());	//현재 사용자가 누구인지 구문
			try {
				//로그인 시 날짜가 지난 쿠폰 만료적용
				CouponService csv = new CouponServiceImpl();
				csv.userExpireCouponUpdate();
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				resp.sendRedirect("loginForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
