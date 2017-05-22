<%@page import="vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Customer customer = new Customer("박영희","a@naver.com",24,50.5,false);
	request.setAttribute("customer",customer);
	
	Customer cust = new Customer("신정보","new@new.com",33,77.7,false);
	session.setAttribute("customer",cust);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- getAttribute("customer").getName() --%>
이름 : ${requestScope.customer.name }<br>
이메일 : ${requestScope.customer.email }<br>
나이 : ${requestScope.customer.age }<br>
몸무게 : ${requestScope.customer.weight }<br>
결혼여부 : ${requestScope.customer.marriage ?"기혼":"미혼" }<br><!-- getAttribute("customer").isMarriage() -->
<p>
${customer } <!-- getAttribute("customer") -->
<br>
${sessionScope.customer }
${result } <!-- getAttribute("result") 출력할 내용이 null일 경우 출력을 하지 않는다.
			출력대상을 찾아가는 도중 null이 나온경우 연산을 멈추고 아무것도 출력하지 않는다. 
				-->
</p>
<h1>session scope에서 조회한 고객 정보</h1>
이름 : ${sessionScope.customer.name }<br>
이메일 : ${sessionScope.customer.email }<br>
나이 : ${sessionScope.customer.age }<br>
몸무게 : ${sessionScope.customer.weight }<br>
결혼여부 : ${sessionScope.customer.marriage ?"기혼":"미혼" }
</body>
</html>