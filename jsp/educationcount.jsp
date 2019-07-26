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
response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
request.setCharacterEncoding("utf-8");
out.println("<html>");
out.println("<body>");
String url = "jdbc:mysql://localhost:3306/work41?useUnicode=true&characterEncoding=utf-8";
String userName = "root";
String password = "kamisama";
	Connection con;
	Statement sql,sql1;
	int rowCount;
	String driverName1 = "com.mysql.jdbc.Driver";
	String a = request.getParameter("education");
	String strSql = "select count(*) from education41 where educational='"+a+"' ;";
	String strSql1 = "select userid from education41 where educational='"+a+"' ;";
	ResultSet rs,rs1;
	Class.forName(driverName1);
    con =  (Connection) DriverManager.getConnection(url, userName, password); 
    sql=con.createStatement();
    sql1=con.createStatement();
	rs=sql1.executeQuery(strSql);
	rs1=sql.executeQuery(strSql1);
	out.print("<table border=1>");
	out.print("	<tr><td>学历</td><td>人数</td><td>员工工号</td></tr>");
	if(rs.next()){
	out.print("<tr>");
	rowCount=rs.getInt(1);
	out.print("<td width=80>"+a+"</td>");
	out.print("<td width=80>"+rowCount+"</td>");
	out.print("<td width=80>");
	while(rs1.next()){
	out.print(rs1.getString("userid")+",");
	}
	out.print("</td>");
	out.print("</tr>");
	}
	out.print("</table>");
	
%>
</body>
</html>