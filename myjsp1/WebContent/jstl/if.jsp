<%@page import="vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 태그라이브러리 등록 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
	session scope에 "login_customer" 이름으로 Customer 객체를 속성으로 등록
	
 --%>
 <c:set scope="session" var="login_customer" value='<%= new Customer("이회원","lee@lee.net",24,70.1,false) %>'/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- 로그인한 고객의 나이가 19세 이상이면 성인용품 메뉴를 보여준다. -->
메뉴 :
<c:choose>
	<c:when test="${empty sessionScope.login_customer }">
		로그인 회원가입
	</c:when>
	<c:otherwise>
		로그아웃 마이페이지 고객센터
		<c:if test="${sessionScope.login_customer.age >=19 }">
			성인용품
		</c:if>
	</c:otherwise>
</c:choose>
</body>
</html>