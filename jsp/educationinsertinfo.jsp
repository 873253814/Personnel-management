<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
            <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style type="text/css">
            #input{     
				width: 60%;
				height: 22px;
				padding: 6px 12px;
				font-size: 14px;
				color: #555;
				background-color: #fff;
				border: 1px solid #ccc;
				border-radius: 4px;
            }
			#iput{
			width:80px;
			height:20px;
			border-radius:10px;
			}
  </style>
 </head>
 <body>
 <% session.setAttribute("pram_xh", request.getParameter("pram_xh"));%>
 <form action="educationinsert.jsp"  method="post">
  <center>
  <table>
<tr><td><font size="4" face="微软雅黑">学历</font></td><td><select name="educational"  size="1">
	<option value="小学">小学</option>
	<option value="中学">中学</option>
		<option value="大学">大学</option>
			<option value="硕士">硕士</option>
				<option value="博士">博士</option>
	</select></td></tr>
<tr><td><font size="4" face="微软雅黑">专业</font></td><td><input type="text" id="input" name="speciality" ></td></tr>
<tr><td><font size="4" face="微软雅黑">毕业时间</font></td><td><input type="date" id="input" name="time"></td></tr>
<tr><td><font size="4" face="微软雅黑">学校</font></td><td><input type="text" id="input" name="school"></td></tr>
<tr><td><font size="4" face="微软雅黑">外语情况</font></td><td><input type="text" id="input" name="language"></td></tr>
<tr><td><input type="submit" value="提交" id="iput"></td>
<td><input type="reset" value="重置" id="iput"></td></tr>
<tr><td><input type="button" value="返回" id="iput" onclick="location.href="></td></tr>
</table>
</center>
</form>
 </body>
</html>