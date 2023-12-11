<%@page import="Model.bean.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Article</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 400px;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="text"],
        input[type="date"],
        input[type="submit"] {
            display: block;
            margin-bottom: 15px;
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <% 
        String username = (String) session.getAttribute("username");
        if (username == null)
            response.sendRedirect("Login.jsp");
        else {
            Article article = (Article) request.getAttribute("article");
    %>
            <form action="editarticle" method="POST">
                ID<input type="text" name="id" value="<%=article.getId()%>" readonly="readonly">
                Tiêu đề<input type="text" name="title" value="<%=article.getTitle()%>">
                Ngày<input type="date" name="date" value="<%=article.getDateString()%>" readonly="readonly"> 
                Nội dung<input type="text" name="content" value="<%=article.getContent()%>">
                Người viết<input type="text" name="writer" value="<%=article.getWriter()%>" readonly="readonly">
                <input type="submit" value="OK">
            </form>
    <%
        }
    %>
</body>
</html>
