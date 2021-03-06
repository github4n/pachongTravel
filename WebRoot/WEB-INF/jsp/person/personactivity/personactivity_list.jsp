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

	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="../assets/css/bootstrap.css" />
	<link rel="stylesheet" href="../assets/css/font-awesome.css" />
	<link rel="stylesheet" href="../assets/css/ace-fonts.css" />
	<link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
	<!-- 自定义css -->
	<link rel="stylesheet" href="static/ace/css/main.css">
	<style>
	/* 活跃度分析 */
	p.title-data{
		height:85px;
		line-height:85px;
		margin-bottom:19px;
		text-align: center;
		font-size: 28px;
		font-weight: bold;
		color:rgba(0,0,0,1);
		background:rgba(113,167,205,1);
	}
	
	</style>
	<!-- ace settings handler -->
	<script src="../assets/js/ace-extra.js"></script>
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script>
</head>

<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-50" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/person/personactivity/personactivity_list.jsp">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-50" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/person/personactivity/personactivity_list.jsp">
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

						

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-sm-6">
										<div class="row">
											<div class="col-sm-6">	
												<p class="title-data" id="userTotal">总用户数:${userTotal}</p>
											</div>
											<div class="col-sm-6">
												<p class="title-data" id="newUser">新增用户数:${newUser}</p>
											</div>
										</div>
										
											
										<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>订单数</th>
													<th>用户数</th>
													<th>占比（%）</th>
												</tr>
											</thead>

											<tbody id="newTable">
												<c:forEach items="${listp}" var="vr">
												<tr>
													<td class="hidden-480">${vr.ordertotal}</td>
													<td class="hidden-480">${vr.frequency}</td>
													<td class="hidden-480">${vr.percentage}%</td>
												</tr>
												</c:forEach>
												<c:choose>
													<c:when test="${not empty listp}">
														
														<tr>
															<td class="hidden-480">5次及以上</td>
															<td class="hidden-480">${ordertotalSum}</td>
															<td class="hidden-480">${ptage}%</td>
														<tr>
														<tr>
															<td class="hidden-480">合计</td>
															<td class="hidden-480">${ototalSum}</td>
															<td></td>
														<tr>
													
													</c:when>
												</c:choose>
												
												
											</tbody>
										</table>
									</div>

									<div class="col-sm-6">
										<div class="widget-box">
											<div class="widget-header widget-header-flat">
												<h4 class="widget-title smaller">用户成交订单数占比图</h4>
											</div>

											<div class="widget-body">
												<div id="userChart" style="width: 100%;height:500px;"></div>
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
		url: "/ZHLY/personactivity/getActivity" ,          //目标url
		data: $('#Form').serialize(), //提交的数据
		success: function (result) {
			console.log(result);       //打印服务端返回的数据(调试用)
			$("#userTotal").text("总用户数:"+result.data.userTotal);
			$("#newUser").text("新增用户数:"+result.data.userTotal);
			$("#newTable").empty();
			var newData = result.data.listp;
			newData.forEach(function(item,index){
				$("#newTable").append(
				'<tr>'+
				'<td class="hidden-480">'  + item.ordertotal +'</td>'+
				'<td class="hidden-480">' + item.frequency	+'</td>' +
				'<td class="hidden-480">'  + item.percentage +'</td>'+
				'</tr>'
					
				)
			})
			console.log(result.data.listp);
			
			$("#newTable").append(
			'<tr>'+
			'<td class="hidden-480">5次及以上</td>'+
			'<td class="hidden-480">' + result.data.ordertotalSum	+'</td>' +
			'<td class="hidden-480">'  + result.data.ptage +'</td>'+
			'</tr>'+
			'<tr>'+
			'<td class="hidden-480">合计</td>'+
			'<td class="hidden-480">' + result.data.ototalSum	+'</td>' +
			'<td class="hidden-480"></td>'+
			'</tr>'
			)
			
			
			let yData =  result.data.yJson.yData.filter(function(element,index){
				return index <= 3;
			})
			yData.push(result.data.ptage);
		  // xxData =  result.data.spendingTimeList.map(function(item) {return item['spendingTimeNumberSum']}),
			// yData = result.data.consumerIndexList.map(function(item) {return item['consumerIndex']}),
			// yyData = result.data.consumerIndexList.map(function(item) {return item['consumerIndexSum']});
			//reloadTable(xData);
			reloadEcharts(yData);		
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
    var cChart = echarts.init(document.getElementById('userChart'));

    // 指定图表的配置项和数据
    var option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        // grid: {
        //     left: '3%',
        //     right: '4%',
        //     bottom: '3%',
        //     containLabel: true
        // },
        xAxis : [
            {
							name:"次数",
							type : 'category',
							data : ['1', '2','3', '4', '5次及以上'],
							axisTick: {
									alignWithLabel: true
							}
            }
        ],
        yAxis : [
            {
							name:"百分比（%）",
							type : 'value',
							data:['0%', '10%','20%', '30%', '40%', '50%', '60%', '70%', '80%', '90%', '100%'],
							// data:${pd.yJson.yData},
            }
        ],
        series : [
            {
							name:'百分比（%）',
							type:'bar',
							barWidth: '60%',
							data:${pd.yJson.yData },
							itemStyle:{
								normal:{
									label:{
										show: true,
										position: 'top', //在上方显示
										textStyle: { //数值样式
											color: 'black',
											fontSize: 16
										}
									}
								}
							}
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    cChart.setOption(option);
		/*窗口自适应，关键代码*/
		setTimeout(function (){
			window.onresize = function () {
				cChart.resize();
			}
		},200)
		function reloadEcharts(yData){
			// 指定图表的配置项和数据
			var option = {
				color: ['#3398DB'],
				tooltip : {
						trigger: 'axis',
						axisPointer : {            // 坐标轴指示器，坐标轴触发有效
								type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						}
				},
				// grid: {
				//     left: '3%',
				//     right: '4%',
				//     bottom: '3%',
				//     containLabel: true
				// },
				xAxis : [
						{
							name:"次数",
							type : 'category',
							data : ['1', '2','3', '4', '5次及以上'],
							axisTick: {
									alignWithLabel: true
							}
						}
				],
				yAxis : [
						{
							name:"百分比（%）",
							type : 'value',
							data:['0%', '10%','20%', '30%', '40%', '50%', '60%', '70%', '80%', '90%', '100%'],
							// data:${pd.yJson.yData},
						}
				],
				series : [
						{
							name:'百分比（%）',
							type:'bar',
							barWidth: '60%',
							data:yData,
							itemStyle:{
								normal:{
									label:{
										show: true,
										position: 'top', //在上方显示
										textStyle: { //数值样式
											color: 'black',
											fontSize: 16
										}
									}
								}
							}
						}
				]
			};

    	// 使用刚指定的配置项和数据显示图表。
    	cChart.setOption(option);
	
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
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());//关闭加载状态
</script>
</body>
</html>