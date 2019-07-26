<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.lang.*, java.io.*, java.sql.*, java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>小区物业管理系统</title>
</head>
<%
request.setCharacterEncoding("utf-8");
String url = "jdbc:mysql://localhost:3306/aaa?useUnicode=true&characterEncoding=utf-8";
String userName = "root";
String password = "kamisama";
String strSql = "select *from infor";
	Connection con;
	Statement sql;
	ResultSet rs;
	String driverName1 = "com.mysql.jdbc.Driver";
		Class.forName(driverName1);
        con =  DriverManager.getConnection(url, userName, password); 
        sql=con.createStatement();
        String seleStr = "select *from infor where userid='"+request.getParameter("pram_xh")+"'";
        rs = sql.executeQuery(seleStr);
        rs.next();
        session.setAttribute("pram_xh", request.getParameter("pram_xh"));
%>
<frameset rows="8%,87%,*" framespacing="0" border="0" frameborder="0">
<frame src="head1.html" noResize scrolling="no">
<frameset cols="10%,*" framespacing="0" border="0" frameborder="0">
<frame src="left1.jsp"  noResize scrolling="no">
<frame src="main1.html" name="view" noResize scrolling="no">
</frameset>
<frame src="foot1.html" noResize scrolling="no">
</frameset>
</html>