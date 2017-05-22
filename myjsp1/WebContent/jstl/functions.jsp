<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setAttribute("names", new String[] { "김경수", "김영수", "박철수", "이명수", "김진광", "이철", "두글", "세글" });
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${fn:length(requestScope.names)==0 }">
		조회된 이름이 없습니다.
		</c:when>
		<c:otherwise>
			<h2>김씨만 출력</h2>
			<c:forEach items="${requestScope.names }" var="name">
				<c:if test="${fn:startsWith(name,'김') }">
				${name}
				</c:if>
			</c:forEach>
			<h2>이름이 2글자인 이름만 출력</h2>
			<c:forEach items="${requestScope.names }" var="name">
				<c:if test="${fn:length(name)==2 }">
				${name } - ${fn:length(name) }<br>
				</c:if>
			</c:forEach>
			<h2>이름 개수</h2>
				${fn:length(requestScope.names) }<br>
				join(): ${fn:join(requestScope.names,",") }
		</c:otherwise>
	</c:choose>
</body>
</html>





