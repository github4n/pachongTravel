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
  <!-- 下拉框 -->
  <link rel="stylesheet" href="static/ace/css/chosen.css" />
  <!-- jsp文件头和头部 -->
  <%@ include file="../../system/index/top.jsp"%>

  <!-- 百度echarts -->
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
  <script src="plugins/echarts/echarts.min.js"></script>

	<!-- 日期框 -->
	<script src="static/laydate/laydate.js"></script>
	
  <!-- bootstrap & fontawesome -->
  <link rel="stylesheet" href="../assets/css/bootstrap.css" />
  <link rel="stylesheet" href="../assets/css/font-awesome.css" />
  <link rel="stylesheet" href="../assets/css/ace-fonts.css" />
  <link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
  <!-- 自定义css -->
	<link rel="stylesheet" href="static/ace/css/main.css">
	<style>
		.widget-body{
			background: none;
		}
	</style>
  <!-- ace settings handler -->
  <script src="../assets/js/ace-extra.js"></script>
  <script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script>
</head>

<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-42" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/otatour/touragent/touragent_list.jsp">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-42" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/otatour/touragent/touragent_list.jsp">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<div class="page-content">
							<div class="row date-box">
								<div class="col-xs-6">
								
									<div class="form-group choose-time">
										<div class="choose-box" data-index="1">
											<input id="checkbox1" type="radio" name="time" checked="checked">
											<label for="checkbox1">今日</label>
										</div>
										<div class="choose-box" data-index="2">
											<input id="checkbox2" type="radio" name="time">
											<label for="checkbox2">最近7天</label>
										</div>
										<div class="choose-box" data-index="3">
											<input id="checkbox3" type="radio" name="time">
											<label for="checkbox3">最近30天</label>
										</div>
									</div>
								</div>
								<div class="col-xs-6">
									
									<div class="form-group choose-date">
										<label for="startDate">起始日期</label>
										<input class="span10 date-picker" name="startTime" id="startDate"  value="" type="text" readonly="readonly"  placeholder="开始日期"/>
										
										<br>
										<label for="endDate">结束日期</label>
										<input class="span10 date-picker" name="endTime" id="endDate"  value="" type="text" readonly="readonly"  placeholder="结束日期"/>
										
										<button class="btn-search" onclick="toSearch()">
											查询
										</button>
									</div>
									
									
								</div>
								
							</div>
							
				
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-sm-6">
										<div class="widget-box">
											<div class="widget-header widget-header-flat">
												<h4 class="widget-title smaller">分销渠道分布表</h4>
											</div>

											<div class="widget-body">
												<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>渠道排名</th>
													<th>渠道名称</th>
													<th>入园人数</th>
													<!-- <th>占比</th> -->
												</tr>
											</thead>

											<tbody id="J_TbData">
													<c:choose>
														<c:when test="${not empty varList}">
															<c:forEach items="${varList}" var="var" varStatus="vs">
														<tr>
															<td class="hidden-480">${var.i }</td>
															<td class="hidden-480">${var.x }</td>
															<td class="hidden-480">${var.y }</td>
															<!-- <td class="hidden-480">${var.z }%</td> -->
														</tr>
															</c:forEach>
														</c:when>
													</c:choose>
													<tr>
														<td class="hidden-480">合计</td>
														<td class="hidden-480"></td>
														<td class="hidden-480">0</td>
													<tr>
											</tbody>
										</table>
											</div>
										</div>
									</div>
									
									<div class="col-sm-6">
										<div class="widget-box">
											<div class="widget-header widget-header-flat">
												<h4 class="widget-title smaller">分销渠道分布图</h4>
											</div>

											<div class="widget-body">
												<div id="timecntChart" style="width: 100%;height:500px;"></div>
											</div>
										</div>
									</div>
									</div>
								</div><!-- PAGE CONTENT ENDS -->
								</div>
								
								
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
		<form  id="Form">
			<input type="hidden" name="startTime" id="dtp_input_startDate" value="" />
			<input type="hidden" name="endTime" id="dtp_input_endDate" value="" />
			<input type="hidden" name="type" id="insertData" value="1">
		</form>
<script type="text/javascript">
	// $(function(){
	
	// 	$("#J_TbData").append(`
		
	// 	`);
			
	// });
//日期框
$('.choose-box').click(function(event) {
	var event=event||e;
	console.log(event.currentTarget.dataset.index);
	var dataIndex = event.currentTarget.dataset.index;
	$('#insertData').val(dataIndex.toString());
	// getList();
	gsearch();
})

