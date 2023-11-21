package com.yedamMiddle.userQna.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.PageDTO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.product.service.ProductOrderJoinVO;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;
import com.yedamMiddle.userQna.service.UserQnaService;
import com.yedamMiddle.userQna.service.UserQnaVO;
import com.yedamMiddle.userQna.serviceImpl.UserQnaServiceImpl;

public class GetQnaAllListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "userQna/userQnaAllList.tiles";
		
		UserQnaService svc = new UserQnaServiceImpl();
		List<UserQnaVO> list = svc.userQnaAllList();
		req.setAttribute("list", list);
//		System.out.println(list);
		
		
		//페이징 정보 받은거
//		ProductService pSvc = new ProductServiceImpl();
//		String page = req.getParameter("page");
//		if(page == null)
//			page = "1";
//		int pageNo = Integer.parseInt(page);
//		
//		Object obj = req.getSession().getAttribute("uno");
//		int userNo = (Integer)obj;
//		List<ProductOrderJoinVO> orderList = pSvc.getAllMyProductOrderList(userNo);
//		int startIdx = (pageNo - 1) * 10;
//		int endIdx = (pageNo) * 10;
//		
//		List<ProductOrderJoinVO> showList = new ArrayList<>(10);
//		for(int sIdx = startIdx; sIdx < endIdx; ++sIdx) {
//			if(sIdx >= orderList.size())
//				break;
//			
//			showList.add(orderList.get(sIdx));
//		}
//		PageDTO paging = new PageDTO(0,orderList.size(),pageNo, 10);
//		req.setAttribute("pagination", paging);
//		req.setAttribute("pOrderList", showList);
		//여기까지	
		
		
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
