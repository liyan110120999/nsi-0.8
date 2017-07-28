<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新学说-数据系统</title>
	<link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLE CSS -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="assets/css/style.css" rel="stylesheet" />
	<!--     自定义 -->
	<link href="assets/css/index.css" rel="stylesheet">
</head>
<body>
<div class="main">
        <!--头部-->
        <div class="back">
            <div class="header">
                <div class="head_lin">
                    <div class="logo">
                        <a href="#"><img src="/nsi-0.8/assets/img/index/logo.png" /></a>
                    </div>
                    <div class="login">
                    	<a href="#">使用说明</a>                     
                        <a href="http://47.92.84.36:8080/nsi-0.8/User/register.jsp">注册 </a>
                        <a href="http://47.92.84.36:8080/nsi-0.8/login.jsp">登录 </a>                      
                    </div>
                </div>
            </div>

            <!--头部内容-->
            <div class="text-center">
                <!--大标题-->
                <div class="header_title">
                    <h1>新学说数据系统</h1>
                </div>
                <!--搜索框-->
                <div class="Search_Div">
                    <!--搜索框-->
                    <div class="header-search">
                        <form role="search" action="servlet" name="myform" method="post">
                            <input type="text" style="float:left;" id="search" name="School_name" placeholder="请输入学校名或其他关键字">
                            <button style="float:left" id="SearchButton" type="submit">搜 索</button>
                            <input type="hidden" name="whereFrom" value="search">
                        </form>
                    </div>
                    <!--搜索框结束-->
                </div>
                <!--热词推荐-->
                <div class="hotContent">
                    <a href="/nsi-0.8/servlet?School_name=北京王府学校&whereFrom=search">北京王府学校</a>
                    <a href="/nsi-0.8/servlet?School_name=北京京西学校&whereFrom=search">北京京西学校</a>
                    <a href="/nsi-0.8/servlet?School_name=北京乐成国际学校&whereFrom=search">北京乐成国际学校</a>
                    <a href="/nsi-0.8/servlet?School_name=上海哈罗国际学校&whereFrom=search">上海哈罗国际学校</a>
                    <a href="/nsi-0.8/servlet?School_name=上海培佳双语学校国际班&whereFrom=search">上海培佳双语学校国际班</a>
                    <br>
                    <a href="/nsi-0.8/servlet?School_name=上海世界外国语中学&whereFrom=search">上海世界外国语中学</a>
                    <a href="/nsi-0.8/servlet?School_name=上海中学国际部&whereFrom=search">上海中学国际部</a>
                    <a href="/nsi-0.8/servlet?School_name=成都美视国际学校&whereFrom=search">成都美视国际学校</a>
                    <a href="/nsi-0.8/servlet?School_name=深圳国际交流学院&whereFrom=search">深圳国际交流学院</a>
                </div>
            </div>
        </div>

        <div class="div02">
            <!--左侧图片-->
            <!--最新活动-->  
                <div class="Carousel">
                    <a class="article-top" href="http://xinxueshuo.cn/index.php?s=/Home/Article/lists/category/hyhy" target="_blank" style="font-size: 20px;"><b>会议活动</b></a>
                    <!--会议内容-->
                    <div class="article-title">
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/hyhy">2017 VIS国际学校发展大会</a></li>
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/home/article/detail/id/53.html">2017 ICE国际学校投融资峰会</a></li>
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/hyhy">2016国际学校市场招生研讨会</a></li>
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/hyhy">《国际素质教育发展报告》</a></li>
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/hyhy">2016国际学校校园环境建设研讨会</a></li>
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/hyhy">2016 ICE国际学校投融资峰会</a></li>
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/hyhy">2015 ICE国际学校投融资峰会</a></li>
                    </div>
            	</div>

            <!--资讯-->
   
                <div class="article">
                    <a class="article-top" href="http://xinxueshuo.cn/index.php?s=/Home/Article/lists/category/zxdt" target="_blank" style="font-size: 20px;"><b>资讯文章</b></a>
                    <!--资讯内容-->
                    <div class="article-title">
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/home/article/detail/id/61.html">民办国际学校行业高速发展，国际双语教师需要掌握哪些技能？</a></li>
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/home/article/detail/id/60.html">前沿预测|上海将加强民办学校设立流程监管，引导非营利性办学</a></li>
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/home/article/detail/id/5.html">吴越：学校素质教育项目的开展趋向学术与活动的“统筹平衡”</a></li>
                        <li> <a target="_blank" href="http://www.xinxueshuo.cn/index.php?s=/home/article/detail/id/58.html">新学说《国际素质教育发展报告》</a></li>
                        <li> <a target="_blank" href="http://www.ximalaya.com/search/%E6%96%B0%E5%AD%A6%E8%AF%B4">“新学说传媒”喜马拉雅开播啦！</a></li>
                        <li> <a target="_blank" href="http://www.ximalaya.com/84004550/album/8870724">“新学说传媒”喜马拉雅FM 国际素质教育大会实录</a></li>
                        <li> <a target="_blank" href="http://www.ximalaya.com/84004550/album/8655210">“新学说传媒”喜马拉雅FM 国际学校大咖说</a></li>
                    </div>
                </div>
        </div>

        <!--介绍-->
        <div class="index011 col-md-12 column">
            <div class="col-md-3 column index012">
                <span class="glyphicon glyphicon-search" style="font-size: 60px"></span>
                <br>
                <strong class="solution__content__tite">中国国际学校数据库</strong>
                <p class="solution__content__desc">整合大数据，挖掘整合中国国际教育行业信息，进行
                   									 深度分析报道，建立行业平台</p>
            </div>
            
            <div class="col-md-3 column index012" >
                <span class="glyphicon glyphicon-unchecked" ></span>
                <br>
                <strong class="solution__content__tite">咨询服务</strong>
                <p class="solution__content__desc">提供全方位的行业研究/市场研究数据，投资建校咨询。</p>
            </div>

            <div class="col-md-3 column index012" >
                <span class="glyphicon glyphicon-th-list"></span>
                <br>
                <strong class="solution__content__tite">服务学校</strong>
                <p class="solution__content__desc">为国际学校之间提供交流平台，对接国际学校所需各类资源；</p>
            </div>

            <div class="col-md-3 column index012">
                <span class="glyphicon glyphicon-tasks" style="font-size: 60px"></span>
                <br>
                <strong class="solution__content__tite">服务机构</strong>
                <p class="solution__content__desc">深度整合教育圈的公司机构信息，提供全方位的行业服务</p>
            </div>
        </div>
    </div>
    
<section class="clearfix"></section>
   <!--     导入底栏jsp文件 -->
	<div>
		<jsp:include page="modular/bottomBar.jsp"/>
	</div>
</body>
</html>