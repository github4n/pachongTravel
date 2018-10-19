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

<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-13" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/bike/bikeridetm/bikeridetm_list.jsp">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-13" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/bike/bikeridetm/bikeridetm_list.jsp">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<!-- #section:basics/content.breadcrumbs -->
		

			<!-- /section:basics/content.breadcrumbs -->
			<div class="page-content">
				<div class="page-content">
					<form action="bikeridetm/list.do" method="post" name="Form" id="Form">

						<div class="row date-box">
								<div class="col-xs-6">
									<div class="form-group choose-time">
										<div class="choose-box" data-index="0">
											<input id="checkbox1" type="radio" name="time" checked="checked">
											<label for="checkbox1">今日</label>
										</div>
										<div class="choose-box" data-index="1">
											<input id="checkbox1" type="radio" name="time">
											<label for="checkbox1">最近7天</label>
										</div>
										<div class="choose-box" data-index="2">
											<input id="checkbox1" type="radio" name="time">
											<label for="checkbox1">最近30天</label>
										</div>
										
										<input type="hidden" id="insertData" name="type" value="">
										
									</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group choose-date">
										<label for="startDate">起始日期</label>
										<input class="span10 date-picker" name="startTime" id="startDate"  value="${pd.startDate}" type="text"  readonly="readonly"  placeholder="开始日期"/>
										<input type="hidden" id="dtp_input_startDate" value="" />
										<br>
										<label for="endDate">结束日期</label>
										<input class="span10 date-picker" name="endTime" id="endDate"  value="${pd.endDate}" type="text"  readonly="readonly"  placeholder="结束日期"/>
										<input type="hidden" id="dtp_input_endDate" value="" />
										<button class="btn-search" onclick="gsearch();">
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
												<h4 class="widget-title smaller">骑行轨迹分析</h4>
											</div>

											<div class="widget-body">
												<div id="main" style="width: 100%;height:500px;margin:0 auto"></div>
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
<!-- 百度echarts -->
<script src="static/echarts/echarts.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/require.js"></script>
<!-- <script src="static/js/example.js"></script> -->

<!-- <script src="static/echarts/echarts.js"></script> -->

<!-- <script src="http://api.map.baidu.com/api?v=2.0&ak=53oVIOqmSIejwV7EfphPqTynOZbIiVYu"></script> -->
<!-- <script src="static/js/jquery.min.js"></script> -->

