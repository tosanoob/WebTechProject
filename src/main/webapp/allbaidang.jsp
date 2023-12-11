<%@page import="javax.swing.border.AbstractBorder"%>
<%@page import="controller.LoginController"%>
<%@page import="Model.bean.Article"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login successful</title>
	 <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        a {
            text-decoration: none;
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border-radius: 3px;
        }
        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

	<%
		List<Article> articles = (List<Article>) request.getAttribute("articles");
	%>
			<hr>
			<a href="addarticle.jsp">Thêm mới</a>
			<table>
				<thead>	<tr>
				<th>Id</th>
					<th>Title</th>
					<th>Date</th>
					<%String username = (String) session.getAttribute("username");
						if (username != null){
					%>
					<th></th>
					<th></th>
					<%} %>
				</tr> </thead>
				<tbody>
				<%
					for (Article tbu : articles) {
						%>
						<tr>
						<td><%=tbu.getId() %></td>
							<td><a href = "articledetail?id=<%=tbu.getId()%>&&mode=1"><%=tbu.getTitle()%></a></td>
							<td><%=tbu.getDate()%></td>
							<%
								if (username != null){
							%>
							<td><a href="articledetail?id=<%=tbu.getId()%>&&mode=2">Edit</a></td>
							<td><a href="articledetail?id=<%=tbu.getId()%>&&mode=3">Delete</a></td>
							<%} %>
						</tr>
						<%
					}
				%>
				</tbody>
			</table>

</body>
</html>