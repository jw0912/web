<%@page import="java.util.HashMap"%>
<%@page import="vo.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String[] names ={"김민수","이영철","박영희"};
	request.setAttribute("names",names);
	
	ArrayList<Customer> customerList = new ArrayList<>();
	customerList.add(new Customer("이고객","lee@nace.rcom",30,53.1,true));
	customerList.add(new Customer("삼고객","lee@1nace.rcom",31,54.2,false));
	customerList.add(new Customer("사고객","lee@2nace.rcom",32,55.3,true));
	
	request.setAttribute("list", customerList);
	
	HashMap map = new HashMap();
	map.put("pId","p-111");
	map.put("product name","노트북");
	map.put("price",3000000);
	map.put("cust",new Customer("최고객","choi@a.com",31,63.5,true));
	
	session.setAttribute("info",map);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>EL - Map 풀력 - key값으로 조회하므로, 연산자와 [] 연산자 모두 사용가능</h2>
제품 ID : ${sessionScope.info.pId }<br>
제품이름 : ${sessionScope.info["product name"] }
<%-- 식별자 규칙에 어긋나는 문자가 있을 경우 [] 표기법으로 묶어서 사용해야 한다. --%>
제품 가격 : ${sessionScope.info.price }원 <br>




<h2>EL - 리스트출력</h2>
이름 : ${requestScope.list[0].name }
이메일 : ${requestScope["list"][0]["email"] }
<table border='1' width="500px">
	<thrad>
		<tr>
			<td>이름</td>
			<td>이메일</td>
			<td>나이</td>
			<td>몸무게</td>
			<td>결혼여부</td>
		</tr>
	</thrad>
	<tbody>
		<tr>
			<td>${requestScope.list[0].name}</td>
			<td>${requestScope.list[0].email}</td>
			<td>${requestScope.list[0].age}</td>
			<td>${requestScope.list[0].weight}</td>
			<td>${requestScope.list[0].marriage?"기혼":"미혼"}</td>
		</tr>
		<tr>
			<td>${requestScope.list[1].name }</td>
			<td>${requestScope.list[1].email }</td>
			<td>${requestScope.list[1].age }</td>
			<td>${requestScope.list[1].weight }</td>
			<td>${requestScope.list[1].marriage ?"기혼":"미혼" }</td>
		</tr>
		<tr>
			<td>${requestScope.list[2].name }</td>
			<td>${requestScope.list[2].email }</td>
			<td>${requestScope.list[2].age }</td>
			<td>${requestScope.list[2].weight }</td>
			<td>${requestScope.list[2].marriage ?"기혼":"미혼" }</td>
		</tr>
	</tbody>
</table>
<h2>EL - 배열출력</h2>
<ul>
	<li>${requestScope.names[0]}</li> <!-- index로 접근 하는 경우는 []연산자(표기법) 사용 -->
	<li>${requestScope.names["1"]}</li>
	<li>${requestScope.names[2]}</li>
</ul>
</body>
</html>