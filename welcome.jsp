<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="myClasses.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First JSP</title>
<style>
	.bold_cls {font-weight:bold;}
</style>
</head>
<body>
	<% String curStringDate = new SimpleDateFormat("dd.MM.yyyy").format(new Date()); %>
	<h1>Список пользователей на <%= curStringDate %>:</h1>
	<ul>
		<% 
			List<User> users = new ArrayList<User>();
		
			users.add(new User("Иванов Иван", "ivanov@gmail.com"));
			users.add(new User("Петров Петр", "petrov@gmail.com"));
			users.add(new User("Сидоров Иван", "sidorov@gmail.com"));
			users.add(new User("Лукашенко Иван", "luka@gmail.com"));
			users.add(new User("Путин Иван", "put-in@gmail.com"));
			users.add(new User("Медведев Иван", "medved@gmail.com"));
			users.add(new User("Обама Иван", "monkey@gmail.com"));
		
			String cls = "";
			for (int i = 0; i < users.size(); i++) 
			{
				if (i>=4) cls = "bold_cls"; %>
				
				<li class="<%=cls%>">
					<% if (i>=2) { %>
								<a href="mailto:<%=users.get(i).email%>">
									<%=users.get(i).email%>
								</a>(<%=users.get(i).username%>);
								
								<% if (i==3) { %>
									<br/>Половина!
								<% } %>
					<% } else { %>
						<%=users.get(i).username %> (<a href="mailto:<%=users.get(i).email %>"><%=users.get(i).email %></a>)
					<% } %>
				</li>
		<% } %>
	</ul>
</body>
</html>