<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Context Root 경로 명</h2>
<%=application.getContextPath() %><br>
<%=application.getInitParameter("rootPath") %><br>
${initParam.rootPath }<!-- 초기파라미터를 제공하는 EL 내장객체 initParam -->

<form action="${initParam.rootPath }/el/exam3.jsp">
	나이 : <input type="number" name="age"><br>
	취미 : <br>
	<label>게임 <input type="checkbox" name="hobby" value="게임"></label><br>
	<label>독서 <input type="checkbox" name="hobby" value="독서"></label><br>
	<label>영화감상 <input type="checkbox" name="hobby" value="영화감상"></label>
	<br>
	<input type="submit" value="전송">
	<button>전송2</button>

</form>


</body>
</html>