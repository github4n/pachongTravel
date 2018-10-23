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
<%@ include file="../../system/index/top.jsp"%>
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
			/* border-radius: 10px; */
			padding: 0;
			height: 112px;
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
		#main .top-content hr{
			width: 100%;
			height: 2px;
			background-color: #979797;
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
			font-size: 26px;
			color: #fff;
		}
		#main .top-content ul li p:last-child{
			/* color:#d6487e; */
			font-size: 34px;
			color: #000;
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
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							
								<div id="main" style="width: 100%;">
										<div class="top-content">
											<h1>莫斯利安香草园</h1>
											<h2><strong>2018年10月18日</strong>&nbsp;&nbsp;实时客流情况</h2>
											<hr>
											<ul>
												<li>
													<p style="background-color:#197ADF">当前在园人数</p>		
													<p id="jrkl"></p> 
												</li>
												<li>
													<p style="background-color:#2C3BF1">入园总人数</p>
													
													<p id="ryzrs"></p> 
												</li>
												<li>
													<p style="background-color:#CB64FE">离园总人数</p>
													
													<p id="lyzrs"></p> 
												</li>
											</ul>
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
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
	<script>
		$(function(){
			getData();
		})
		function getData(){
			console.log('获取数据');
			$.ajax({
				type: "GET",                  //提交方式
				dataType: "json",              //预期服务器返回的数据类型
				url: "/ZHLY/bikeparks/getPersonNum",          //目标url
				data: '', //提交的数据
				success: function (result) {
					console.log(result);       //打印服务端返回的数据(调试用)
					$("#jrkl").text(result.data.personNum[0].value);
					$("#ryzrs").text(result.data.personNum[1].value);
					$("#lyzrs").text(result.data.personNum[2].value);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	</script>
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
	</script>


</body>
</html>