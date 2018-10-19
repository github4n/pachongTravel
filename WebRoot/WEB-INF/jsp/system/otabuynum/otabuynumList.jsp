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
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 百度echarts -->
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
<script src="plugins/echarts/echarts.common.min.js"></script>

	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<script type="text/javascript">

</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-94" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/system/otabuynum/otabuynumList.jsp">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-94" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/system/otabuynum/otabuynumList.jsp">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">
							<div id="main" style="width: 1650px;height:800px;">
								<div class="form-group">
									<label for="dtp_input1" class="control-label" style="padding-top: 5px;">按日期查询：</label>
									<input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:188px;" placeholder="开始日期"/>
									<input type="hidden" id="dtp_input1" value="" /><br/>
								</div>
								<div id="echartsMain" style="width: 1650px;height:600px;">

								</div>

							</div>
							<script type="text/javascript">

                                //日期框
                                $('.date-picker').datepicker({autoclose: true,todayHighlight: true});

                                /*$('#datetimepicker1').datetimepicker({
                                    language: 'zh-CN',//显示中文
                                    format: 'yyyy-mm-dd',//显示格式
                                    minView: "month",//设置只显示到月份
                                    initialDate: new Date(),
                                    autoclose: true,//选中自动关闭
                                    todayBtn: true//显示今日按钮
                                });*/

						        // 基于准备好的dom，初始化echarts实例
						        var myChart = echarts.init(document.getElementById('echartsMain'));

						        // 指定图表的配置项和数据
								var option = {
                                    title: {
                                        text:'各大平台销量统计情况'
                                    },
                                    tooltip: {
                                        trigger: 'axis'
                                    },
                                    legend: {
                                        data:['冰雕嘉年华','同程旅游','携程','爬虫旅游','爬虫旅游分销平台','生态园香草园终端机','美团','途牛','驴妈妈']
                                    },
                                    grid: {
                                        left: '3%',
                                        right: '4%',
                                        bottom: '3%',
                                        containLabel: true
                                    },
                                    toolbox: {
                                        show:true,
                                        feature: {
                                            mark : {
                                                show : true
                                            },
                                            magicType : {
                                                show : true,
                                                type : [ 'bar', 'line' ]
                                            },
                                            restore : {
                                                show : true
                                            },
                                            saveAsImage : {
                                                show : true
                                            }
                                        }
                                    },
                                    xAxis: {
                                        name:'各大平台',
                                        type: 'category',
                                        boundaryGap: false,
                                        data: ['冰雕嘉年华','同程旅游','携程','爬虫旅游','爬虫旅游分销平台','生态园香草园终端机','美团','途牛','驴妈妈']
                                    },
                                    yAxis: {
                                        name:'销售量',
                                        type: 'value'
                                    },
                                    series: [
                                        {
                                            name:'冰雕嘉年华',
                                            type:'line',
                                            stack: '总量',
                                            data:[120, 132, 101, 134, 90, 230, 210,800,900]
                                        },
                                        {
                                            name:'同程旅游',
                                            type:'line',
                                            stack: '总量',
                                            data:[220, 182, 191, 234, 290, 330, 310,900,800]
                                        },
                                        {
                                            name:'携程',
                                            type:'line',
                                            stack: '总量',
                                            data:[150, 232, 201, 154, 190, 330, 410,1000,1010]
                                        },
                                        {
                                            name:'爬虫旅游',
                                            type:'line',
                                            stack: '总量',
                                            data:[320, 332, 301, 334, 390, 330, 320,900,1100]
                                        },
                                        {
                                            name:'爬虫旅游分销平台',
                                            type:'line',
                                            stack: '总量',
                                            data:[820, 932, 901, 934, 1290, 1330, 1320,1300,1200]
                                        },
                                        {
                                            name:'生态园香草园终端机',
                                            type:'line',
                                            stack: '总量',
                                            data:[820, 932, 901, 934, 1290, 1330, 1320,1200,1300]
                                        },
                                        {
                                            name:'美团',
                                            type:'line',
                                            stack: '总量',
                                            data:[820, 932, 901, 934, 1290, 1330, 1320,1200,1300]
                                        },
                                        {
                                            name:'途牛',
                                            type:'line',
                                            stack: '总量',
                                            data:[820, 932, 901, 934, 1290, 1330, 1320,1300,1200]
                                        },
                                        {
                                            name:'驴妈妈',
                                            type:'line',
                                            stack: '总量',
                                            data:[820, 932, 901, 934, 1290, 1330, 1320,1200,1300]
                                        }
                                    ]
                                };

						        // 使用刚指定的配置项和数据显示图表。
						        myChart.setOption(option);


						    </script>
							
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