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
	ResultSet rs = stmt.executeQuery("select * from nsi_school_data order by load_time DESC limit 0,10");  
	%>  

<% 
	rs.close();	
	stmt.close();	
	conn.close();	
%>	

<!-- 	邮件内容 -->
	<div style="margin: 0 auto;width: 900px;height: 500px;">
            <form class="bs-example bs-example-form" action="/nsi-0.8/MailSender" method="post" role="form">
                <div>
                    <div style="padding: 100px 100px 10px;float: left;">

                            <div class="input-group">
                                <input type="text" class="form-control" name="title01" placeholder="标题1">
                            </div><br>
                            <div class="input-group">
                                <input type="text" class="form-control" name="title02" placeholder="标题2">
                            </div><br>
                            <div class="input-group">
                                <input type="text" class="form-control" name="title03" placeholder="标题3">
                            </div><br>
                            <div class="input-group">
                                <input type="text" class="form-control" name="title04" placeholder="标题4">
                            </div><br>
                            <div class="input-group">
                                <input type="text" class="form-control" name="title05" placeholder="标题5">
                            </div><br>
                    </div>
                    <!--右侧-->
                    <div style="padding: 100px 100px 10px;float: left;">

                            <div class="input-group">
                                <input type="text" class="form-control" name="link01" placeholder="链接1">
                            </div><br>
                            <div class="input-group">
                                <input type="text" class="form-control" name="link02" placeholder="链接2">
                            </div><br>
                            <div class="input-group">
                                <input type="text" class="form-control" name="link03" placeholder="链接3">
                            </div><br>
                            <div class="input-group">
                                <input type="text" class="form-control" name="link04" placeholder="链接4">
                            </div><br>
                            <div class="input-group">
                                <input type="text" class="form-control" name="link05" placeholder="链接5">
                            </div><br>


                    </div>
                    <input type="hidden" name="whereFrom" value="sendMail">
                </div>
                <div class="clearfix"></div>
                <!--按钮功能组-->
                <div id="myButtons2" class="bs-example">
                    <button type="submit" class="btn btn-primary"
                            data-loading-text="Loading...">发送
                    </button>
                </div>

            </form>
        </div>



</body>
</html>