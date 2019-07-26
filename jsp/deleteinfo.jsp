<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style type="text/css">
            #input{
                display: block;       
				width: 30%;
				height: 22px;
				padding: 6px 12px;
				font-size: 14px;
				color: #555;
				background-color: #fff;
				border: 1px solid #ccc;
				border-radius: 4px;
            }
			#iput{
			width:120px;
			height:33px;
			border-radius:10px;
			}
  </style>
 </head>
 <body>
 <%session.setAttribute("pram_xh", request.getParameter("pram_xh"));  %>
 <form action="delete.jsp"  method="post">
  <center>
<font size="6" face="微软雅黑">请输入删除理由</font><input type="text" id="input" name="why" >
<input type="submit" value="提交" id="iput">
<input type="reset" value="重置" id="iput">
</center>
</form>
 </body>
</html>