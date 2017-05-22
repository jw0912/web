<%@page import="java.util.HashMap"%>
<%@page import="vo.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setAttribute("names", new String[] { "김영수", "홍길동", "최영희", "박영철" });

	ArrayList<Customer> customerList = new ArrayList<>();
	customerList.add(new Customer("이고객", "lee@nace.rcom", 30, 53.1, true));
	customerList.add(new Customer("삼고객", "lee@1nace.rcom", 31, 54.2, false));
	customerList.add(new Customer("사고객", "lee@2nace.rcom", 32, 55.3, true));

	request.setAttribute("list", customerList);

	HashMap map = new HashMap();
	map.put("pId", "p-111");
	map.put("product name", "노트북");
	map.put("price", 3000000);
	map.put("cust", new Customer("최고객", "choi@a.com", 31, 63.5, true));

	session.setAttribute("info", map);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<select>
		<c:forEach items="${requestScope.names }" var="name">
			<option>${name}</option>
		</c:forEach>
	</select>
<h1>고객정보</h1>
<table border="1">
	<thead>
		<tr>
			<td>이름</td>
			<td>이메일</td>
			<td>나이</td>
			<td>몸무게</td>
			<td>결혼여부</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.list }" var="customer">
		<tr>
			<td>${customer.name }</td>
			<td>${customer.email }</td>
			<td>${customer.age }</td>
			<td>${customer.weight }</td>
			<td>${customer.marriage?"기혼" : "미혼" }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
<h1>forEach를 이용해 Map 전체 조회</h1>
<c:forEach items="${sessionScope.info }" var="info">
	<%-- info - Entry --%>
	<c:choose>
		<c:when test="${info.key=='cust'}">
		<ul>
			<li>${info.value.name }</li>
			<li>${info.value.email }</li>
			<li>${info.value.age }</li>
		</ul>
		Key : ${info.key } - Value : ${info.value }<br>
		</c:when>
	</c:choose>
</c:forEach>

<h2>forEach를 이용한 단순 반복</h2>
<!-- 
	begin : 시작 숫자
	end : 종료 숫자
	step : 증가 숫자 (생략 시 기본 값 1)
	
	begin, end, step은 음수가 올 수 없다.
 -->
<ol>
<c:forEach begin="1" end="10" step="2" var="no">
	<li>안녕 - ${no }</li><br>
</c:forEach>
</ol>
</body>
</html>





