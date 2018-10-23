<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<link rel="stylesheet" href="static/ace/css/ace-new.css">
<style>
	.no-skin {
    background-color: #e9edf5;
}
	ul,li{
		
		list-style: none;
	}
	#main ul li{
		background-color: #fff;
		border-radius: 10px;
		padding: 10px;
		height: 140px;
		margin-bottom: 40px;
		margin-right: 20px;
	}
	.main-container:before {
		background-color: #e9edf5;
	}
	.main-content,
	.page-content{
		background-color: #e9edf5;
	}
	.page-content h1{
		font-weight: bold;
		margin-bottom: 24px;
	}
	#main .top-content, .bottom-content{
		width: 100%;
	}
	#main .top-content ul, .bottom-content ul{
		min-width: 1100px;
		display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
		margin-left:0;
	}
	#main .top-content ul li{
		text-align: center;
		width: 340px;
	}
	#main .top-content ul li p:first-child{
		font-size: 30px;
		
	}
	#main .top-content ul li p:last-child{
		/* color:#d6487e; */
		font-size: 34px;
	}
	#main .bottom-content ul li{
		width: 520px;
	}
	#main .bottom-content ul li span{
		font-size: 34px;
		line-height:120px;
		margin-left: 30px;
	}
	#main .bottom-content ul li span:last-child{
		color:#d6487e;
	}
	
</style>
<!-- 百度echarts -->
<script src="plugins/echarts/echarts.min.js"></script>
<script type="text/javascript">
setTimeout("top.hangge()",500);
</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script>
</head>
<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-77" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/system/index/default.jsp">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-77" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/system/index/default.jsp">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
				
					<div class="row">
						<div class="col-xs-12">

							
							
							
							<div id="main" style="width: 100%;">
								<div class="top-content">
									<h1>客流概览</h1>
									<ul>
										<li>
											<p>今日客流</p>		
											<p style="color:rgba(0,172,172,1);">0</p> 
										</li>
										<li>
											<p>最近七天</p>
											
											<p style="color:rgba(114,124,182,1);">0</p> 
										</li>
										<li>
											<p>最近一个月</p>
											
											<p style="color:rgba(176,39,13,1);">0</p> 
										</li>
										<li>
											<p>最近一个季度</p>
											
											<p style="color:rgba(255,107,107,1);">0</p> 
										</li>
										<li>
											<p>入园高峰时间</p>
											
											<p style="color:rgba(171,110,177,1);">10:00-11:00</p>  
										</li>
										<li>
											<p>最佳渠道</p>
											
											<p style="color:rgba(252,141,54,1);">美团</p>		
										</li>
									</ul>
								</div>
								<div class="bottom-content">
									<h1>购票/验票</h1>
									<ul>
										<li>
											<span>系统用户:</span>
											<span style="color:rgba(252,141,54,1);">100</span>
										</li>
										<li>
											<span>系统会员:</span>
											<span style="color:rgba(54,55,252,1);">150</span>
										</li>
										
									</ul>
								</div>
								<div class="bottom-content">
									<h1>用户概览</h1>
									<ul>
										<li>
											<span>系统用户:</span>
											<span style="color:rgba(252,141,54,1);">100</span>
										</li>
										<li>
											<span>系统会员:</span>
											<span style="color:rgba(54,55,252,1);">150</span>
										</li>
										
									</ul>
								</div>
							</div>
							
						</div>
							
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
	</script>
<script type="text/javascript" src="static/ace/js/jquery.js"></script>
</body>
</html>