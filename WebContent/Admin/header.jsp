 <%@ page contentType="text/html;charset=UTF-8"%>  
	<!-- 	顶栏 -->
<div class="container">
	<div class="row ">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">新学说后台</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li>
							 <a href="/nsi-0.8/Admin/count.jsp">概览</a>				 
						</li>
						<li>
							 <a href="/nsi-0.8/Admin/UserCheck.jsp">用户审核</a>				 
						</li>
						<li>
							 <a href="/nsi-0.8/Admin/SchoolCheck.jsp">信息审核</a>				 
						</li>

						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">邮件周刊<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="/nsi-0.8/Admin/addMailUser.jsp">添加联系人</a>
								</li>
								<li>
									<a href="/nsi-0.8/Admin/Mailuser_list.jsp">联系人列表</a>
								</li>
								<li>
									<a href="/nsi-0.8/Admin/WeeklyMail.jsp">发送邮件内容</a>
								</li>													
							</ul>
						</li>
						
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">菜单<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="#">功能01</a>
								</li>
								<li class="divider">
								</li>
								<li>
									<a href="#">功能02</a>
								</li>
								<li>
									<a href="#">功能03</a>
								</li>						
								<li>
									<a href="#">功能04</a>
								</li>							
								<li>
									<a href="#">功能05</a>
								</li>
							</ul>
						</li>
					</ul>			
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="http://data.xinxueshuo.cn/nsi-0.8/index.jsp" target="_blank">前台首页</a>
						</li>
						<li>
							 <a href="#">用户：</a>
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
									 <a href="#">Something</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="#">link</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</div>
