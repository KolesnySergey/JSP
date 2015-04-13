<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="myClasses.User" %>

<%
	List<User> users = new ArrayList<User>();

	users.add(new User("Иванов Иван", "ivanov@gmail.com"));
	users.add(new User("Петров Петр", "petrov@gmail.com"));
	users.add(new User("Сидоров Иван", "sidorov@gmail.com"));
	users.add(new User("Лукашенко Иван", "luka@gmail.com"));
	users.add(new User("Путин Иван", "put-in@gmail.com"));
	users.add(new User("Медведев Иван", "medved@gmail.com"));
	users.add(new User("Обама Иван", "monkey@gmail.com"));
	
	request.setAttribute("users", users);
%>

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
	<h1>
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<c:out value="Список пользователей на " /><fmt:formatDate type="date" value="${now}" pattern="dd.MM.YYYY"/>:
	</h1>
	
	<c:set var="cls" value="" />
	<ul>
		<c:forEach items="${requestScope.users}" var="user" varStatus="theCount">
			<c:if test="${theCount.index>=4}">
   				<c:set var="cls" value="bold_cls" />
   			</c:if>
   			<li class="<c:out value="${cls}" />">
   				<c:choose>
				    <c:when test="${theCount.index>=2}">
  						<a href='mailto:${user.getEmail()}'>${user.getEmail()}</a>
	   					(<c:out value="${user.getUsername()}"></c:out>)
	   					
						<c:if test="${theCount.index==3}">
							<br/>Половина!
						</c:if>
				    </c:when>
	   				<c:otherwise>
	   					<c:out value="${user.getUsername()}"></c:out>
	   					(<a href='mailto:${user.getEmail()}'>${user.getEmail()}</a>)
	   				</c:otherwise>
  				</c:choose>
   			</li>	
		</c:forEach>
	</ul>
</body>
</html>