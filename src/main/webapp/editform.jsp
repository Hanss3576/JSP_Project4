<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
</head>
<body>

    <%
        BoardDAO boardDAO = new BoardDAO();
        String id = request.getParameter("id");
        BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
    %>

    <h1>Edit Form</h1>
    <form action="editpost.jsp" method="post">
        <input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
        <table>
            <tr>
                <td>Title:</td>
                <td><input type="text" name="title" value="<%= u.getTitle()%>"/></td>
            </tr>
            <tr>
                <td>Category :</td>
                <td>
                    <select name="category">
                        <option value="일상"
                                <%
                                    if (u.getCategory().equals("일상")) {
                                        out.print("selected");
                                    }
                                %>
                        >일상
                        </option>
                        <option value="학업/질문"
                                <%
                                    if (u.getCategory().equals("학업/질문")) {
                                        out.print("selected");
                                    }
                                %>
                        >학업/질문
                        </option>
                        <option value="취미/여행"
                                <%
                                    if (u.getCategory().equals("취미/여행")) {
                                        out.print("selected");
                                    }
                                %>
                        >취미/여행
                        </option>
                        <option value="홍보/광고"
                                <%
                                    if (u.getCategory().equals("홍보/광고")) {
                                        out.print("selected");
                                    }
                                %>
                        >홍보/광고
                        </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Writer:</td>
                <td><input type="text" name="writer" value="<%= u.getWriter()%>"/></td>
            </tr>
            <tr>
                <td>Content:</td>
                <td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Edit Post"/>
                    <input type="button" value="Cancel" onclick="history.back()"/></td>
            </tr>
        </table>
    </form>

</body>
</html>