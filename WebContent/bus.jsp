<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>加载中</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  	<style>
	
		body{ text-align:center}
		body{background-color:#c7d0d5}

	</style>
		
 	 <script type="text/javascript">
		  function pageSearch()
			 {
				  document.getElementById("searchButton").click();
			}
     </script>
  <% 
  	Integer pageNum = request.getParameter("PassPage") != null && !request.getParameter("PassPage").equals("") ? Integer.parseInt(request.getParameter("PassPage")) : null;

  %>
  
  <body onload="pageSearch()">
    		<br>
   			 <form role="form" action="list.jsp" method="post">
   			 		<input type="hidden" class="form-control" name="School_name"/>									
					<input name="PassPage" type="hidden" value="<%=pageNum%>"/>
				
					<button type="submit" class="btn btn-default" style="display:none" id="searchButton" >bus</button>											
			</form>
			<br><br><br><br><br><br><br><br><br><br>
			<h3>第<%=pageNum%>页 加载中。。。</h3>
			
			
  </body>
</html>