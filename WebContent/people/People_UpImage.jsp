<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	 		<link href="/nsi-0.8/assets/css/bootstrap.css" rel="stylesheet" />
		     <!-- FONTAWESOME STYLE CSS -->
		     <link href="/nsi-0.8/assets/css/font-awesome.css" rel="stylesheet" />
		    <!-- CUSTOM STYLE CSS -->
		    <link href="/nsi-0.8/assets/css/style.css" rel="stylesheet" />
		    
		    <script src="/nsi-0.8/assets/js/jquery-1.11.1.js"></script>
		    <!-- BOOTSTRAP SCRIPTS  -->
		    <script src="/nsi-0.8/assets/js/bootstrap.js"></script>
		    <!-- CUSTOM SCRIPTS  -->
		    <script src="/nsi-0.8/assets/js/custom.js"></script>
		
	<style>
		body{ text-align:center;} 
/* 		body{background-color:#c7d0d5} */

		/* 图片模糊效果 */
/* 		.blur {     */
/* 			    -webkit-filter: blur(5px); /* Chrome, Opera */ */
/* 			       -moz-filter: blur(5px); */
/* 			        -ms-filter: blur(5px);     */
/* 			            filter: blur(5px);     */
/* 			} */

	</style>
<body>
	
	<%
		String people_id=request.getParameter("UpImage_people_id");
	%>
	
	
	<script type="text/javascript">
	    function imgPreview(fileDom){
	        //判断是否支持FileReader
	        if (window.FileReader) {
	            var reader = new FileReader();
	        } else {
	            alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
	        }
	
	        //获取文件
	        var file = fileDom.files[0];
	        var imageType = /^image\//;
	        //是否是图片
	        if (!imageType.test(file.type)) {
	            alert("请选择图片！");
	            return;
	        }
	        //读取完成
	        reader.onload = function(e) {
	            //获取图片dom
	            var img = document.getElementById("preview");
	            //图片路径设置为读取的图片
	            img.src = e.target.result;
	        };
	        reader.readAsDataURL(file);
	// 	        使按钮可用
	        var buttonAbled = document.getElementById('updateButton');
// 	 		移除class
	        buttonAbled.removeAttribute("disabled")
			    }
	</script>
	
	<div style="background-color:#fff; height:50%;width:50%; margin:auto;">
		<div style="background-color:#fff;margin-top:50px;">
			<img id="preview" src="/nsi-0.8/assets/img/people-icon.png"class="img-thumbnail img-responsive" width="300" height="300"/>
		</div>
		<br>
		<!-- 			文件上传 -->
		<div style="width:100%;margin:auto;text-align:center;">
			<form class="form-horizontal" action="/nsi-0.8/People_UpImg?UpImage_people_id=<%=people_id%>" method="post" enctype="multipart/form-data">
				<input style="float:left;margin-left:220px;" class="btn btn-primary" type="file" name="files" onchange="imgPreview(this)">
				<input style="float:left;margin-left:20px;padding:8px 12px 8px 12px;" type="submit" disabled="disabled" id="updateButton" class="btn btn-primary ">
			</form>
		</div>
	</div>
	
</body>
</html>