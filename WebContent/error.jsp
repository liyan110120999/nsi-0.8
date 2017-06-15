<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
      
       <link href="assets/css/bootstrap.css" rel="stylesheet" />
	     <!-- FONTAWESOME STYLE CSS -->
	    <link href="assets/css/font-awesome.css" rel="stylesheet" />
	    <!-- CUSTOM STYLE CSS -->
	    <link href="assets/css/style.css" rel="stylesheet" />
		<script src="assets/js/jquery-1.11.1.js"></script>
	    <!-- BOOTSTRAP SCRIPTS  -->
	    <script src="assets/js/bootstrap.js"></script>
	    <!-- CUSTOM SCRIPTS  -->
	    <script src="assets/js/custom.js"></script>

    
    <title>404错误页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
	<!--   			echart动画 -->
	 	<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
       <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
	   
       
  
  
  
  <body style="height: 100%; margin: 0">
    <br><br>
		  <div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="jumbotron">
						<h1>
							404错误页
						</h1>
						<p>
							很抱歉，页面发生了错误，您可以点击按钮返回到上一页。如有问题请联系管理员.
						</p>
						<br><br>
						<p>
							 <a class="btn btn-primary btn-large" href="javascript:history.back()">返回</a>
						
						</p>		
							 		
					</div>
				</div>
			</div>
		</div>
<!-- 		动画 -->
     	 <div id="container02" style="width:100%; height:50%;background-color:#666;"></div>
     	 
     			 <script type="text/javascript">
				var dom = document.getElementById("container02");
				var myChart = echarts.init(dom);
				var app = {};
				option = null;
				var symbolSize = 20;


				app.title = '力引导布局';

				function createNodes(count) {
					var nodes = [];
					for (var i = 0; i < count; i++) {
						nodes.push({
							id: i
						});
					}
					return nodes;
				}

				function createEdges(count) {
					var edges = [];
					if (count === 2) {
						return [[0, 1]];
					}
					for (var i = 0; i < count; i++) {
						edges.push([i, (i + 1) % count]);
					}
					return edges;
				}

				var datas = [];
				for (var i = 25; i < 26; i++) {
					datas.push({
						nodes: createNodes(i + 2),
						edges: createEdges(i + 2)
					});
				}

				option = {
					series: datas.map(function (item, idx) {
						return {
							type: 'graph',
							layout: 'force',
							animation: false,
							data: item.nodes,
							left: (idx % 4) * 25 +40+ '%',
							top: Math.floor(idx / 4) * 25 +135+'%',
							width: '20%',
							height: '20%',
							force: {
								// initLayout: 'circular'
								// gravity: 0
								repulsion: 1400,
								edgeLength: 26
							},
							edges: item.edges.map(function (e) {
								return {
									source: e[0],
									target: e[1]
								};
							})
						};
					})
				};


					myChart.setOption(option, true);

       </script>  
  </body>
</html>
