<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>제목</title>
</head> 
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>닉네임</th>
			<th>이메일</th>
			<th>이름</th>
			<th>주소</th>
			<th>등급</th>
		</tr>

		<c:forEach items="${members }" var="member">
			<tr>
				<td>${member.id }</td>
				<td>${member.password }</td>
				<td>${member.nickname }</td>
				<td>${member.email }</td>
				<td>${member.name }</td>
				<td>${member.address }</td>
				<td>${member.grade }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>