// function gsearch(){
// 	$("#Form").submit();
// }
function toSearch(){
	$('#insertData').val('');
	gsearch();
}
function gsearch(){
	console.log('表单提交');
	console.log($('#Form').serialize());
	$.ajax({
		type: "POST",                  //提交方式
		dataType: "json",              //预期服务器返回的数据类型
		url: "/ZHLY/touragent/getThreeMonths" ,          //目标url
		data: $('#Form').serialize(), //提交的数据
		success: function (result) {
			console.log(result);       //打印服务端返回的数据(调试用)
			let xData =  result.data.map(function(item) {return item['name']}),
			zData = result.data;
			// yyData = result.data.map(function(item) {return item['avgnum']});
			
			reloadTable(zData);
			reloadEcharts(xData,zData);		
		},
		error : function(error) {
			console.log(error);
		}
	});
}
laydate.render({
	elem: '#startDate'//指定元素
	,type: 'date'
	,done: function(value, date, endDate){
		console.log(value); //得到日期生成的值，如：2017-08-18
		$("#dtp_input_startDate").val(value);
	}
});
laydate.render({
	elem: '#endDate'//指定元素
	,type: 'date'
	,done: function(value, date, endDate){
		console.log(value); //得到日期生成的值，如：2017-08-18
		$("#dtp_input_endDate").val(value);
	}
});
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('timecntChart'));
		console.log(${pd.xJson });
		console.log(${pd.zJson });
		console.log(${varList});
		// 指定图表的配置项和数据
		var option = {
			// title : {
			//    text: '分销渠道分布',
			//    subtext: '莫斯利安香草园',
			//    x:'center'
			// },
			tooltip: {
				trigger: 'item',
				formatter: "{a} <br/>{b} : {c} ({d}%)"
			},
			legend: {
					type: 'scroll',
					orient: 'vertical',
					right: 10,
					top: 20,
					bottom: 20,
					data: ${pd.xJson.xData },
			},
			series: [
				{
					name: '渠道',
					type: 'pie',
					radius : '55%',
					center: ['40%', '50%'],
					data: ${pd.zJson.zData},
					itemStyle: {
						normal:{
							color: function(params) {
									// build a color map as your need.
									var colorList = [
										'#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
											'#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
											'#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
									];
									return colorList[params.dataIndex]
							},
						},
						emphasis: {
							shadowBlur: 10,
							shadowOffsetX: 0,
							shadowColor: 'rgba(0, 0, 0, 0.5)'
						}
					}
				}
			]
		};	        

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
		/*窗口自适应，关键代码*/
		setTimeout(function (){
			window.onresize = function () {
				myChart.resize();
			}
		},200)

		//重新加载table
		function reloadTable(zData){
			$("#J_TbData").empty();
			console.log(zData);
			var newData = zData;
			newData.forEach(function(item,index){
				$("#J_TbData").append(
					'<tr>'+
					'<td class="hidden-480">' + (index+1) 	+'</td>' +
					'<td class="hidden-480">'  + item.name +'</td>'+
					'<td class="hidden-480">'  + item.value +'</td>'+
					'</tr>'
				)	
			})
			$("#J_TbData").append(
				'<tr>'+
				'<td class="hidden-480">合计</td>' +
				'<td class="hidden-480"></td>'+
				'<td class="hidden-480">0</td>'+
				'</tr>'
			)	
		}
		//重新加载Echarts
		function reloadEcharts(xData,zData){
			// 重新指定图表的配置项和数据
			var option = {
			// title : {
			//    text: '分销渠道分布',
			//    subtext: '莫斯利安香草园',
			//    x:'center'
			// },
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				legend: {
						type: 'scroll',
						orient: 'vertical',
						right: 10,
						top: 20,
						bottom: 20,
						data: xData ,
				},
				series: [
					{
						name: '渠道',
						type: 'pie',
						radius : '55%',
						center: ['40%', '50%'],
						data: zData,
						itemStyle: {
							normal:{
								color: function(params) {
										// build a color map as your need.
										var colorList = [
											'#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
												'#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
												'#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
										];
										return colorList[params.dataIndex]
								},
							},
							emphasis: {
								shadowBlur: 10,
								shadowOffsetX: 0,
								shadowColor: 'rgba(0, 0, 0, 0.5)'
							}
						}
					}
				]
			};	
			myChart.setOption(option);
		}
	</script>
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	<!-- /.main-container -->

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