<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jsp 传递给  js -->
	<% 
		String ccc="";
	%>
	<script type="text/javascript">
		var businessType = '<%=ccc%>';
	</script>
	
	<form name="form1" method="post" action="getSession.jsp">
	    <input type="hidden" name="test" value="msg" />
	    <button type="submit" value="submit"></button>
    </form>
	
	<%	
	session.setAttribute("test01", "ssss");
	%>
</body>
</html>