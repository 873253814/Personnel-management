<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>超市账单管理系统</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
            <a href="login.html">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
<!--主体内容-->
    <section class="publicMian ">
        <div class="left">
            <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
            <nav>
                <ul class="list">
                    <li ><a href="billList.html">账单管理</a></li>
                    <li><a href="providerList.html">供应商管理</a></li>
                    <li><a href="userList.html">用户管理</a></li>
                    <li id="active"><a href="password.html">密码修改</a></li>
                    <li><a href="login.html">退出系统</a></li>
                </ul>
            </nav>
        </div>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>密码修改页面</span>
            </div>
            <div class="providerAdd">
                <form action="#">
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
    <section class="publicMian ">
<div class="right">
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
    	rs=sql.executeQuery("select count(*) from infor41 ");
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
    	 rs=sql.executeQuery("select *from infor41 limit "+pageSize*(pageNow-1)+","+pageSize);
    	%>
    	<%
		out.print("<table border=1>");
		out.print("	<tr><td>员工工号</td><td>员工姓名</td><td>出生年月</td><td>籍贯</td><td>性别</td><td>身份证号</td><td>联系方式</td><td>入职时间</td><td>职位</td><td>操作</td></tr>");
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
        	out.print("<td width=80>"+"<A href=updateinfo.jsp?pram_xh="+rs.getString("userid")+">"+"修改"+"</A>"+"/"+"<A href= deleteinfo.jsp?pram_xh="+rs.getString("userid")+">"+"删除"+"</A>"+"/"+"<A href=marriageinsertinfo.jsp?pram_xh="+rs.getString("userid")+">"+"婚配信息录入"+"</A>"+"/"+"<A href=educationinsertinfo.jsp?pram_xh="+rs.getString("userid")+">"+"学历信息录入"+"</A>"+"</td>");
    		out.print("</tr>");
    			}
		out.print("</table>");
    	//上一页
    	if(pageNow!=1){
    	out.println("<a href=selectinfo.jsp?pageNow="+(pageNow-1)+">上一页</a>");
    	}
    	//显示超链接
    	for(int i=1;i<=pageCount;i++){
    	out.println("<a href=selectinfo.jsp?pageNow="+i+">["+i+"]</a>");
    	}
    	//下一页
    	if(pageNow!=pageCount){
    	out.println("<a href=selectinfo.jsp?pageNow="+(pageNow+1)+">下一页</a>");
    	}
	
%>
<%		out.print("<td width=80>"+"<A href=m1.jsp>"+"返回"+"</td>"); %>
</center>
</div>
</section>
</body>
</html>
                </form>
            </div>
        </div>
    </section>
    <footer class="footer">
    </footer>
<script src="js/time.js"></script>

</body>
</html>