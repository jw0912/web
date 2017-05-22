<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쿠키값 출력</h2>
${cookie.currentTime.value } <!-- 쿠키값 EL : cookie.쿠키이름.value -->



<h2>요청파라미터 출력</h2>
age : ${param.age } <!-- request.getParameter("age") 출력 -->
<br>
취미 : ${paramValues.hobby } <!-- request.getParameterValues("hobby") : String[] -->
<br>
${paramValues.hobby[0] } - ${paramValues.hobby[1] } - ${paramValues.hobby[2] }

	<c:forEach items="${paramValues.hobby }" var="hobby">
	<option>${hobby}</option>
	</c:forEach>
</body>
</html>