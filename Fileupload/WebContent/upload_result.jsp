<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이미지 업로드 결과</h1>
	<form action="${initParam.rootPath }">
		업로더 : ${requestScope.uploader }<br>
		설명 : ${requestScope.uploader }<br>
		사진1 
	</form>


</body>
</html>