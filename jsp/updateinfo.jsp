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
        String seleStr = "select *from infor41 where userid='"+request.getParameter("pram_xh")+"'";
        rs = sql.executeQuery(seleStr);
        rs.next();
        session.setAttribute("pram_xh", request.getParameter("pram_xh"));
%>
<form action="update.jsp" method="post">
<table>
<tr>
	<td align="center" colspan="2">要修改的员工工号为:<%= request.getParameter("pram_xh")%></td>
	</tr>
	<tr>
	<td align="center">原始信息</td><td align="center">修改信息</td>
	</tr>
	<tr>
	<td>员工姓名:<%out.print(rs.getString("username")); %></td>
	<td><input type="text" value=<%=rs.getString("username") %> name="pram_name"></td>
	</tr>
		<tr>
	<td>出生年月:<%out.print(rs.getString("birth")); %></td>
	<td><input type="text" value=<%=rs.getString("birth") %> name="pram_birth"></td>
	</tr>
	<tr>
		<td>籍贯:<%out.print(rs.getString("address")); %></td>
	<td><input type="text" value=<%=rs.getString("address") %> name="pram_address"></td>
	</tr>
	<tr>
		<td>性别::<%out.print(rs.getString("sex")); %></td>
	<td><select name="pram_sex"   size="1">
	<option value="男">男</option>
	<option value="女">女</option>
	</select>
	</td>
	</tr>
	<tr>
		<tr>
		<td>身份证号码::<%out.print(rs.getString("idcard")); %></td>
	<td><input type="text" value=<%=rs.getString("idcard") %> name="pram_idcard"></td>
	</tr>
		<tr>
		<td>联系方式:<%out.print(rs.getString("phone")); %></td>
	<td><input type="text" value=<%=rs.getString("phone") %> name="pram_phone"></td>
	</tr>
	<tr>
		<td>入职时间::<%out.print(rs.getString("intime")); %></td>
	<td><input type="text" value=<%=rs.getString("intime") %> name="pram_intime"></td>
	</tr>
				<tr>
		<td align="center" colspan="2">
		<input type="submit"  value="提交" name="B1">
		<input type="reset"  value="重置" name="B2"> 
			<input type="button"  value="返回" name="B3" onclick="location.href='selectinfo.jsp'"> 

		</td>
	</tr>
	</table>
	</form>
</body>
</html>