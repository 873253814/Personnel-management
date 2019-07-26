<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
/*out.print(request.getParameter("userid"));
out.print(request.getParameter("username"));
out.print(request.getParameter("birth"));
out.print(request.getParameter("from"));
out.print(request.getParameter("sex"));
out.print(request.getParameter("work"));
out.print(request.getParameter("postcode"));
out.print(request.getParameter("idcard"));
out.print(request.getParameter("phone"));
out.print(request.getParameter("bank"));
out.print(request.getParameter("bankid"));
out.print(request.getParameter("intime"));*/
request.setCharacterEncoding("utf-8");
String url = "jdbc:mysql://localhost:3306/work41?useUnicode=true&characterEncoding=utf-8";
String userName = "root";
String password = "kamisama";
String strSql = "insert into education41(userid,educational,speciality,time,school,language) values(?,?,?,?,?,?)";
String s_xh = (String)session.getAttribute("pram_xh");
	Connection con;
	PreparedStatement sql,sql1,sql2,sql3;
	ResultSet rs;
	String driverName1 = "com.mysql.jdbc.Driver";
		Class.forName(driverName1);
        con =  DriverManager.getConnection(url, userName, password); 
        sql=con.prepareStatement(strSql);
        sql.setString(1, s_xh);
        sql.setString(2, request.getParameter("educational"));
        sql.setString(3, request.getParameter("speciality"));
        sql.setString(4, request.getParameter("time"));
        sql.setString(5, request.getParameter("school"));
        sql.setString(6, request.getParameter("language"));
       /*sql1.setString(1, request.getParameter("from"));
        sql1.setString(2, request.getParameter("sex"));
        sql1.setString(3, request.getParameter("work"));*/
       /* sql2.setString(1, request.getParameter("postcode"));
        sql2.setString(2, request.getParameter("idcard"));
        sql2.setString(3, request.getParameter("phone"));
      /*sql.setString(1, request.getParameter("bank"));
        sql.setString(2, request.getParameter("bankid"));
        sql.setString(3, request.getParameter("intime"));*/
        sql.executeUpdate();
      /* response.sendRedirect("m1.jsp");*/
  %>
</body>
</html>