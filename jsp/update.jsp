<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
            <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String url = "jdbc:mysql://localhost:3306/work41?useUnicode=true&characterEncoding=utf-8";
String userName = "root";
String password = "kamisama";
	Connection con;
	Statement sql;
	ResultSet rs;
	String driverName1 = "com.mysql.jdbc.Driver";
		Class.forName(driverName1);
        con =  DriverManager.getConnection(url, userName, password); 
        sql=con.createStatement();
        String s_xh = (String)session.getAttribute("pram_xh");
        String s_name = request.getParameter("pram_name");
        String s_birth = request.getParameter("pram_birth");
        String s_address = request.getParameter("pram_address");
        String s_sex = request.getParameter("pram_sex");
        String s_idcard = request.getParameter("pram_idcard");
        String s_phone = request.getParameter("pram_phone");
        String s_intime = request.getParameter("pram_intime");

    
        String updatesql = "update infor41 set username=  '"+s_name+"',birth= '"+s_birth+"',address= '"+s_address+"',sex= '"+s_sex+"',idcard= '"+s_idcard+"',phone= '"+s_phone+"',intime= '"+s_intime+"' where userid = '"+s_xh+"';";
        sql.executeUpdate(updatesql);
        response.sendRedirect("selectinfo.jsp");
        %>
</body>
</html>