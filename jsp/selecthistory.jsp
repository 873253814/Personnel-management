<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<center>
<%
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
        int pageSize=5;
    	int pageNow=1;//默认显示第一页
    	int rowCount=0;//该值从数据库中查询
    	int pageCount=0;//该值是通过pageSize和rowCount
    	String s_pageNow=request.getParameter("pageNow");
    	if(s_pageNow!=null){
    	//接收到了pageNow
    	pageNow=Integer.parseInt(s_pageNow);
    	}
    	//查询得到rowCount
    	rs=sql.executeQuery("select count(*) from history41 ");
    	if(rs.next()){
    	rowCount=rs.getInt(1);
    	}
    	//计算pageCount
    	if(rowCount%pageSize==0){
    	pageCount=rowCount/pageSize;
    	}else{
    	pageCount=rowCount/pageSize+1;
    	}
    	//查询出需要显示的记录
    	 rs=sql.executeQuery("select *from history41 limit "+pageSize*(pageNow-1)+","+pageSize);
    	%>
    	<%
		out.print("<table border=1>");
		out.print("	<tr><td>员工工号</td><td>员工姓名</td><td>出生年月</td><td>籍贯</td><td>性别</td><td>身份证号</td><td>联系方式</td><td>入职时间</td><td>职位</td><td>删除理由</td><td>操作</td></tr>");
    	while(rs.next()){
    		out.print("<tr>");
    		out.print("<td width=80>"+rs.getString("userid")+"</td>");
    		out.print("<td width=80>"+rs.getString("username")+"</td>");
    		out.print("<td width=80>"+rs.getString("birth")+"</td>");
    		out.print("<td width=80>"+rs.getString("address")+"</td>");
    		out.print("<td width=100>"+rs.getString("sex")+"</td>");
    		out.print("<td width=80>"+rs.getString("idcard")+"</td>");
    		out.print("<td width=80>"+rs.getString("phone")+"</td>");
    		out.print("<td width=80>"+rs.getString("intime")+"</td>");
    		out.print("<td width=80>"+rs.getString("position")+"</td>");
    		out.print("<td width=80>"+rs.getString("why")+"</td>");
        	out.print("<td width=80>"+"<A href=reset.jsp?pram_xh="+rs.getString("userid")+">"+"恢复"+"</A>"+"</td>");
    		out.print("</tr>");
    			}
		out.print("</table>");
    	//上一页
    	if(pageNow!=1){
    	out.println("<a href=selecthistory.jsp?pageNow="+(pageNow-1)+">上一页</a>");
    	}
    	//显示超链接
    	for(int i=1;i<=pageCount;i++){
    	out.println("<a href=selecthistory.jsp?pageNow="+i+">["+i+"]</a>");
    	}
    	//下一页
    	if(pageNow!=pageCount){
    	out.println("<a href=selecthistory.jsp?pageNow="+(pageNow+1)+">下一页</a>");
    	}
	
%>
<%		out.print("<td width=80>"+"<A href=m1.jsp>"+"返回"+"</td>"); %>
</center>>
</body>
</html>