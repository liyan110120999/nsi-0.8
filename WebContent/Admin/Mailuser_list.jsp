<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>  
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<link href="../assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="../assets/css/style.css" rel="stylesheet" />
	<!--     	自定义css -->
    <link href="../assets/css/MyCss.css" rel="stylesheet" />
 
	<script src="../assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="../assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="../assets/js/custom.js"></script>
</head>
<body>

<!-- 导入顶栏 -->
<jsp:include page="/Admin/header.jsp"/>
	
	<%  
	//注册数据库驱动  
	Class.forName("com.mysql.jdbc.Driver");  
	//获取数据库连接  
	Connection conn = DriverManager.getConnection(  
	    "jdbc:mysql://localhost:3306/NSI_DATABASE","root","123456");  
	//创建Statement  
	Statement stmt = conn.createStatement();  
	//执行查询  
	ResultSet rs = stmt.executeQuery("select * from weeklymail order by load_time DESC limit 0,20");  
	%>  

	<table class="table">
		<caption><h3>邮件联系人列表</h3></caption>
		<thead>
			<tr>
				<th>ID</th>
				<th>用户姓名</th>
				<th>邮件地址</th>
				<th>时间</th>
		
			</tr>
		</thead>
		<tbody>
		<%  	//遍历结果集  
			while(rs.next())  
		{%>  
		
			<tr class="active">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
							
			</tr>		
		<%}%>  
		</tbody>
	</table>

<% 
	rs.close();	
	stmt.close();	
	conn.close();	
%>	
<div style="margin: 0 auto;width: 600px;height: 500px;">


</div>

</body>
</html>