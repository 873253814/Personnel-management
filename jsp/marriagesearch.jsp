<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
 table {width:90%;background:#ccc; margin: 10px auto;border-collapse:collapse;}
 caption{font-family:微软雅黑;font-size:18pt;}
 th, td {height:25px;line-height:25px;text-align:center;border:1px solid #ccc;}
 th {background:#eee;font-weight:normal;}
 tr {background:#fff;}
 tr:hover {background:#b0c4de;}
 td a {color:#06f;text-decoration:none;}
 td a:hover {color:#06f;text-decoration:underline;} 
 a{color:#06f;text-decoration:none;}
 a:hover {color:#06f;text-decoration:underline;} 
</style>
</head>
<body>


<%
response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
request.setCharacterEncoding("utf-8");
out.println("<html>");
out.println("<body>");
String url = "jdbc:mysql://localhost:3306/work41?useUnicode=true&characterEncoding=utf-8";
String userName = "root";
String password = "kamisama";
	Connection con;
	Statement sql,sql1;
	String driverName1 = "com.mysql.jdbc.Driver";
	String a = request.getParameter("marriage");
	String strSql1 = "select userid from marriage41 where position='"+a+"' ;";
	ResultSet rs,rs1;
	Class.forName(driverName1);
    con =  (Connection) DriverManager.getConnection(url, userName, password); 
    sql1=con.createStatement();
	rs1=sql1.executeQuery(strSql1);
	out.print("<table border=1>");
	out.print("	<tr><td>员工工号</td><td>员工姓名</td><td>出生年月</td><td>籍贯</td><td>性别</td><td>身份证</td><td>联系方式</td><td>入职时间</td><td>职位</td><td>操作</td></tr>");
	while(rs1.next()){
    String strSql = "select *from infor41 where userid='"+rs1.getString("userid")+"' ;";
    sql=con.createStatement();
	rs=sql.executeQuery(strSql);
	while(rs.next()){
		out.print("<tr>");
		out.print("<td width=80>"+rs.getString("userid")+"</td>");
		out.print("<td width=80>"+rs.getString("username")+"</td>");
		out.print("<td width=80>"+rs.getString("birth")+"</td>");
		out.print("<td width=80>"+rs.getString("address")+"</td>");
		out.print("<td width=80>"+rs.getString("sex")+"</td>");
		out.print("<td width=80>"+rs.getString("idcard")+"</td>");
		out.print("<td width=80>"+rs.getString("phone")+"</td>");
		out.print("<td width=80>"+rs.getString("intime")+"</td>");
		out.print("<td width=80>"+rs.getString("position")+"</td>");
		out.print("</tr>");
	}
}
	out.print("<table>");
%>
</body>
</html>