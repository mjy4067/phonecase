<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 서보경 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="dataInputForm.jsp">회원 등록</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="dataOutput.jsp">회원 목록조회</a>
<h2>회원 목록</h2>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		con = JdbcUtil.getConnection();
		String sql = "select m.mem_id, mem_name, mem_gender, mem_birth, mem_tel from Member m left join Member_Tel t on m.mem_id = t.mem_id order by mem_no";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String mem_id="";
			%>
						<table border="1"><tr><td>회원ID</td><td>이름</td><td>성별</td><td>생년월일</td><td>전화번호1</td><td>전화번호2</td>
			<%   do{ 
						if(!mem_id.equals(rs.getString(1))){
			%>	
				<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td>
			<%
							mem_id = rs.getString(1);
						} else{
			%>
				<td><%=rs.getString(5) %></td></tr>
			<%			}
						} while(rs.next());
			%>
			</table>
<% 
	}
	} catch(Exception e){
		e.printStackTrace();
	} finally {
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(con!=null)con.close();
	}
%>
</body>
</html>