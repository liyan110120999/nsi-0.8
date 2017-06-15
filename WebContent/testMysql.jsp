<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>  
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>数据库连通性测试</h2>
	<br>
	<h3>user<h3>
	<%  
	//注册数据库驱动  
	Class.forName("com.mysql.jdbc.Driver");  
	//获取数据库连接  
	Connection conn = DriverManager.getConnection(  
	    "jdbc:mysql://localhost:3306/NSI_DATABASE","root","123456");  
	//创建Statement  
	Statement stmt = conn.createStatement();  
	//执行查询  
	ResultSet rs = stmt.executeQuery("select * from nsi_user limit 0,2");  
	%>  
	<table bgcolor="#eee" border="1" width="300">  
	<%  
		//遍历结果集  
		while(rs.next())  
		{%>  
		    <tr>  
		        <!-- 输出结果集 -->  
		        <td><%=rs.getString(1)%></td>  
		      	<td><%=rs.getString(3)%></td>
		      	<td><%=rs.getString(4)%></td>  
		      	<td><%=rs.getString(5)%></td>  
		      	<td><%=rs.getString(6)%></td>  
		      	<td><%=rs.getString(7)%></td>  
		      	<td><%=rs.getString(8)%></td>  
		 	      	  
		    </tr>  
		<%}%>  
	<table>  
<% 
	rs.close();	
	stmt.close();	
	conn.close();	
%>
	
	
	
	<h3>school<h3>
	<%  
	//注册数据库驱动  
	Class.forName("com.mysql.jdbc.Driver");  
	//获取数据库连接  
	Connection conn02 = DriverManager.getConnection(  
	    "jdbc:mysql://localhost:3306/NSI_DATABASE","root","123456");  
	//创建Statement  
	Statement stmt02 = conn02.createStatement();  
	//执行查询  
	ResultSet rs02 = stmt02.executeQuery("select * from nsi_school_data order by load_time DESC limit 0,2");  
	%>  
	<table bgcolor="#eee" border="1" width="300">  
		<%  
		//遍历结果集  
		while(rs02.next())  
		{%>  
		    <tr>  
		        <!-- 输出结果集 -->  
		        <td><%=rs02.getString(1)%></td>  
		    </tr>  
		<%}%>  
	<table>  

	<% 
		rs02.close();	
		stmt02.close();	
		conn02.close();	
	%>

</body>
</html>