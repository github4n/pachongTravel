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

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-103" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/system/tools/map.jsp">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-103" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/system/tools/map.jsp">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">

							<div style="width: 600px;">
						 	<div class="span12">
								<div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
										<h4 class="lighter">地图</h4>
									</div>
									<div class="widget-body">
									 <div class="widget-main">
									 	<div class="step-content row-fluid position-relative">
								 			<div style="float: left;margin-top: 5px;">
												经度：
												<span class="input-icon">
													<input type="text" id="ZUOBIAO_Y" title="" value="" style="width:98%;" disabled="disabled">
													<i class="ace-icon fa fa-fire"></i>
												</span>
												纬度：
												<span class="input-icon">
													<input type="text" id="ZUOBIAO_X" title="" value="" style="width:98%;" disabled="disabled">
													<i class="ace-icon fa fa-fire"></i>
												</span>
											</div>
											<div>
												&nbsp;&nbsp;
												<button class="btn btn-app btn-light btn-xs"  onclick="openMap();">
												<i class="ace-icon fa fa-globe"></i>
												</button>
											</div>
									 	</div>
									 	<hr>
									 	<div class="step-content row-fluid position-relative">
								 			<div style="float: left;margin-top: 5px;">
												经度：
												<span class="input-icon">
													<input type="text" id="ZUOBIAO_Y2" title="" value="" style="width:98%;" disabled="disabled">
													<i class="ace-icon fa fa-fire"></i>
												</span>
												纬度：
												<span class="input-icon">
													<input type="text" id="ZUOBIAO_X2" title="" value="" style="width:98%;" disabled="disabled">
													<i class="ace-icon fa fa-fire"></i>
												</span>
											</div>
											<div>
												&nbsp;&nbsp;
												<button class="btn btn-app btn-light btn-xs"  onclick="openMap2();">
												<i class="ace-icon fa fa-globe"></i>
												</button>
											</div>
									 	</div>
									 	<hr>
									 	<div class="step-content row-fluid position-relative">
								 			<div style="float: left;margin-top: 5px;">
												距离：
												<span class="input-icon">
													<input type="text" id="distance" title="" value="" style="width:250px;" disabled="disabled">
													<i class="ace-icon fa fa-dashboard"></i>千米&nbsp;&nbsp;
												</span>
											</div>
											<div>
												<button class="btn btn-app btn-light btn-xs" onclick="getDistance();">计算</button>
											</div>
									 	</div>
									 	
									 </div><!--/widget-main-->
									</div><!--/widget-body-->
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
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/map.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
	</script>


</body>
</html> 