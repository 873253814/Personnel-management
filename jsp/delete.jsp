<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
            <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
<%
request.setCharacterEncoding("utf-8");
String url = "jdbc:mysql://localhost:3306/work41?useUnicode=true&characterEncoding=utf-8";
String userName = "root";
String password = "kamisama";
	Connection con;
	Statement sql,sql1,sql2;
	ResultSet rs;
	String driverName1 = "com.mysql.jdbc.Driver";
		Class.forName(driverName1);
        con =  DriverManager.getConnection(url, userName, password); 
        sql=con.createStatement();
        sql1=con.createStatement();
        sql2=con.createStatement();
        String s_xh = (String)session.getAttribute("pram_xh");
        String s_why = request.getParameter("why");
        String delsql = "delete from infor41 where userid = '"+s_xh+"';";
        String strSql = "insert into history41(userid,username,birth,address,sex,idcard,phone,intime,position,password1,department) select userid,username,birth,address,sex,idcard,phone,intime,position,password1,department from infor41 where userid ='"+s_xh+"';";
        String strSql1 = "update history41 set why='"+s_why+"' where userid= '"+s_xh+"';";
        sql1.executeUpdate(strSql);
        sql2.executeUpdate(strSql1);
        sql.executeUpdate(delsql);
        response.sendRedirect("selectinfo.jsp");
        %>
</body>
</html>