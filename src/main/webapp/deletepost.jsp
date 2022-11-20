<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<%@ page import="com.example.util.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		BoardDAO dao = new BoardDAO();
		String filename = dao.getPhotoFilename(id);
		if (filename != null){
			FileUpload.deleteFile(request, filename);
		}
//		BoardVO u = new BoardVO();
//		u.setSeq(id);
//		BoardDAO boardDAO = new BoardDAO();
//		boardDAO.deleteBoard(u);
		dao.deleteBoard(id);
	}
	response.sendRedirect("posts.jsp");
%>