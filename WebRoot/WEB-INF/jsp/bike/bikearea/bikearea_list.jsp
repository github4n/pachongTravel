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
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-7" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/bike/bikearea/bikearea_list.jsp">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-7" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/bike/bikearea/bikearea_list.jsp">
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
										<br>
										<label for="endDate">结束日期</label>
										<input class="span10 date-picker" name="endTime" id="endDate"  value="" type="text"  readonly="readonly"  placeholder="结束日期"/>
										<button class="btn-search" onclick="toSearch()">
											查询
										</button>
									</div>
									
									
								</div>
								
							</div>

							<div class="row">
								<div class="col-sm-12">
									<div class="widget-box">
										<div class="widget-header widget-header-flat">
											<h4 class="widget-title smaller">观光单车骑行取车还车分析</h4>
										</div>
										<div class="widget-body">
											
											<div id="areaChart" style="width:100%;height:560px;"></div>
										</div>
									</div>
								</div>
							</div><!-- PAGE CONTENT ENDS -->

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
$('.choose-box').click(function(event) {
	var event=event||e;
	console.log(event.currentTarget.dataset.index);
	var dataIndex = event.currentTarget.dataset.index;
	$('#insertData').val(dataIndex.toString());
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
		url: "/ZHLY/bikearea/getPickUpTheCar",          //目标url
		data: $('#Form').serialize(), //提交的数据
		success: function (result) {
			console.log(result);       //打印服务端返回的数据(调试用)
			let xData =  result.data.xJson.xData,
			yData =  result.data.yJson.yData,
			zData = result.data.zJson.zData;
			reloadEcharts(xData,yData,zData);		
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
    //时段分布图
    var areaChart = echarts.init(document.getElementById('areaChart'));
    var areaOption = {
        tooltip: {
            position: 'top'
        },
        animation: false,
        grid: {
            height: '50%',
            y: '10%'
        },
        xAxis: {
			      name: '取车点',
            type: 'category',
            data: ${pd.yJson.yData },
            splitArea: {
                show: true
            }
        },
        yAxis: {
			    	name: '还车点',
            type: 'category',
            data:  ${pd.zJson.zData },
            splitArea: {

                show: true
            }
        },
        visualMap: {
            min: 0,
            max: 10,
            calculable: true,
            orient: 'horizontal',
            left: 'center',
            bottom: '15%'
        },
        series: [{
            name: 'Punch Card',
            type: 'heatmap',
            data: ${pd.xJson.xData },
            label: {
                normal: {
                    show: true
                }
            },
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };

    areaChart.setOption(areaOption);
		/*窗口自适应，关键代码*/
		setTimeout(function (){
			window.onresize = function () {
				areaChart.resize();
			}
		},200)
				
		function 	reloadEcharts(xData,yData,zData){
			var areaOption = {
        tooltip: {
            position: 'top'
        },
        animation: false,
        grid: {
            height: '50%',
            y: '10%'
        },
        xAxis: {
			      name: '取车点',
            type: 'category',
            data: yData,
            splitArea: {
                show: true
            }
        },
        yAxis: {
			    	name: '还车点',
            type: 'category',
            data:  zData,
            splitArea: {

                show: true
            }
        },
        visualMap: {
            min: 0,
            max: 10,
            calculable: true,
            orient: 'horizontal',
            left: 'center',
            bottom: '15%'
        },
        series: [{
            name: 'Punch Card',
            type: 'heatmap',
            data: xData,
            label: {
                normal: {
                    show: true
                }
            },
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    	};

			areaChart.setOption(areaOption);
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