<!-- <script src="static/js/example.js"></script> -->
<!-- <script src="http://api.map.baidu.com/api?v=2.0&ak=fC8zClpT1ZYe03RDGcNwMhdSZSmQZOyh"></script> -->
<script type="text/javascript">
(function () {
    require.config({
        paths: {
            echarts: 'static/echarts',
        },
       
    });

    require(
    [
        "echarts",
        "echarts/chart/main",
        "echarts/chart/map"
    ],
    function (echarts, BMapExtension) {
        // $('#main').css({
        //     height:$('body').height(),
        //     width: $('body').width()
        // });

        // 初始化地图
        var BMapExt = new BMapExtension($('#main')[0], BMap, echarts,{
            enableMapClick: false
        });
        var map = BMapExt.getMap();
        var container = BMapExt.getEchartsContainer();

        var startPoint = {
            x: 121.67291404807811, 
            y: 31.14918372801515
        };

        var point = new BMap.Point(startPoint.x, startPoint.y);
        map.centerAndZoom(point, 16);
        map.enableScrollWheelZoom(true);
        // 地图自定义样式
        

        option = {
            color: ['gold','aqua','lime'],
            title : {
                text: '爬虫旅游',
                subtext:'',
                x:'right'
            },
            tooltip : {
                trigger: 'item',
                formatter: function (v) {
                    return v[1].replace(':', ' > ');
                }
            },
            legend: {
                orient: 'vertical',
                x:'left',
                data:['薰衣草园'],
                selectedMode: 'single'
                
            },
            toolbox: {
                show : true,
                orient : 'vertical',
                x: 'right',
                y: 'center',
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            dataRange: {
                min : 0,
                max : 100,
                y: '60%',
                calculable : true,
                color: ['#ff3333', 'orange', 'yellow','lime','aqua']
            },
            series : [
                {
                    name:'薰衣草园',
                    type:'map',
                    mapType: 'none',
                    data:[],
                    geoCoord: {
						'香草园广场':[121.669708,31.1451],
						'香草园入口':[121.6070058,31.144765],
						'香草园出口':[121.669668,31.144444],
						'薰衣草园':[121.670582,31.143744],
						'模纹园艺':[121.669838,31.144261],
						'玫瑰园':[121.669502,31.143634],
						'景观草坪':[121.670008,31.14166],
						'生态园广场':[121.669137,31.145888],
						'光明生态园出入口':[121.669762,31.147493],
						'邻家大草坪':[121.66933,31.148146],
						'骑行之家':[121.66899,31.148983],
						'邻家农庄':[121.67119,31.148966],
						'邻家烧烤':[121.664753,31.148645],
						'迪艇皮划艇':[121.66516,31.149903],
						'达拉探索营地':[121.66627,31.148483],
						'邻家露营地':[121.669692,31.147913]
                       
                    },
        
                    markLine : {
                        smooth:true,
                        effect : {
                            show: true,
                            scaleSize: 1,
                            period: 30,
                            color: '#fff',
                            shadowBlur: 10
                        },
                        itemStyle : {
                            normal: {
                                borderWidth:1,
                                lineStyle: {
                                    type: 'solid',
                                    shadowBlur: 10
                                }
                            }
                        },
                        data : [
                            [{name:'薰衣草园'}, {name:'迪艇皮划艇',value:90}],
                            [{name:'薰衣草园'}, {name:'景观草坪',value:80}],
                            [{name:'景观草坪'}, {name:'邻家农庄',value:70}],
                            [{name:'邻家烧烤'}, {name:'薰衣草园',value:60}],
                            [{name:'迪艇皮划艇'}, {name:'邻家烧烤',value:50}],
                            [{name:'邻家烧烤'}, {name:'迪艇皮划艇',value:40}],
                            [{name:'薰衣草园'}, {name:'香草园广场',value:10}],
                           [{name:'薰衣草园'}, {name:'邻家农庄',value:90}]
                        ]
                    },
                    markPoint : {
                        symbol:'emptyCircle',
                        symbolSize : function (v){
                            return 10 + v/10
                        },
                        effect : {
                            show: true,
                            shadowBlur : 0
                        },
                        itemStyle:{
                            normal:{
                                label:{show:false}
                            }
                        },
                        data : [
						{name:'香草园广场',value:90},
						{name:'香草园入口',value:90},
						{name:'香草园出口',value:90},
						{name:'薰衣草园',value:90},
						{name:'模纹园艺',value:90},
						{name:'玫瑰园',value:90},
						{name:'景观草坪',value:90},
						{name:'生态园广场',value:90},
						{name:'光明生态园出入口',value:90},
						{name:'邻家大草坪',value:90},
						{name:'骑行之家',value:90},
						{name:'邻家农庄',value:90},
						{name:'邻家烧烤',value:90},
						{name:'迪艇皮划艇',value:90},
						{name:'达拉探索营地',value:90},
						{name:'邻家露营地',value:90}
                        ]
                    }
                    
                },
              
               
                
            ]
        };

        var myChart = BMapExt.initECharts(container);
        window.onresize = myChart.onresize;
        BMapExt.setOption(option);
    }
);
})();
// var myChart = echarts.init(document.getElementById('echart'));
// var option = {
// 	color: ['gold','aqua','lime'],
//     title : {
//         text: '模拟迁徙',
//         subtext:'数据纯属虚构',
//         x:'right'
//     },
//     tooltip : {
//         trigger: 'item',
//         formatter: function (v) {
//             return v[1].replace(':', ' > ');
//         }
//     },
//     legend: {
//         orient: 'vertical',
//         x:'left',
//         data:['薰衣草园', '生态园广场'],
//         selectedMode: 'single',
//         selected:{
//             '生态园广场' : false
//         }
//     },
//     toolbox: {
//         show : true,
//         orient : 'vertical',
//         x: 'right',
//         y: 'center',
//         feature : {
//             mark : {show: true},
//             dataView : {show: true, readOnly: false},
//             restore : {show: true},
//             saveAsImage : {show: true}
//         }
//     },
//     dataRange: {
//         min : 0,
//         max : 100,
//         y: '60%',
//         calculable : true,
//         color: ['#ff3333', 'orange', 'yellow','lime','aqua']
//     },
//     series : [
//         {
//             name:'薰衣草园',
//             type:'map',
//             mapType: 'none',
//             data:[],
//             geoCoord: {
//                 '薰衣草园': [121.670582,31.143744],
//                 '邻家农庄': [121.67119,31.148966],
//               '迪艇皮划艇':[121.66516,31.149903],
//               '香草园入口':[121.6070058,31.144765],
//               '邻家烧烤':[121.664753,31.148645],
//               '香草园广场':[121.669708,31.1451],
//               '景观草坪':[121.670008,31.14166]
//             },

//             markLine : {
//                 smooth:true,
//                 effect : {
//                     show: true,
//                     scaleSize: 1,
//                     period: 30,
//                     color: '#fff',
//                     shadowBlur: 10
//                 },
//                 itemStyle : {
//                     normal: {
//                         borderWidth:1,
//                         lineStyle: {
//                             type: 'solid',
//                             shadowBlur: 10
//                         }
//                     }
//                 },
//                 data : [
//                     [{name:'薰衣草园'}, {name:'迪艇皮划艇',value:90}],
//                     [{name:'薰衣草园'}, {name:'景观草坪',value:80}],
//                     [{name:'景观草坪'}, {name:'邻家农庄',value:70}],
//                     [{name:'邻家烧烤'}, {name:'薰衣草园',value:60}],
//                     [{name:'迪艇皮划艇'}, {name:'邻家烧烤',value:50}],
//                     [{name:'邻家烧烤'}, {name:'迪艇皮划艇',value:40}],
//                     [{name:'薰衣草园'}, {name:'香草园广场',value:10}],
//                    [{name:'薰衣草园'}, {name:'邻家农庄',value:90}]
//                 ]
//             },
//             markPoint : {
//                 symbol:'emptyCircle',
//                 symbolSize : function (v){
//                     return 10 + v/10
//                 },
//                 effect : {
//                     show: true,
//                     shadowBlur : 0
//                 },
//                 itemStyle:{
//                     normal:{
//                         label:{show:false}
//                     }
//                 },
//                 data : [
//                     {name:'薰衣草园',value:90},
//                     {name:'迪艇皮划艇',value:80},
//                     {name:'香草园入口',value:70},
//                     {name:'邻家农庄',value:60},
//                     {name:'邻家烧烤',value:50},
//                     {name:'香草园广场',value:40},
//                   {name:'景观草坪',value:30}
//                 ]
//             }
            
//         },
      
       
        
//     ]
//             };
// myChart.setOption(option);


		$('.choose-box').click(function(event) {
			var event=event||e;
			console.log(event.currentTarget.dataset.index);
			$('#insertData').val(event.currentTarget.dataset.index);
			$("#Form").submit();
		})
    function gsearch(){
        $("#Form").submit();
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
    
    // 使用刚指定的配置项和数据显示图表。
    // myChart.setOption(option);
		/*窗口自适应，关键代码*/
		// setTimeout(function (){
		// 	window.onresize = function () {
		// 		myChart.resize();
		// 	}
		// },200)
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