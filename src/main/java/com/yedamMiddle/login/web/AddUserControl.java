package com.yedamMiddle.login.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.coupon.service.CouponService;
import com.yedamMiddle.coupon.serviceImpl.CouponServiceImpl;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.service.Pwsha256;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class AddUserControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		UserVO vo = new UserVO();
		LoginService svc = new LoginServiceImpl();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String uid = req.getParameter("uid");
		String upw = req.getParameter("upw");
		String nick = req.getParameter("nick");
		String ubirth = req.getParameter("ubirth");
		String mail = req.getParameter("mail");
		String phone = req.getParameter("phone");
		String addr = req.getParameter("addr");
		String detailAddr = req.getParameter("addr_detail");

		String encryPassword = Pwsha256.encrypt(upw);
		
		vo.setUserId(uid);
		vo.setUserPw(encryPassword);
		vo.setNickName(nick);
		try {
			vo.setUserBirth(sdf.parse(ubirth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		vo.setUserMail(mail);
		vo.setUserPhone(phone);
		vo.setUserAddr(addr+" "+detailAddr);
		
		if(svc.addUser(vo)) {
				try {
					//회원가입 시 신규유저축하쿠폰 발급됨
					CouponService csv = new CouponServiceImpl();
					UserVO userVo =svc.loginUser(uid, encryPassword);
					int couponCheck = csv.newUserCouponInsert(userVo.getUserNo());
					if(couponCheck == 1) {
						System.out.println("쿠폰발급완료");
						resp.sendRedirect("loginForm.do");
					}

				} catch (IOException e) {
					e.printStackTrace();
				}
		}else {
			try {
				resp.sendRedirect("addUser.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

	}

}
