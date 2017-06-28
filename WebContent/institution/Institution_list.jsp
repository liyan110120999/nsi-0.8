<!DOCTYPE>
<%@page import="Institution.Institution_model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="people.People_model"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	<link href="/nsi-0.8/assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <link href="/nsi-0.8/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="/nsi-0.8/assets/css/style.css" rel="stylesheet" />
    
    <link href="/nsi-0.8/assets/css/pagination.css" rel="stylesheet" />
    <!--     	自定义css -->
    <link href="/nsi-0.8/assets/css/MyCss.css" rel="stylesheet" />
    
    <script src="/nsi-0.8/assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="/nsi-0.8/assets/js/bootstrap.js"></script>
    <!-- CUSTOM SCRIPTS  -->
    <script src="/nsi-0.8/assets/js/custom.js"></script>
    
    <script src="/nsi-0.8/assets/js/jquery.pagination.js"></script>
   
<title>机构数据</title>
</head>
	<style>
		body{ text-align:center} 
		body{background-color:#c7d0d5}
		th { text-align:center;	background-color:#73afb6;}	
		td {height:40px}    /* 	表高度 */	
		
		.font-title01{ font-size:25px;line-height:120%;}
		.font-title02{ font-size:25px;line-height:120%;}
		.font-title03{ font-size:20px;line-height:120%;}
	
	</style>
	
		<!-- 	顶栏滚动透明 -->
 	<style type="text/css">  
	        html, body {width:100%;height:100%;} /*非常重要的样式让背景图片100%适应整个屏幕*/  
	        .bg {display: table;width: 100%;height: 100%;padding: 100px 0;text-align: center;color: #fff;background: url(http://www.xiandanke.cn/Image/intro-bg.jpg) no-repeat bottom center;background-color: #000;background-size: cover;}  
	        .my-navbar {padding:20px 0;transition: background 0.5s ease-in-out, padding 0.5s ease-in-out;}  
	        .my-navbar a{background:transparent !important;color:#fff !important}  
	        .my-navbar a:hover {color:#45bcf9 !important;background:transparent;outline:0}  
	        .my-navbar a {transition: color 0.5s ease-in-out;}/*-webkit-transition ;-moz-transition*/  
	        .top-nav {padding:0;background:#455a64;}  
	        button.navbar-toggle {background-color:#fbfbfb;}/*整个背景都是transparent透明的，会看不到，所以再次覆盖一下*/  
	        button.navbar-toggle > span.icon-bar {background-color:#dedede}  
	 </style>  
<!-- 	点击名字进入详情页 -->
	<script type="text/javascript">
		  function formDetail(Detail_id)
			 {
			  document.getElementById(Detail_id).submit();
			}
    </script>
<!--    	  搜索条件选项cookie 锁定 -->
    <script type="text/javascript">
	    function setCookie(name, value) {
	        var exp = new Date();
	        exp.setTime(exp.getTime() + 24 * 60 * 60 * 1000);
	        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
	    }
	    function getCookie(name)
	    {
	        var regExp = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	        var arr = document.cookie.match(regExp);
	        if (arr == null) {
	            return null;
	        }
	        return unescape(arr[2]);
	    }
	</script>
<%
// 	当前页 
	String currentPage="1";
	if(session.getAttribute("currentPage")!=null){
	currentPage=session.getAttribute("currentPage").toString(); 
	}
	//	搜索结果计数
	String countAllRS = "00";
	if(session.getAttribute("countAllRS")==null){
		countAllRS = "00";
	}else{
		countAllRS = session.getAttribute("countAllRS").toString();
	}
%>

<!-- 	分页配置 -->
	 <script type="text/javascript">	
	 // 点击分页按钮以后触发的动作
		function handlePaginationClick(new_page_index, pagination_container) {
		    $("#searchForm").attr("action", "/nsi-0.8/People_servlet?pageNum=" + (new_page_index+1));
		    $("#searchForm").submit();
		    return false;
		}
		$(function(){
			$("#paper-Pagination").pagination($("#countAllRS_id").val(), { //总条数
		        items_per_page:20, // 每页显示多少条记录
		        current_page:$("#currentPage_id").val()-1, // 当前显示第几页数据
		        num_display_entries:4, // 分页显示的条目数
		        next_text:"下一页",
		        prev_text:"上一页",
		        num_edge_entries:2, // 连接分页主体，显示的条目数
		        callback:handlePaginationClick
			});
					
		});
	</script>
	
<body>

<!-- 	隐式传值 -->
	<input type="hidden" id="currentPage_id" value="<%=currentPage%>">
	<input type="hidden" id="countAllRS_id" value="<%=countAllRS%>">
	
	<%
		    	//   获取session用户		     		
		String username ="空";
		if(session.getAttribute("Session_user")==null){
				//	 登录超时,跳转到login
			response.sendRedirect("/nsi-0.8/login.jsp");
		}else{
			username = session.getAttribute("Session_user").toString();
		}
		
// 		搜索关键字 session保存
		String People_searchKey_session = null;
		if(session.getAttribute("People_searchKey_session")!=null)	{    
			People_searchKey_session = session.getAttribute("People_searchKey_session").toString();
		}else{
			People_searchKey_session = null;
		}

    	%>

<nav class="navbar navbar-fixed-top my-navbar" role="navigation">  
	        <div class="container-fluid">  
	            <div class="navbar-header l-h-001">  
	                <button type="button" class="navbar-toggle" data-toggle="collapse" 
	                 data-target="#example-navbar-collapse"> 
	                   	<span class="icon-bar"></span> 
                     	<span class="icon-bar"></span> 
                  	 	<span class="icon-bar"></span> 
	                </button>  
	                <div>
	               	 	<img src="/nsi-0.8/assets/img/logo.png" class="img-rounded" width="250" height="60">
	                </div>
	            </div>  
	            <div class="collapse navbar-collapse l-f20" id="example-navbar-collapse">  
	                <ul class="nav navbar-nav navbar-right l-h-002">  
		                <li style="margin-top:5px;"><a href="/nsi-0.8/list.jsp"><b>学 校</b></a></li>
	                    <li style="margin-top:5px;"><a href="/nsi-0.8/null.jsp"><b>机 构</b></a></li>
	                   	<li style="margin-top:5px;"><a href="#"><b>人 员</b></a></li>
	                    <li style="margin-top:5px;"><a href="/nsi-0.8/about.jsp"><b>关 于</b></a></li>
	                    <li style="margin-top:5px;"><a href="/nsi-0.8/login.jsp" ><b>登 录</b></a></li>	          
	                </ul>  
	            </div>  
	        </div>  
	    </nav>  
	    
		<script>  
		        $(window).scroll(function () {  
		            if ($(".navbar").offset().top > 50) {$(".navbar-fixed-top").addClass("top-nav");  
		            }else {$(".navbar-fixed-top").removeClass("top-nav");}  
		        })
	    </script> 	
	
		<div class="carousel slide" id="carousel-466145">
				<ol class="carousel-indicators">
					<li  data-slide-to="0" data-target="#carousel-466145">
					</li>
					<li data-slide-to="1" data-target="#carousel-466145">
					</li>
					<li class="active" data-slide-to="2" data-target="#carousel-466145">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="" src="/nsi-0.8/assets/img/header02.jpeg" />
						<div class="carousel-caption">
							<h3>
								新学说 学校数据库
							</h3>
							<p>
								<b>挖掘整合中国国际教育行业数据，进行深度分析报道，建立行业平台</b>
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="/nsi-0.8/assets/img/header02.jpeg" />
						<div class="carousel-caption">
							<h3>
								新学说 人员数据库
							</h3>
							<p>
								<b>提供全方位的行业资讯，行业研究/市场研究数据，投资建校咨询。</b>
							</p>
						</div>
					</div>
					<div class="item active">
						<img alt="" src="/nsi-0.8/assets/img/header02.jpeg" />
						<div class="carousel-caption">
							<h3>
								新学说 机构数据库
							</h3>
							<p>
								<b>为国际学校之间提供交流平台，对接国际学校所需各类资源；提供专业的运营管理咨询，市场拓展和品牌管理等咨询服务。</b>
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-466145" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-466145" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
	
<section style="padding:50px 0 50px 0;">
<div class="container">
	<div class="row ">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">新学说-机构</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="/nsi-0.8/institution/Institution_insert.jsp">新增</a>				 
						</li>
						<li>
							 <a href="#">菜单</a>				 
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">可视化<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="show/histogram.jsp">条形图</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">echart</a>
								</li>
								<li>
									 <a href="#">echart</a>
								</li>						
								<li>
									 <a href="#">echart</a>
								</li>							
								<li>
									 <a href="#">echart</a>
								</li>
							</ul>
						</li>
					</ul>
					
					<form class="navbar-form navbar-left" id="searchForm" role="search" action="/nsi-0.8/Institution_servlet" name="P_Searchform" method="post">
						<div class="form-group">						
							<div class="input-group">
								<div class="input-group-btn">
									<select name="searchMenu" id="searchMenuId" class="form-control" onclick="setCookie('searchMenu',this.selectedIndex)">
										<option>全部</option>
										<option>教育</option>
										<option>投资</option>
<!-- 										<option>提交者</option>												 -->
									</select>
<!-- 									选项搜索 -->
									<script type="text/javascript">
									    var selectedIndex = getCookie("searchMenu");
									    if(selectedIndex != null) {
									        document.getElementById("searchMenuId").selectedIndex = selectedIndex;
									    }
									</script>								
								</div>
								<!-- 								防止搜索框出现null -->
								<%if(People_searchKey_session!=null){%>
									<input type="text" class="search-input form-control" style="width:300px" name="Institution_searchKey" value="<%=People_searchKey_session%>" />
								<%}else{%>
									<input type="text" class="search-input form-control" style="width:300px" name="Institution_searchKey" />
								<%}%>									
							</div>			
								<input type="hidden" name="searchMenu" value="People_name">
								<input type="hidden" name="whereFrom" value="search">
							</div> 
						<button type="submit" name="submit_Button" class="btn btn-primary" id="searchButton">搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#">用户：<%=username%></a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">菜单<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">Action</a>
								</li>
								<li>
									 <a href="#">action</a>
								</li>
								<li>
									 <a href="#">action</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">action</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	
</div>
	
	<%	
		List<Institution_model> list = (List<Institution_model>)request.getAttribute("Institution_list");
			if(list == null || list.size() < 1){			
				out.println("<br><h4>没有搜索到数据</h4><br>");
			}else{
				
		%>
			<h5 style="text-align:center">搜索到 <%=countAllRS%> 条结果</h5>
		
<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-md-12 column table-responsive">
		
			<table class="table table-hover">		
				<thead id="tableHeaderID">
					<tr>
						<th>ID</th>
						<th>机构名</th>
						<th>地区</th>
						<th>CEO</th>
						<th>业务</th>
						<th>电话</th>
						<th>通讯地址</th>
						<th>邮箱</th>
						<th>介绍</th>
						<th>投资信息</th>
						<th>备注</th>
						<th>提交者</th>		
						<th>提交时间</th>						
					</tr>
				</thead>
		<tbody>
			<%	for(Institution_model institution : list){ %>
			<tr class="info">
				<td><a href="javascript:void(0)" onclick="formDetail(<%=institution.getId()%>)"><%=institution.getId()%></a></td>
				<form id="<%=institution.getId()%>" role="form" action="People_servlet" method="post">						
					<input type="hidden" name="detail_people_id" value="<%=institution.getId()%>">
					<input type="hidden" name="whereFrom" value="detail">																						
				</form>
				<td><%=institution.getName()%></td>
				<td><%=institution.getAreas()%></td>			
				<td><%=institution.getCEO()%></td>
				<td><%=institution.getService()%></td>
				<td><%=institution.getTelephone()%></td>
				<td><%=institution.getAddress()%></td>
				<td><%=institution.getMail()%></td>
				<td><%=institution.getIntroduction()%></td>
				<td><%=institution.getInvestment()%></td>
				<td><%=institution.getRemark()%></td>

			</tr>							
<!-- 			遍历列表 -->
		<%}%>
		</tbody>
		</table>
		</div>
	</div>
</div>
	
		<br>
			<!-- 	分页显示区 div -->
			<div style="line-height:20px;" id="paper-Pagination" class="flickr"></div>			
	<%}%>

</section>
<!--     清除指定session -->
    <%
    session.removeAttribute("countAllRS");
    session.removeAttribute("currentPage");  	
    %>
  	<!--     导入底栏jsp文件 -->
	<div>
		<jsp:include page="/modular/bottomBar.jsp"/>
	</div>
</body>
</html>