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
	<!-- ace settings handler -->
	<script src="../assets/js/ace-extra.js"></script>
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script>
</head>

<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-52" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/person/personage/personage_list.jsp">

	<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-52" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/person/personage/personage_list.jsp">
	
		<div class="main-content">
			<div class="main-content-inner">
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
									
									<div class="col-sm-6">
										
										<div class="widget-box">
											<div class="widget-header widget-header-flat">
												<h4 class="widget-title smaller">游客性别分布</h4>
											</div>

											<div class="widget-body">
												<div id="genderChart" style="width: 100%;height:360px;"></div>
											</div>
										</div>
									</div>		
									<div class="col-sm-6">
										<!-- <div class="space-6"></div> -->
										<div class="widget-box">
											<div class="widget-header widget-header-flat">
												<h4 class="widget-title smaller">游客年龄段分布</h4>
											</div>

											<div class="widget-body">
												<div id="ageChart" style="width: 100%;height:360px;"></div>
											</div>
										</div>
									</div>
										
								</div>	
								<div class="row">
									<div class="col-sm-12">
										<div class="widget-box">
											<div class="widget-header widget-header-flat">
												<h4 class="widget-title smaller">游客年龄性别交叉分布</h4>
											</div>

											<div class="widget-body">
												<div id="ageGenderChart" style="width: 100%;height:720px;"></div>
											</div>
										</div>
									</div>
								</div>
						</div>
					</div>
			</div>
			
		</div>
	</div>
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
		url: "/ZHLY/personage/getAgeAndGender" ,          //目标url
		data: $('#Form').serialize(), //提交的数据
		success: function (result) {
			console.log(result);       //打印服务端返回的数据(调试用)
			let xData =  result.data;
		 
			// yyData = result.data.map(function(item) {return item['avgnum']});
			
			//reloadTable(xData);
			reloadEcharts(xData);		
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
		var genderChart = echarts.init(document.getElementById('genderChart'));

		// 指定图表的配置项和数据
		var option = {
			    // title : {
			    //     text: '游客性别分布',
			    //     x:'center'
			    // },
			    tooltip: {
						trigger: 'axis',
						axisPointer: {
								type: 'shadow'
						}
					},
					legend:{
            bottom: 10,
            data:['男', '女']
					},
					xAxis: {
						name:'性别',
						type : 'category',
						data: ['男','女']
					},
					yAxis: {
						name:'人数',
						type : 'value'
					},
					series: [
						{
							type: 'bar',
							barMaxWidth:150,
							data:[
									{value:0, name:'男'},
									{value:0, name:'女'}
							],
							itemStyle: {
								normal: {
										// 定制显示（按顺序）
										color: function(params) { 
												var colorList = ['#F3D353','#3CF5A2' ]; 
												return colorList[params.dataIndex] 
										},
										label: {
											show: true, //开启显示
											position: 'top', //在上方显示
											textStyle: { //数值样式
												color: 'black',
												fontSize: 16
											}
										}
								},
							},
						}
					]
			 
			};

		// 使用刚指定的配置项和数据显示图表。
		genderChart.setOption(option);
        
		// 基于准备好的dom，初始化echarts实例
		var ageChart = echarts.init(document.getElementById('ageChart'));

			// 指定图表的配置项和数据
		var option = {
				// color: ['#3398DB'],
				color:['#D1F8A2'],
				legend: {
					data:['男', '女']
				},
				tooltip : {
						trigger: 'axis',
						axisPointer : {            // 坐标轴指示器，坐标轴触发有效
								type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						}
				},
				
				xAxis : [
						{
								name:'年龄',
								type : 'category',
								data : ${ageName},
								axisTick: {
										alignWithLabel: true
								}
						}
				],
				yAxis : [
						{
							name:'人数',
							type : 'value'
						}
				],
				series : [
					{
						name:'人数',
						type:'bar',
						barWidth: '60%',
						data:'${ageCnt}',
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
		ageChart.setOption(option);
        
        
    // 基于准备好的dom，初始化echarts实例
		var ageGenderChart = echarts.init(document.getElementById('ageGenderChart'));

		// 指定图表的配置项和数据
		var option = {
			    tooltip : {
						trigger: 'axis',
						axisPointer : {            // 坐标轴指示器，坐标轴触发有效
								type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						}
			    },
					
			    legend: {
						data:['男', '女']
			    },
			    // grid: {
			    //     left: '3%',
			    //     right: '4%',
			    //     bottom: '3%',
			    //     containLabel: true
			    // },
					xAxis : [
						{
							name:"年龄",
							type : 'category',
							axisTick : {show: false},
							data : ${nameList}
						}
			    ],
			    yAxis : [
						{
							name:"人数",
							type : 'value'
						}
			    ],
			    series: [
			        {
								name:'男',
								type:'bar',
								data:${maleList},
								itemStyle: {
									normal: {
										label: {
											show: true,
											position: 'top', //在上方显示
											textStyle: { //数值样式
												color: 'black',
												fontSize: 16
											}
										},
										color:'#8C8CFC'
									},
								},
							},
								
			        {
								name:'女',
								type:'bar',
								data:${femaleList},
								itemStyle: {
									normal: {
										label: {
											show: true,
											position: 'top', //在上方显示
											textStyle: { //数值样式
												color: 'black',
												fontSize: 16
											}
										},
										color:'#F998EF' 
									},
								},
								
			        }
			    ]
			};

			// 使用刚指定的配置项和数据显示图表。
			ageGenderChart.setOption(option);
      
			/*窗口自适应，关键代码*/
			setTimeout(function (){
				window.onresize = function () {
					genderChart.resize();
					ageChart.resize();
					ageGenderChart.resize();
				}
			},200)
			
			//重新加载echats
			function reloadEcharts(xData){
				// 指定图表的配置项和数据
				var option = {
			    // title : {
			    //     text: '游客性别分布',
			    //     x:'center'
			    // },
			    tooltip: {
						trigger: 'axis',
						axisPointer: {
								type: 'shadow'
						}
					},
					legend:{
            bottom: 10,
            data:['男', '女']
					},
					xAxis: {
						name:'性别',
						type : 'category',
						data: ['男','女']
					},
					yAxis: {
						name:'人数',
						type : 'value'
					},
					series: [
						{
							type: 'bar',
							barMaxWidth:150,
							data:[
									{value:xData.maleNum, name:'男'},
									{value:xData.femaleNum, name:'女'}
							],
							itemStyle: {
								normal: {
										// 定制显示（按顺序）
										color: function(params) { 
												var colorList = ['#F3D353','#3CF5A2' ]; 
												return colorList[params.dataIndex] 
										},
										label: {
											show: true, //开启显示
											position: 'top', //在上方显示
											textStyle: { //数值样式
												color: 'black',
												fontSize: 16
											}
										}
								},
							},
						}
					]
			 
			};

				// 使用刚指定的配置项和数据显示图表。
				genderChart.setOption(option);
        
     		// 基于准备好的dom，初始化echarts实例

        // 指定图表的配置项和数据
				var option = {
			    // color: ['#3398DB'],
					color:['#D1F8A2'],
					legend: {
						data:['男', '女']
			    },
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
									name:'年龄',
			            type : 'category',
			            data : xData.ageName,
			            axisTick: {
			                alignWithLabel: true
			            }
			        }
			    ],
			    yAxis : [
			        {
								name:'人数',
								type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'人数',
			            type:'bar',
			            barWidth: '60%',
									data:xData.ageCnt,
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
				ageChart.setOption(option);
				// 指定图表的配置项和数据
				var option = {
			    tooltip : {
						trigger: 'axis',
						axisPointer : {            // 坐标轴指示器，坐标轴触发有效
								type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						}
			    },
					
			    legend: {
						data:['男', '女']
			    },
			    // grid: {
			    //     left: '3%',
			    //     right: '4%',
			    //     bottom: '3%',
			    //     containLabel: true
			    // },
					xAxis : [
						{
							name:"年龄",
							type : 'category',
							axisTick : {show: false},
							data : xData.nameList
						}
			    ],
			    yAxis : [
						{
							name:"人数",
							type : 'value'
						}
			    ],
			   
			    series : [
			        {
								name:'男',
								type:'bar',
								data:xData.maleList,
								itemStyle: {
									normal: {
										label: {
											show: true,
											position: 'top', //在上方显示
											textStyle: { //数值样式
												color: 'black',
												fontSize: 16
											}
										},
										color:'#8C8CFC'
										},
									},
							},

			        {
								name:'女',
								type:'bar',
								itemStyle: {
									normal: {
										label: {
											show: true,
											position: 'top', //在上方显示
											textStyle: { //数值样式
												color: 'black',
												fontSize: 16
											}
										},
										color:'#F998EF'
									},
								},
								data:xData.femaleList
			        }
			    ]
			};

			// 使用刚指定的配置项和数据显示图表。
			ageGenderChart.setOption(option);
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