<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

    <h1>Add New Post</h1>
    <form action="addpost.jsp" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>Title:</td>
                <td><input type="text" name="title"/></td>
            </tr>
            <tr>
                <td>Writer:</td>
                <td><input type="text" name="writer"/></td>
            </tr>
            <tr>
                <td>Category :</td>
                <td>
                    <select name="category">
                        <option value="일상">일상</option>
                        <option value="학업/질문">학업/질문</option>
                        <option value="취미/여행">취미/여행</option>
                        <option value="홍보/광고">홍보/광고</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Content:</td>
                <td><textarea cols="50" rows="5" name="content"></textarea></td>
                <td>
<%--                    <form method="post" enctype="multipart/form-data">--%>
                        <input type="file" name="photo">
<%--                    </form>--%>
                </td>
            </tr>
            <tr>
                <td><a href="posts.jsp">View All Records</a></td>
                <td align="right"><input type="submit" value="Add Post"/></td>
            </tr>
        </table>
    </form>

</body>
</html>