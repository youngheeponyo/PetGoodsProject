package com.yedamMiddle.common;

import java.io.IOException;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.admin.web.AddProductControl;
import com.yedamMiddle.admin.web.ProductFormControl;
import com.yedamMiddle.admin.web.ProductListControl;
import com.yedamMiddle.admin.web.adminPageControl;
import com.yedamMiddle.admin.web.memberListControl;
import com.yedamMiddle.cart.web.AddCartControl;
import com.yedamMiddle.cart.web.MyCartControl;
import com.yedamMiddle.login.web.AddUserControl;
import com.yedamMiddle.login.web.AddUserFormControl;
import com.yedamMiddle.login.web.DelUserControl;
import com.yedamMiddle.login.web.DelUserFormControl;
import com.yedamMiddle.login.web.LoginControl;
import com.yedamMiddle.login.web.LoginFormControl;
import com.yedamMiddle.login.web.LogoutControl;
import com.yedamMiddle.notice.web.AddNoticeControl;
import com.yedamMiddle.notice.web.GetNoticeControl;
import com.yedamMiddle.notice.web.NoticeFormControl;
import com.yedamMiddle.notice.web.NoticeListControl;
import com.yedamMiddle.notice.web.removeNoticeControl;
import com.yedamMiddle.product.web.CategorySearchControl;
import com.yedamMiddle.product.web.PaymentCompleteControl;
import com.yedamMiddle.product.web.PaymentFormControl;
import com.yedamMiddle.product.web.ProductDetailControl;
import com.yedamMiddle.product.web.ProductSearchControl;
import com.yedamMiddle.userQna.web.AddQnaControl;
import com.yedamMiddle.userQna.web.AddQnaFormControl;
import com.yedamMiddle.userQna.web.GetQnaAllListControl;
import com.yedamMiddle.userQna.web.GetQnaListControl;
import com.yedamMiddle.userQna.web.ModifyUserQnaControl;
import com.yedamMiddle.userQna.web.ModifyUserQnaFormControl;
import com.yedamMiddle.userQna.web.QnaReplyControl;

// 0 -> 개 type
// 1 -> 고양이 type
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Command> commandByURL = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		// map에 command추가할 때 옆에 기능 주석적어주세요.
		
		// 김은별
		commandByURL.put("/getUserQnaAllList.do", new GetQnaAllListControl());//목록
		commandByURL.put("/getUserQnaList.do", new GetQnaListControl()); //조회
		commandByURL.put("/qnaReply.do", new QnaReplyControl());//관리자 답글달기
		
		commandByURL.put("/addUserQnaForm.do", new AddQnaFormControl());
//		commandByURL.put("/addUserQna.do", new AddQnaControl());//등록	
		commandByURL.put("/modifyUserQnaForm.do", new ModifyUserQnaFormControl());
		commandByURL.put("/modifyUserQna.do", new ModifyUserQnaControl());
		
//		commandByURL.put("/deleteUserQna.do", new DeleteUserQnaControl());
//		commandByURL.put("/modifyAdminQna.do", new ModifyAdminQnaControl());
		// 김준성
		//공지사항 게시판
		commandByURL.put("/noticeList.do", new NoticeListControl());
		commandByURL.put("/noticeForm.do", new NoticeFormControl());
		commandByURL.put("/getNotice.do", new GetNoticeControl());
		commandByURL.put("/addNotice.do", new AddNoticeControl());
		commandByURL.put("/removeNotice.do", new removeNoticeControl());
		
		//관리자페이지
		commandByURL.put("/adminPage.do", new adminPageControl());
		//회원목록
		commandByURL.put("/memberList.do", new memberListControl());
		//상품
		commandByURL.put("/productList.do", new ProductListControl());
		commandByURL.put("/productForm.do", new ProductFormControl());
		//상품추가 작업중!
		commandByURL.put("/addProduct.do", new AddProductControl());
		
		
		// 서영희
		//회원가입
		commandByURL.put("/addUserForm.do", new AddUserFormControl());
		commandByURL.put("/addUser.do", new AddUserControl());
		//로그인
		commandByURL.put("/loginForm.do", new LoginFormControl());
		commandByURL.put("/login.do", new LoginControl());
		//로그아웃
		commandByURL.put("/logout.do", new LogoutControl());
		//회원탈퇴
		commandByURL.put("/delUserForm.do", new DelUserFormControl());
		commandByURL.put("/delUser.do", new DelUserControl());
		//상세페이지 보기
		commandByURL.put("/detailProduct.do", new ProductDetailControl());
		//장바구니 추가
		commandByURL.put("/addCart.do", new AddCartControl());
		//장바구니
		commandByURL.put("/myCart.do", new MyCartControl());
		
		// 전민교
		commandByURL.put("/main.do", new MainPageControl()); // 메인페이지
		commandByURL.put("/productSearch.do", new ProductSearchControl()); // 상품검색(헤더 검색바)
		commandByURL.put("/categorySearch.do", new CategorySearchControl()); // 카테고리검색(카테고리바)
		commandByURL.put("/fileUploadTestForm.do", new TestUploadFormControl()); // 테스트 파일업로드
		commandByURL.put("/fileUpload.do", new TestFileUpload());
		
		commandByURL.put("/changePetType.do", new ChangePetControl()); // 고양이/강아지 상품 전환
		commandByURL.put("/testCartForm.do", new TestCartFormControl()); // 결제창 구현을 위한 테스트화면
		commandByURL.put("/paymentForm.do", new PaymentFormControl());
		commandByURL.put("/paymentComplete.do", new PaymentCompleteControl());
	}
	
	//끼양
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String reqURL = uri.substring(contextPath.length());
		Command cmd = commandByURL.get(reqURL);
		if(cmd != null) {
			cmd.execute(req, resp);
		}
		else {
			// 에러
			System.out.println("없음");
		}
	}
}
