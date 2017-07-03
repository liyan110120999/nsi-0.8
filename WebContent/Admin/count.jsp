<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
       /* 第一次访问 */
       out.println("欢迎访问菜鸟教程!");
       hitsCount = 1;
    }else{
       /* 返回访问值 */
       out.println("欢迎再次访问菜鸟教程!");
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
	%>

	<p>页面访问量为: <%= hitsCount%></p>
	
</body>
</html>