package com.yedamMiddle.myPage.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.PageDTO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;
import com.yedamMiddle.product.service.ProductOrderJoinVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class OrderDetailFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		Object obj = req.getSession().getAttribute("uno");
		if(obj == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int userNo = (Integer)obj;
		LoginService svc = new LoginServiceImpl();
		UserVO userInfo = svc.getUserInfo(userNo);
		if(userInfo == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String page = req.getParameter("page");
		if(page == null)
			page = "1";
		int pageNo = Integer.parseInt(page);
		
		ProductService pSvc = new ProductServiceImpl();
		List<ProductOrderJoinVO> orderList = pSvc.getAllMyProductOrderList(userNo);

		int startIdx = (pageNo - 1) * 10;
		int endIdx = (pageNo) * 10;
		
		List<ProductOrderJoinVO> showList = new ArrayList<>(10);
		for(int sIdx = startIdx; sIdx < endIdx; ++sIdx) {
			if(sIdx >= orderList.size())
				break;
			
			showList.add(orderList.get(sIdx));
		}
		
		PageDTO paging = new PageDTO(0,orderList.size(),pageNo, 10);
		req.setAttribute("pagination", paging);
		req.setAttribute("pOrderList", showList);
		try {
			req.getRequestDispatcher("myPage/orderDetail.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
