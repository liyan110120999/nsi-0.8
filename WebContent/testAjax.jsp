<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<script>
			function showCustomer(str)
		{
			  var xmlhttp;    
			  if (str=="")
			  {
			    document.getElementById("myDiv").innerHTML="";
			    return;
			  }
				  if (window.XMLHttpRequest)
				  {
				    // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
				    xmlhttp=new XMLHttpRequest();
				  }
				  else
				  {
				    // IE6, IE5 浏览器执行代码
				    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				  }
			  xmlhttp.onreadystatechange=function()
			  {
			    if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
			      document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
			    }
			  }
			  xmlhttp.open("POST","People_Ajax",true);
			  xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			  xmlhttp.send("People_pageNum="+str+"&People_searchKey=n");
			 
		}
	</script>
<body>
	<button type="button" onclick="showCustomer(1)">请求数据1</button>
	<button type="button" onclick="showCustomer(2)">请求数据2</button>
	<button type="button" onclick="showCustomer(3)">请求数据3</button>
	<button type="button" onclick="showCustomer(4)">请求数据4</button>
	<button type="button" onclick="showCustomer(5)">请求数据5</button>
	
	<div id="myDiv"></div>
</body>
</html>