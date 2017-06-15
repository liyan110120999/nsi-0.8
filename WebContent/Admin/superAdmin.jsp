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
					      alert('ajax is ok!'+aa)		    	
			    };
	</script>


<!-- 	顶栏 -->
	<div>
		<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <!-- The mobile navbar-toggle button can be safely removed since you do not need it in a non-responsive implementation -->
          <a class="navbar-brand" href="#">新学说后台</a>
        </div>
        <!-- Note that the .navbar-collapse and .collapse classes have been removed from the #navbar -->
        <div id="navbar">
          <ul class="nav navbar-nav">
            <li><a href="#">概况</a></li>
            <li><a href="#about">注册用户</a></li>
            <li><a href="#contact">信息审核</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
       
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
	</div>
<br><br><br>
	
	
	<%  
	//注册数据库驱动  
	Class.forName("com.mysql.jdbc.Driver");  
	//获取数据库连接  
	Connection conn = DriverManager.getConnection(  
	    "jdbc:mysql://localhost:3306/NSI_DATABASE","root","123456");  
	//创建Statement  
	Statement stmt = conn.createStatement();  
	//执行查询  
	ResultSet rs = stmt.executeQuery("select * from nsi_user limit 0,10");  
	%>  
	
	<table class="table">
	<caption><h3>注册用户</h3></caption>
	<thead>
		<tr>
			<th>用户名（邮箱）</th>
			<th>用户等级</th>
			<th>真实姓名</th>
			<th>机构</th>
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
<!-- 			<td><button onclick="pass()">通过</button></td> -->
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



	<h3>school</h3>
	<%  
	//注册数据库驱动  
	Class.forName("com.mysql.jdbc.Driver");  
	//获取数据库连接  
	Connection conn02 = DriverManager.getConnection(  
	    "jdbc:mysql://localhost:3306/NSI_DATABASE","root","123456");  
	//创建Statement  
	Statement stmt02 = conn02.createStatement();  
	//执行查询  
	ResultSet rs02 = stmt02.executeQuery("select * from nsi_school_data order by load_time DESC limit 0,10 ");  
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
	</table>  

	<% 
		rs02.close();	
		stmt02.close();	
		conn02.close();	
	%>
</body>
</html>