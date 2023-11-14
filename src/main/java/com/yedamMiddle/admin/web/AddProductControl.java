package com.yedamMiddle.admin.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
		
		vo.setPetType(req.getParameter("pet"));
		vo.setCategoryNo(Integer.parseInt(req.getParameter("category")));
		vo.setProductName(req.getParameter("prodname"));
		vo.setProductPrice(Integer.parseInt(req.getParameter("price")));
		vo.setProductStock(Integer.parseInt(req.getParameter("stock")));
		vo.setProductDesc(req.getParameter("desc"));
		vo.setProductImage(req.getParameter("filename"));
		
		int ctno = vo.getCategoryNo();
		int prpr = vo.getProductPrice();
		int prst = vo.getProductStock();
		System.out.println("ctno : " + ctno);
		System.out.println("prpr : " + prpr);
		System.out.println("prst : " + prst);
		
		String saveDeployDir = req.getServletContext().getRealPath("productImage");
		String uploadPath1 = saveDeployDir + "/dog";
        String uploadPath2 = saveDeployDir + "/dog/detail";
        
        File uploadDir1 = new File(uploadPath1);
        File uploadDir2 = new File(uploadPath2);
        
        if (!uploadDir1.exists()) {
            uploadDir1.mkdirs();
        }

        if (!uploadDir2.exists()) {
            uploadDir2.mkdirs();
        }
        
        try {
            List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
            int idx = 0;
            for (FileItem item : items) {
            	if(!item.isFormField()) { // 폼 필드가 아닌경우에만 처리.
                    String fileName = vo.getProductName();//new File(item.getName()).getName();
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
                    item.write(storeFile);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        if(svc.addProduct(vo)) {
        	try {
				resp.sendRedirect("productList.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
        }else {
        	try {
				resp.sendRedirect("productForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
        	
        }
	
        
	}

}
