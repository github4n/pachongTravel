		<div id="navbar" class="navbar navbar-default" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-79" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/system/index/head.jsp">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed');}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a class="navbar-brand">
						<small> <i class="fa fa-leaf"></i> 爬虫旅游大数据平台 </small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<%--<li title="即时聊天" class="purple" >--%>
							 <%--<!-- creatw()在 WebRoot\plugins\websocketInstantMsg\websocket.js中  -->--%>
							<%--<a data-toggle="dropdown" class="dropdown-toggle" href="#">--%>
								<%--<i class="ace-icon fa fa-bell icon-animated-bell"></i>--%>
								<%--<span class="badge badge-important"></span>--%>
							<%--</a>--%>

							<%--<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">--%>
								<%--<li class="dropdown-header">--%>
									<%--<i class="ace-icon fa fa-bell-o"></i>--%>
									<%--报警信息--%>
								<%--</li>--%>
							<%--</ul>--%>
						<%--</li>--%>

						<%--<li title="站内信" class="green" id="fhsmstss"><!-- fhsms()在 WebRoot\static\js\myjs\head.js中 -->--%>
							<%--<a data-toggle="dropdown" class="dropdown-toggle" href="#">--%>
								<%--<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>--%>
								<%--<!-- <span class="badge badge-success" id="fhsmsCount"></span> -->--%>
							<%--</a>--%>
						<%--</li>--%>

						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown"  class="dropdown-toggle" href="#">
								<img class="nav-user-photo" src="static/ace/avatars/user.jpg" alt="Jason's Photo" id="userPhoto" />
								<span class="user-info" style="vertical-align:sub" id="user_info">
								</span>
								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a onclick="editPhoto();" style="cursor:pointer;"><i class="ace-icon glyphicon glyphicon-picture"></i>修改头像</a><!-- editUserH()在 WebRoot\static\js\myjs\head.js中 -->
								</li>
								<li>
									<a onclick="editUserH();" style="cursor:pointer;"><i class="ace-icon fa fa-user"></i>修改资料</a><!-- editUserH()在 WebRoot\static\js\myjs\head.js中 -->
								</li>
								<li id="systemset">
									<a onclick="editSys();" style="cursor:pointer;"><i class="ace-icon fa fa-cog"></i>系统设置</a><!-- editSys()在 WebRoot\static\js\myjs\head.js中 -->
								</li>
								<li class="divider"></li>
								<li>
									<a href="logout"><i class="ace-icon fa fa-power-off"></i>退出登录</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>
				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>
		<div id="fhsmsobj"><!-- 站内信声音消息提示 --></div>