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
<%
	request.setCharacterEncoding("utf-8");
	String mem_id = request.getParameter("mem_id");
	String mem_name = request.getParameter("mem_name");
	String mem_gender = request.getParameter("mem_gender");
	String mem_birth = request.getParameter("mem_birth");
	String mem_tel[] = request.getParameterValues("mem_tel");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		con = JdbcUtil.getConnection();
		con.setAutoCommit(false);
		String sql = "insert into Member values(?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mem_id);
		pstmt.setString(2, mem_name);
		pstmt.setString(3, mem_gender);
		pstmt.setString(4, mem_birth);
		int result = pstmt.executeUpdate();
		
		if(result > 0){
			
		for(int i = 0; i < mem_tel.length; i++){
			int num = 1;
			pstmt = con.prepareStatement("select max(mem_no) from Member_Tel");
			rs = pstmt.executeQuery();
			if(rs.next()) num = rs.getInt(1) + 1;
			String sql_t = "insert into Member_Tel values(?, ?, ?)";
			pstmt = con.prepareStatement(sql_t);
			pstmt.setInt(1, num);
			pstmt.setString(2, mem_id);
			pstmt.setString(3, mem_tel[i]);
			
			pstmt.executeUpdate();
			}
		
			con.commit();
		
			out.println("<script>");
			out.println("alert('데이터가 입력되었습니다.');");
			out.println("location.href='dataInputForm.jsp';");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('데이터가 입력되지않았습니다. 다시 입력하세요!')");
			out.println("history.back();");
			out.println("</script>");
		}
	} catch(Exception e) {
		if(con!=null) con.rollback();
		out.println("<script>");
		out.println("alert('데이터가 입력에 오류가 발생하였습니다. 다시 입력하세요!');");
		out.println("history.back();");
		out.println("</script>");	
		e.printStackTrace();
	} finally {
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(con!=null)con.close();
	}
%>
</body>
</html>