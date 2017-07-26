<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE>
<html>
<head>
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
    
	<title>新学说后台管理</title>
	<meta charset="UTF-8">
	<!-- 	自适应标签 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
</head>

<body>
	<script type="text/javascript">		
// 			jq Ajax
 			var pass= function(aa){			    	
			        $.ajax({
			            url: '/nsi-0.8/Verify',
			            type: 'post',
			            dataType:'json',
			            data: {verify:aa},
			            success: function(msg) {
			            }
			        });				        
			      alert(aa+' 审核通过，用户等级设为：1级')		    	
			    };
	</script>

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
	ResultSet rs = stmt.executeQuery("select * from nsi_user order by Load_time DESC limit 0,10");  
	%>  
	
	<table class="table">
	<caption><h3>注册用户</h3></caption>
	<thead>
		<tr>
			<th>用户名（邮箱）</th>
			<th>用户等级</th>
			<th>真实姓名</th>
			<th>机构</th>
			<th>职位</th>
			<th>手机号码</th>
			<th>积分</th>
			<th>注册时间</th>
			<th>操作</th>
		
		</tr>
	</thead>
	<tbody>
	<%  	//遍历结果集  
		while(rs.next())  
	{%>  
	
		<tr class="active">
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(9)%></td>
			<td><%=rs.getString(10)%></td>
			
			<td><button onclick="pass('<%=rs.getString(1)%>')">通过</button></td>
		</tr>		
	<%}%>  
	</tbody>
</table>
<% 
	rs.close();	
	stmt.close();	
	conn.close();	
%>	



</body>
</html>