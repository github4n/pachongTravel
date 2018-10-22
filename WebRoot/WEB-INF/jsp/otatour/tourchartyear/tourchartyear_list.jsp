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
		.choose-date{
			width: 50%;
			margin: 0 auto;
		}
	    
	</style>
	<!-- ace settings handler -->
	<script src="../assets/js/ace-extra.js"></script>
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script>
</head>

<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-48" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/otatour/tourchartyear/tourchartyear_list.jsp">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-48" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/otatour/tourchartyear/tourchartyear_list.jsp">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				
					<div class="page-content">
						<div class="page-content">
						<form action="tourchartyear/list.do" method="post" name="Form" id="Form">
						
						<div class="row date-box">
							
							<div class="col-xs-12">
								
								<div class="form-group choose-date">
									<label for="startDate">起始日期</label>
									<input class="span10 date-picker" name="startTime" id="startDate"  value="" type="text"  readonly="readonly"  placeholder="开始日期"/>
									<input type="hidden" id="dtp_input_startDate" value="" />
									<br>
									<label for="endDate">结束日期</label>
									<input class="span10 date-picker" name="endTime" id="endDate"  value="" type="text"  readonly="readonly"  placeholder="结束日期"/>
									<input type="hidden" id="dtp_input_endDate" value="" />
									<!-- <input type="submit" value="查询" id="su" class="btn-search" onclick="gsearch"> -->
									<button  class="btn-search" onclick="gsearch()">
										查询
									</button>
								</div>
								
								
							</div>
							
						</div>
				
							
							
						
				
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									
									<div class="col-sm-12">
										<div class="widget-box">
											<div class="widget-header widget-header-flat">
												<h4 class="widget-title smaller">按小时段入园人数分布图</h4>
											</div>

											<div class="widget-body">
														<div id="timecntChart" style="width: 100%;height:500px;"></div>
											</div>
										</div>
									</div>
									</div>
								</div><!-- PAGE CONTENT ENDS -->
								</div>
								</form>
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
<script type="text/javascript">
//日期框

// $('.choose-box').click(function(event) {
// 	var event=event||e;
// 	console.log(event.currentTarget.dataset.index);
// 	$('#insertData').val(event.currentTarget.dataset.index);
// 	$("#Form").submit();
// })

function gsearch(){
	console.log('表单提交');
	$("#Form").submit();
}
// function gsearch(){
// 	console.log('表单提交');
// 	console.log($('#Form').serialize());
// 	$.ajax({
// 		type: "POST",                  //提交方式
// 		dataType: "json",              //预期服务器返回的数据类型
// 		url: "/ZHLY/tourchartday/getdayDate" ,          //目标url
// 		data: $('#Form').serialize(), //提交的数据
// 		success: function (result) {
// 			console.log(result);       //打印服务端返回的数据(调试用)
// 			let xData =  result.data.map(function(item) {return item['tmareas']}),
// 			yData = result.data.map(function(item) {return item['tournum']}),
// 			yyData = result.data.map(function(item) {return item['avgnum']});
			
// 			reloadEcharts(xData,yData,yyData);		
// 		},
// 		error : function(error) {
// 			console.log(error);
// 		}
// 	});
// }
laydate.render({
	elem: '#startDate'//指定元素
	,type: 'datetime'
	,done: function(value, date, endDate){
		console.log(value); //得到日期生成的值，如：2017-08-18
		$("#dtp_input_startDate").val(value);
	}
});
laydate.render({
	elem: '#endDate'//指定元素
	,type: 'datetime'
	,done: function(value, date, endDate){
		console.log(value); //得到日期生成的值，如：2017-08-18
		$("#dtp_input_endDate").val(value);
	}
});
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('timecntChart'));
		console.log(${pd.yJson });
		console.log(${pd.zJson });
		// 指定图表的配置项和数据
		var option = {
			tooltip: {},
			legend:{
					bottom: 10,
					data:['历史平均','考察期']
			},
			xAxis: {
				name:'时间',
				data: ${pd.xJson.xData },
			},
			yAxis: {
				name:'人流百分比',
			},
			series: [
				{
					name: '${pd.yJson.yName }',
					type: 'line',
					data: ${pd.yJson.yData },
					barWidth : 35,
					itemStyle: {
							normal: {
									color: '#16B8BE'
							}
					}
				},
				{
					name: '${pd.zJson.zName }',
					type: 'line',
					data: ${pd.zJson.zzData },
					itemStyle: {
							normal: {
									color: '#F29C47'
							}
					}
				},
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
		
		//重新加载Echarts
    function reloadEcharts(xData,yData,yyData){
			// 重新指定图表的配置项和数据
			var option = {
        tooltip: {},
        legend:{
            bottom: 10,
            data:['入园人数','历史平均']
        },
        xAxis: {
					name:'时间',
					data: xData ,
        },
        yAxis: {
					name:'人数',
				},
        series: [
            {
                name: '${pd.yJson.yName }',
                type: 'line',
                data: yData ,
                itemStyle: {
                    normal: {
                        color: '#87B87F'
                    }
                }
            },
            {
                name: '${pd.zJson.xName }',
                type: 'line',
                data: yyData ,
                itemStyle: {
                    normal: {
                        color: '#F2f830'
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