﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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

	<!-- 自定义css -->
	<link rel="stylesheet" href="static/ace/css/main.css">
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
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
													<input class="span10 date-picker" name="startTime" id="startDate"  value="" type="text"  readonly="readonly"  placeholder="开始日期"/>
													<!-- <input type="hidden" id="dtp_input_startDate" value="" /> -->
													<br>
													<label for="endDate">结束日期</label>
													<input class="span10 date-picker" name="endTime" id="endDate"  value="" type="text"  readonly="readonly" placeholder="结束日期"/>
													<!-- <input type="hidden" id="dtp_input_endDate" value="" /> -->
													<button class="btn-search" onclick="toSearch()">
														查询
													</button>
												</div>
												
											</div>
									</div>
								
								<div class="widget-box">
									<div class="widget-header widget-header-flat">
										<h4 class="widget-title smaller">消费类APP TOP10 停留时长（min）</h4>
									</div>

									<div class="widget-body">
										<div id="minuteChart" style="width: 100%;height:500px;"></div>
									</div>
								</div>
									
								<div class="widget-box">
									<div class="widget-header widget-header-flat">
										<h4 class="widget-title smaller">消费指数</h4>
									</div>

									<div class="widget-body">
										<div id="numberChart" style="width: 100%;height:500px;"></div>
									</div>
								</div>
							</div>
							<!-- /.col -->
						</div>
					</div>
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
		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//日期框
$('.choose-box').click(function(event) {
		var event=event||e;
		console.log(event.currentTarget.dataset.index);
		var dataIndex = event.currentTarget.dataset.index;
		$('#insertData').val(dataIndex.toString());
		// getList();
		gsearch();
	})
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
		url: "/ZHLY/persontrade/getConsumption" ,          //目标url
		data: $('#Form').serialize(), //提交的数据
		success: function (result) {
			console.log(result);       //打印服务端返回的数据(调试用)
			let xData =  result.data.spendingTimeList.map(function(item) {return item['spendingTimeName']}),
		  xxData =  result.data.spendingTimeList.map(function(item) {return item['spendingTimeNumberSum']}),
			yData = result.data.consumerIndexList.map(function(item) {return item['consumerIndex']}),
			yyData = result.data.consumerIndexList.map(function(item) {return item['consumerIndexSum']});
			//reloadTable(xData);
			reloadEcharts(xData,xxData,yData,yyData);		
		},
		error : function(error) {
			console.log(error);
		}
	});
}
		//日期框
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
    var cChart = echarts.init(document.getElementById('minuteChart'));

    // 指定图表的配置项和数据
    var option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
							name:"类别",
							type : 'category',
							data : ${pd.sJson.sData},
							axisTick: {
									alignWithLabel: true
							}
            }
        ],
        yAxis : [
            {
							name:"时长",
              type : 'value',
						}
        ],
				series: [
					{
						type : 'bar',
						data:${pd.nJson.nData},
						itemStyle: {
							normal: {
								label: {
									show: true, //开启显示
									position: 'top', //在上方显示
									textStyle: { //数值样式
										color: 'black',
										fontSize: 16
									}
								}
							}
						},
					}
				]
        
    };

    // 使用刚指定的配置项和数据显示图表。
    cChart.setOption(option);

		// 基于准备好的dom，初始化echarts实例
    var numberChart = echarts.init(document.getElementById('numberChart'));

    // 指定图表的配置项和数据
    var option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
							name:"量级",
							type : 'category',
							data : ${pd.ssJson.ssData},
							axisTick: {
									alignWithLabel: true
							}
            }
        ],
        yAxis : [
            {
							name:"指数",
							type : 'value',
            }
        ],
        series : [
            {
							type:'bar',
							barWidth: '60%',
							data:${pd.nnJson.nnData},
							itemStyle: {
								normal: {
									label: {
										show: true, //开启显示
										position: 'top', //在上方显示
										textStyle: { //数值样式
											color: 'black',
											fontSize: 16
										}
									}
								}
							},
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    numberChart.setOption(option);
		/*窗口自适应，关键代码*/
		setTimeout(function (){
			window.onresize = function () {
				cChart.resize();
				numberChart.resize();
			}
		},200)
		function		reloadEcharts(xData,xxData,yData,yyData){
			// 指定图表的配置项和数据
			var option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
							name:"类别",
							type : 'category',
							data : xData,
							axisTick: {
									alignWithLabel: true
							}
            }
        ],
        yAxis : [
            {
							name:"时长",
              type : 'value',
						}
        ],
				series: [
					{
						type : 'bar',
						data:xxData,
						itemStyle: {
							normal: {
								label: {
									show: true, //开启显示
									position: 'top', //在上方显示
									textStyle: { //数值样式
										color: 'black',
										fontSize: 16
									}
								}
							}
						},
					}
				]
        
    };

    // 使用刚指定的配置项和数据显示图表。
    cChart.setOption(option);

    // 指定图表的配置项和数据
    var option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
							name:"量级",
							type : 'category',
							data : yData,
							axisTick: {
									alignWithLabel: true
							}
            }
        ],
        yAxis : [
            {
							name:"指数",
							type : 'value',
            }
        ],
        series : [
            {
                type:'bar',
                barWidth: '60%',
								data:yyData,
								itemStyle: {
									normal: {
										label: {
											show: true, //开启显示
											position: 'top', //在上方显示
											textStyle: { //数值样式
												color: 'black',
												fontSize: 16
											}
										}
									}
								},
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    numberChart.setOption(option);
		}
	</script>


</body>
</html>