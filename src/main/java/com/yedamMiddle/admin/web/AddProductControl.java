package com.yedamMiddle.admin.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.yedamMiddle.admin.service.AdminService;
import com.yedamMiddle.admin.serviceImpl.AdminServiceImpl;
import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductVO;

public class AddProductControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ProductVO vo = new ProductVO();
		AdminService svc = new AdminServiceImpl();
		List<String> data = new ArrayList<>();;
		
        
        try {
            List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
            String petType = "";
            for(FileItem item : items) {
            	if(item.getFieldName().equals("petType")) {
            		petType = item.getString("utf-8");
            	}
            }
            
            System.out.println("펫타입 : " + petType);
            
            int idx = 0;
            String typePath = "";
            if(petType.equals("0")) {
            	typePath = "\\dog";
            }else if(petType.equals("1")){
            	typePath = "\\cat";
            }
            String saveDeployDir1 = req.getServletContext().getRealPath("productImage");
            String saveDeployDir2 = req.getServletContext().getRealPath("productDetailImage");
            String uploadPath1 = saveDeployDir1 + typePath;
            String uploadPath2 = saveDeployDir2 + typePath;
            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html; charset=utf-8");
            
            System.out.println("path1 : " + uploadPath1);
            System.out.println("path2 : " + uploadPath2);
            
            File uploadDir1 = new File(uploadPath1);
            File uploadDir2 = new File(uploadPath2);
            
            if (!uploadDir1.exists()) {
            	uploadDir1.mkdirs();
            }
            
            if (!uploadDir2.exists()) {
            	uploadDir2.mkdirs();
            }
            
            for (FileItem item : items) {
            	if(!item.isFormField()) { // 폼 필드가 아닌경우에만 처리.
                    String fileName = data.get(2) + ".png";
                    String filePath;
                    
                    // 첫번쨰 item은 상품이미지 
                    // 두번째 item은 상세이미지
                    if(idx == 0) {
                    	filePath = uploadPath1 + File.separator + fileName;
                    }
                    else {
                    	filePath = uploadPath2 + File.separator + fileName;
                    }

                    idx++;
                    File storeFile = new File(filePath);
                    if(!storeFile.exists()) {
                    	item.write(storeFile);                    	
                    }
                    else {
                    	System.out.println("파일충돌");
//            			out.println("<script> alert('이미 존재하는 파일입니다.');");
//            			out.println(" </script>"); 
            			
            			try {
            				resp.sendRedirect("productForm.do");
            			} catch (IOException e) {
            				e.printStackTrace();
            			}
            			return;
                    }
                }
            	else {
            		System.out.printf("파라미터명 : %s, 파라미터값 : %s \n",item.getFieldName(), item.getString("utf-8"));
            		data.add(item.getString("utf-8"));
            	}
            }
            
            // 여기선 내가 처리해야할 데이터들이 모두모임.
            // 실제처리하기전에 이미 db에 데이터가 있는지 조회한번때리고. 그런다음 삽입처리
            
            System.out.println(data);
            
            vo.setPetType(data.get(0));
            vo.setCategoryNo(Integer.parseInt(data.get(1)));
            vo.setProductName(data.get(2));
            vo.setProductPrice(Integer.parseInt(data.get(3)));
            vo.setProductStock(Integer.parseInt(data.get(4)));
            vo.setProductDesc(data.get(5));
            vo.setProductImage(data.get(2)+".png");
            
            if(svc.addProduct(vo)) {
            	try {
            		resp.sendRedirect("productList.do");
            	} catch (IOException e) {
            		e.printStackTrace();
            	}
//            	out.println("<script> alert('등록성공 ㅎ.');");
//    			out.println(" </script>"); 
    			
            }else {
            	try {
            		resp.sendRedirect("productForm.do");
            	} catch (IOException e) {
            		e.printStackTrace();
            	}
            }
            out.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        
        
	}

}
