<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 서보경 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../style.css">
<script src="../check.js"></script>
<body align="center">
<nav>
	<a href="dataInputForm.jsp">회원 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="dataOutput.jsp">회원 목록조회</a>
</nav>
<h3>회원 정보 등록</h3>
<form name="f" action="dataInput.jsp" method="post" onsubmit="return checkForm()">
<table border="1" align="center">
<tr>
	<td class="td_left">▶ 회원ID</td>
	<td><input type="text" name="mem_id" id="input1"/></td>
</tr>
<tr>
	<td class="td_left">▶ 이름</td>
	<td><input type="text" name="mem_name" id="input2"/></td>
</tr>
<tr>
	<td class="td_left">▶ 성별(남,여)</td>
	<td><input type="text" name="mem_gender" id="input3"/></td>
</tr>
<tr>
	<td class="td_left">▶ 생년월일<br>(0000-00-00)</td>
	<td><input type="text" name="mem_birth" id="input4"/></td>
</tr>
<tr>
	<td class="td_left">▶ 전화번호1<br>('-'포함 최대13자리)</td>
	<td><input type="text" name="mem_tel" id="input5"/></td>
</tr>
<tr>
	<td class="td_left">전화번호2<br>('-'포함 최대13자리)</td>
	<td><input type="text" name="mem_tel"/></td>
</tr>
<tr>
	<td colspan="2" align="center"><input type="submit" value="등록"/>
		<input type="button" value="조회" onclick="location.href='dataOutput.jsp'"/> (▶ : 필수)</td>
</tr>
</table>
</form>
</body>
</html>