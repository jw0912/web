<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope="session" var="message" value="안녕<br>Test<p>AAA"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
안녕하세요<b>Hello</b>
<p>
안녕하세요 &lt;b&gt:Hello&lt;/b&gt;
</p>
<h2>out태그를 이용해 HTML 특수문자 출력</h2>
<c:out value="안녕하세요<b>Hello</b>"/>
${sessionScope.message }<br>
<c:out value="${sessionScope.message }"/>
<h2>null 값 출력</h2>
표현식 태그 : <%=request.getAttribute("text") %><br>
EL : ${requestScope.text }<br> <!-- EL은 null 값이 들어 왔을 때 아무것도 출력하지 않는다. -->
out : <c:out value="${requestScope.text }" default="텍스트가 없습니다."/>
</body>
</html>














