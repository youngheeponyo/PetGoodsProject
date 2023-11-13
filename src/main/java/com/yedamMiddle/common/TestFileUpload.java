package com.yedamMiddle.common;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class TestFileUpload implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		// 배포경로에만 저장이됨. 가져올때도 배포경로에서 가져오니 상관은없응
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
                    String fileName = new File(item.getName()).getName();
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
            
        }
	}

}
