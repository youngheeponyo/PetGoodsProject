package com.yedamMiddle.common;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.admin.mapper.AdminMapper;
import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.service.CategoryJoinVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.notice.mapper.NoticeMapper;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddle.product.serviceImpl.ProductServiceImpl;

public class MainExe {

	public static void main(String[] args) {
//		SqlSession sql = Mybatis.getInstance().openSession(true);
//		AdminMapper mapper = sql.getMapper(AdminMapper.class);
//		
//		NoticeMapper nomapper = sql.getMapper(NoticeMapper.class);
//		
//		List<UserVO> ulist = mapper.userList();
////		List<NoticeVO> list = nomapper.list();
//		List<ProductVO> list = mapper.prodList();
//		list.forEach(vo -> System.out.println(vo));
//		System.out.println("=====================");
//		ulist.forEach(vo -> System.out.println(vo));
		ProductService svc = new ProductServiceImpl();
		ProductVO vo = new ProductVO();
		AdminService asvc = new AdminServiceImpl();
		List<CategoryJoinVO> result = svc.getCategoryList();
		Map<Integer, List<CategoryJoinVO>> categoryMap = result.stream().collect(Collectors.groupingBy(CategoryJoinVO::getMainCateNo));
		
//		System.out.println(categoryMap);
//		System.out.println(categoryMap.values());
		vo.setPetType("0");
		vo.setCategoryNo(0);
		vo.setProductName("로얄캐닌 말티즈 어덜트 3kg 피모관리");
		vo.setProductPrice(50500);
		vo.setProductStock(5);
		vo.setProductDesc("=");
		vo.setProductImage("메인");
		if(asvc.addProduct(vo)) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		
		
	}// endmaim
}// end
