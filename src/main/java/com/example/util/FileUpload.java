package com.example.util;

import com.example.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.example.bean.BoardVO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;


public class FileUpload {
    public BoardVO uploadPhoto(HttpServletRequest request) {
        String filename ="";
        int sizeLimit = 15 * 1024 * 1024;
        
//        실제로 서버에 저장되는 path를 upload

        String realPath = request.getServletContext().getRealPath("/upload");
        System.out.println("realPath : " + realPath);
        File dir = new File(realPath);
        BoardVO one = null;
        MultipartRequest multipartRequest = null;
        if (!dir.exists()) {
            dir.mkdirs();
        }
        try{
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("photo");

            one = new BoardVO();
            String id = multipartRequest.getParameter("id");
            if(id != null && !id.equals("")){
                one.setSeq(Integer.parseInt(id));
            }
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));
            one.setCategory(multipartRequest.getParameter("category"));
            if(id != null && !id.equals("")){ // 파일을 수정하는 경우
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(id));
                if(filename != null && oldfilename != null){
                    FileUpload.deleteFile(request, oldfilename);
                }
                else if(filename == null && oldfilename != null){
                    filename = oldfilename;
                }
            }
            one.setPhoto(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename){
        String realPath = request.getServletContext().getRealPath("/upload");
        File f = new File(realPath + "/" + filename);
        if(f.exists()){
            f.delete();
        }
    }

}
