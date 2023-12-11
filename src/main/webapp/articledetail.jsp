<%@page import="Model.bean.Article"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Article Details</title>
    <!-- Add your styles or link to an external stylesheet here -->
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

        .article-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            width: 100%;
            box-sizing: border-box;
        }

        h1 {
            color: #333;
        }

        p {
            color: #666;
        }

        .meta-info {
            margin-top: 10px;
            color: #888;
        }
    </style>
</head>
<body>
<% Article article = (Article) request.getAttribute("article"); %>
    <div class="article-container">
        Tiêu đề: <h1><%=article.getTitle() %></h1>
        Nội dung:<p><%=article.getContent() %></p>
        <div class="meta-info">
            <p>Người đăng: <%=article.getWriter() %></p>
            <p>Thời gian đăng: <%=article.getDateString() %></p>
        </div>
    </div>
</body>
</html>
