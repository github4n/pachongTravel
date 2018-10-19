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

	<script src="static/ace/js/date-time/moment.js"></script>
	<script src="static/ace/js/date-time/bootstrap-datetimepicker.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="static/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="static/ace/css/font-awesome.css" />
		<link rel="stylesheet" href="static/ace/css/ace-fonts.css" />
		<link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		<!-- ace settings handler -->
		<script src="static/ace/js/ace-extra.js"></script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-5" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/bigdata/bikedaycnt/bikedaycnt_list.jsp">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-5" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/bigdata/bikedaycnt/bikedaycnt_list.jsp">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">首页</a>
							</li>

							<li>
								<a href="#">大数据展示</a>
							</li>

							<li>
								<a href="#">景区观光单车</a>
							</li>
						</ul><!-- /.breadcrumb -->

						<!-- /section:basics/content.searchbox -->
					</div>

					<!-- /section:basics/content.breadcrumbs -->
					<div class="page-content">
						<div class="page-content">
						<form action="bikedaycnt/list.do" method="post" name="Form" id="Form">
						
						<div class="row">
							<div class="col-xs-12">
							<p>
								<div class="form-group">
									<label class="control-label bolder blue">自定义日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>起始日期：
									<input class="span10 date-picker" name="startDate" id="startDate"  value="${pd.startDate}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:188px;" placeholder="开始日期"/>
									<input type="hidden" id="dtp_input_startDate" value="" />
									结束日期：
									<input class="span10 date-picker" name="endDate" id="endDate"  value="${pd.endDate}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:188px;" placeholder="结束日期"/>
									<input type="hidden" id="dtp_input_endDate" value="" />
								</div>
							</p>
								
							</div>
						</div>
				
					<div class="row">
							<div class="col-xs-12">
						<!-- 检索  -->
							<p><div class="form-group">
									<label class="control-label bolder blue">常用日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<input type="radio" name="radio" value="1" />当日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="radio" value="2" />昨日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="radio" value="3" checked />当月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="radio" value="4" />上月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="radio" value="4" />当年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="radio" value="4" />去年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="radio" value="4" />历史&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-white btn-info btn-bold">
										<i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
										一键查询
									</button>
								</div>
							</p>
							</div>
						</div>
					
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-xs-12">
										<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
														<label class="pos-rel">
															<span class="lbl"></span>
														</label>
													</th>
													<th>骑行总次数</th>
													<th>日均骑行次数</th>
													<th>单日最多骑行次数</th>

													<th>骑行总时长</th>
													<th>日均骑行时长</th>

													<th>单日最多骑行时长</th>
													<th>平均每次骑行时长</th>
												</tr>
											</thead>

											<tbody>
												<tr>
													<td class="center">
														<label class="pos-rel">
															<span class="lbl">历史累计</span>
														</label>
													</td>
													<td>
														<a href="#">ace.com</a>
													</td>
													<td>$45</td>
													<td class="hidden-480">3,330</td>
													<td>Feb 12</td>
													<td class="hidden-480">3,330</td>
													<td class="hidden-480">3,330</td>
													<td class="hidden-480">3,330</td>
												</tr>

												<tr>
													<td class="center">
														<label class="pos-rel">
															<span class="lbl">时间段内</span>
														</label>
													</td>
													<td>
														<a href="#">base.com</a>
													</td>
													<td>$35</td>
													<td class="hidden-480">2,595</td>
													<td>Feb 18</td>
													<td class="hidden-480">3,330</td>
													<td class="hidden-480">3,330</td>
													<td class="hidden-480">3,330</td>
												</tr>

											</tbody>
										</table>
									</div><!-- /.span -->
								</div>

								<hr />
								<div class="row">
									

									<div class="col-sm-6">
										<div class="row">
											<div class="col-xs-12">
												<div class="widget-box">
													<div class="widget-header widget-header-flat">
														<h4 class="widget-title smaller">骑行时长</h4>
													</div>

													<div class="widget-body">
														<div id="ridetmChart" style="width: 800px;height:300px;"></div>
													</div>
												</div>
											</div>
										</div>

										<div class="space-6"></div>

										<div class="row">
											<div class="col-xs-12">
												<div class="widget-box">
													<div class="widget-header widget-header-flat">
														<h4 class="widget-title smaller">骑行时间段次数分布图</h4>
													</div>

													<div class="widget-body">
														<div id="timecntChart" style="width: 800px;height:300px;"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-sm-6">
										<div class="widget-box">
											<div class="widget-header widget-header-flat">
												<h4 class="widget-title smaller">骑行时间段次数分布图</h4>
											</div>

											<div class="widget-body">
														<div id="areaChart" style="width: 800px;height:660px;"></div>
											</div>
										</div>
									</div>
									</div>
								</div><!-- PAGE CONTENT ENDS -->
								
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
$('.date-picker').datepicker({autoclose: true,todayHighlight: true});

		// 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('timecntChart'));

        // 指定图表的配置项和数据
		var option = {
            tooltip: {},
            xAxis: {
                data: ${pd.xJson.xData },
            },
            yAxis: {},
            series: [
               {
                name: '${pd.yJson.name }',
                type: 'bar',
                data: ${pd.yJson.yData },
                itemStyle: {
                    normal: {
                        color: '#87B87F'
                    }
                }
               }
            ]
        };	        

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        
        
     // 基于准备好的dom，初始化echarts实例
        var ridetmChart = echarts.init(document.getElementById('ridetmChart'));

        // 指定图表的配置项和数据
		var rideTmoption = {
            tooltip: {},
            xAxis: {
                data: ${pd.xJson.xData },
            },
            yAxis: {},
            series: [
               {
                name: '${pd.zJson.name }',
                type: 'line',
                data: ${pd.zJson.zData },
                itemStyle: {
                    normal: {
                        color: '#6FB3E0'
                    }
                }
               }
            ]
        };	        

        // 使用刚指定的配置项和数据显示图表。
        ridetmChart.setOption(rideTmoption);
        
        //时段分布图
        var areaChart = echarts.init(document.getElementById('areaChart'));
        var data = [[0,0,5],[0,1,1],[0,2,0],[0,3,0],[0,4,0],[0,5,0],[0,6,0],[0,7,0],[0,8,0],[0,9,0],[0,10,0],[0,11,2],[0,12,4],[0,13,1],[0,14,1],[0,15,3],[0,16,4],[0,17,6],[0,18,4],[0,19,4],[0,20,3],[0,21,3],[0,22,2],[0,23,5],[1,0,7],[1,1,0],[1,2,0],[1,3,0],[1,4,0],[1,5,0],[1,6,0],[1,7,0],[1,8,0],[1,9,0],[1,10,5],[1,11,2],[1,12,2],[1,13,6],[1,14,9],[1,15,11],[1,16,6],[1,17,7],[1,18,8],[1,19,12],[1,20,5],[1,21,5],[1,22,7],[1,23,2],[2,0,1],[2,1,1],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[2,6,0],[2,7,0],[2,8,0],[2,9,0],[2,10,3],[2,11,2],[2,12,1],[2,13,9],[2,14,8],[2,15,10],[2,16,6],[2,17,5],[2,18,5],[2,19,5],[2,20,7],[2,21,4],[2,22,2],[2,23,4],[3,0,7],[3,1,3],[3,2,0],[3,3,0],[3,4,0],[3,5,0],[3,6,0],[3,7,0],[3,8,1],[3,9,0],[3,10,5],[3,11,4],[3,12,7],[3,13,14],[3,14,13],[3,15,12],[3,16,9],[3,17,5],[3,18,5],[3,19,10],[3,20,6],[3,21,4],[3,22,4],[3,23,1],[4,0,1],[4,1,3],[4,2,0],[4,3,0],[4,4,0],[4,5,1],[4,6,0],[4,7,0],[4,8,0],[4,9,2],[4,10,4],[4,11,4],[4,12,2],[4,13,4],[4,14,4],[4,15,14],[4,16,12],[4,17,1],[4,18,8],[4,19,5],[4,20,3],[4,21,7],[4,22,3],[4,23,0],[5,0,2],[5,1,1],[5,2,0],[5,3,3],[5,4,0],[5,5,0],[5,6,0],[5,7,0],[5,8,2],[5,9,0],[5,10,4],[5,11,1],[5,12,5],[5,13,10],[5,14,5],[5,15,7],[5,16,11],[5,17,6],[5,18,0],[5,19,5],[5,20,3],[5,21,4],[5,22,2],[5,23,0],[6,0,1],[6,1,0],[6,2,0],[6,3,0],[6,4,0],[6,5,0],[6,6,0],[6,7,0],[6,8,0],[6,9,0],[6,10,1],[6,11,0],[6,12,2],[6,13,1],[6,14,3],[6,15,4],[6,16,0],[6,17,0],[6,18,0],[6,19,0],[6,20,1],[6,21,2],[6,22,2],[6,23,6]];
        data = data.map(function (item) {
            return [item[1], item[0], item[2] || '-'];
        });

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
        	        type: 'category',
        	        data: ['12a', '1a', '2a', '3a', '4a', '5a', '6a','7a', '8a', '9a','10a','11a','12p', '1p', '2p', '3p', '4p', '5p','6p', '7p', '8p', '9p', '10p', '11p'],
        	        splitArea: {
        	            show: true
        	        }
        	    },
        	    yAxis: {
        	        type: 'category',
        	        data:  ['Saturday', 'Friday', 'Thursday','Wednesday', 'Tuesday', 'Monday', 'Sunday'],
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
        	        data: data,
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