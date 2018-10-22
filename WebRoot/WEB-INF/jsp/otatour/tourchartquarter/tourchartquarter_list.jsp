<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="static/ace/css/chosen.css"/>
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp" %>

    <!-- 百度echarts -->
    <script type="text/javascript" src="static/ace/js/jquery.js"></script>
    <script src="plugins/echarts/echarts.min.js"></script>

		<!-- 日期框 -->
		<script src="static/laydate/laydate.js"></script>
    <!-- <script src="static/ace/js/jquery-form.js"></script> -->

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="static/ace/css/bootstrap.css"/>
    <link rel="stylesheet" href="static/ace/css/font-awesome.css"/>
    <link rel="stylesheet" href="static/ace/css/ace-fonts.css"/>
    <link rel="stylesheet" href="static/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <!-- 自定义css -->
    <link rel="stylesheet" href="static/ace/css/main.css">
    <style>
		
        ul, li {
            list-style: none;
        }

        ul.control-button {
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;

        }

        ul.control-button li {
					
            padding-top: 10px;
            margin-right: 30px;
            /* background-color: rgba(215, 215, 215, 1); */
        }

        ul.control-button li label {
					font-size: 30px;
					font-weight: bold;
        }	
				
       
    </style>
    <!-- ace settings handler -->
    <script src="static/ace/js/ace-extra.js"></script>

    <script>"undefined" == typeof CODE_LIVE && (!function (e) {
        var t = {nonSecure: "58099", secure: "58108"}, c = {nonSecure: "http://", secure: "https://"},
            r = {nonSecure: "127.0.0.1", secure: "gapdebug.local.genuitec.com"},
            n = "https:" === window.location.protocol ? "secure" : "nonSecure";
        script = e.createElement("script"), script.type = "text/javascript", script.async = !0, script.src = c[n] + r[n] + ":" + t[n] + "/codelive-assets/bundle.js", e.getElementsByTagName("head")[0].appendChild(script)
    }(document), CODE_LIVE = !0);</script>
</head>

<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-44"
      data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/otatour/tourchartday/tourchartday_list.jsp">
<input type="hidden" value="${firstDate}">
<input type="hidden" value="${lastDate}">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-44"
     data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/otatour/tourchartday/tourchartday_list.jsp">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <!-- #section:basics/content.breadcrumbs -->
            

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <div class="page-content">
                    <div class="row">
						<ul class="control-button">
							<li>
									<input id="checkbox1" type="checkbox" checked="checked" value="1">
									<label for="checkbox1">开园：2018年5月19日-2018年6月30日</label>
							</li>
							<li>
								<input id="checkbox2" name="time" type="radio" checked="checked">
								<label for="checkbox2">月</label>
							</li>
							<li>
									<input id="checkbox3" name="time" type="radio">
									<label for="checkbox3">天</label>
							</li>
							<li class="date-picker">
									<input id="checkbox4" name="time" type="radio">
									<label for="checkbox4" id="hour">小时</label>

									<div id="test1" style="visibility:hidden;"></div>
							</li>
						</ul>
                    </div>

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="row">

                                <div class="col-sm-12">
                                    <div class="widget-box">
                                        <div class="widget-header widget-header-flat">
                                            <!-- <h4 class="widget-title smaller" >${pd.selDate}</h4> -->
                                            <h4 class="widget-title smaller">
												<strong id="timeTitle">最近一个季度</strong>入园人数走势图
											</h4>
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
<form action="tourchartday/list.do" method="post" name="Form" id="Form">
    <input type="hidden" name="dayDate" id="dayDate" value="">
    <input type="hidden" name="selectedVal" id="selectedVal" value="1">
</form>
<script type="text/javascript">

    //点击事件
    // function toSubmit() {
    //     console.log('表单提交');
        
    //     $("#Form").submit();
    // }
		$("#checkbox1").change(function () {
			if (this.checked) {
					console.log('勾选');
					$("#selectedVal").val(1);
					
			} else {
					console.log('取消勾选');
					$("#selectedVal").val(0);
					
			}
			getThreeMonths();															
			
		});
		$("#checkbox2").change(function () {
			if (this.checked) {
				console.log('勾选月');
				$("#timeTitle").text('最近一个季度');
				getThreeMonths();	
			}
		});	
				
		$("#checkbox3").change(function () {
			if (this.checked) {
				console.log('勾选天');
				$("#timeTitle").text('最近一个季度');
				getNinetyDays();
			}
		});

		$("#hour").on("click",function(){
			console.log('点击小时');
			setTimeout(function(){$('#test1').trigger('click');},200);
			
		});
		// ajax 方式
		function getThreeMonths() {
			console.log('表单提交');
			console.log($('#Form').serialize());
			$.ajax({
					type: "POST",                  //提交方式
					dataType: "json",              //预期服务器返回的数据类型
					url: "/ZHLY/tourchartquarter/getThreeMonths" ,          //目标url
					data: $('#Form').serialize(), //提交的数据
					success: function (result) {
						console.log(result);       //打印服务端返回的数据(调试用)
						let xData =  result.data.map(function(item) {return item['month'].substring(5)}),
						yData = result.data.map(function(item) {return item['tournum']}),
						yyData = result.data.map(function(item) {return item['avgnum']});
						
						reloadEcharts(xData,yData,yyData);	
					},
					error : function(error) {
							console.log(error);
					}
			});
    }
		function getList() {
			console.log('表单提交');
			console.log($('#Form').serialize());
			$.ajax({
					type: "POST",                  //提交方式
					dataType: "json",              //预期服务器返回的数据类型
					url: "/ZHLY/tourchartday/getSevenDays" ,          //目标url
					data: $('#Form').serialize(), //提交的数据
					success: function (result) {
						console.log(result);       //打印服务端返回的数据(调试用)
						let xData =  result.data.map(function(item) {return item['date']}),
						yData = result.data.map(function(item) {return item['tournum']}),
						yyData = result.data.map(function(item) {return item['avgnum']});
						
						reloadEcharts(xData,yData,yyData);	
					},
					error : function(error) {
							console.log(error);
					}
			});
    }
		function getNinetyDays(){
			console.log('表单提交');
			console.log($('#Form').serialize());
			$.ajax({
					type: "POST",                  //提交方式
					dataType: "json",              //预期服务器返回的数据类型
					url: "/ZHLY/tourchartquarter/getNinetyDays" ,          //目标url
					data: $('#Form').serialize(), //提交的数据
					success: function (result) {
						console.log(result);       //打印服务端返回的数据(调试用)
						let xData =  result.data.map(function(item) {return item['date'].substring(5)}),
						yData = result.data.map(function(item) {return item['tournum']}),
						yyData = result.data.map(function(item) {return item['avgnum']});
						
						reloadEcharts(xData,yData,yyData);	
					},
					error : function(error) {
							console.log(error);
					}
			});
		}
		function getdayDate() {
			console.log('表单提交');
			console.log($('#Form').serialize());
			$.ajax({
					type: "POST",                  //提交方式
					dataType: "json",              //预期服务器返回的数据类型
					url: "/ZHLY/tourchartday/getdayDate" ,          //目标url
					data: $('#Form').serialize(), //提交的数据
					success: function (result) {
						console.log(result);       //打印服务端返回的数据(调试用)
						let xData =  result.data.map(function(item) {return item['tmareas']}),
						yData = result.data.map(function(item) {return item['tournum']}),
						yyData = result.data.map(function(item) {return item['avgnum']});
						
						reloadEcharts(xData,yData,yyData);		
					},
					error : function(error) {
							console.log(error);
					}
			});
    }
    //点击事件

    // function gsearchTicheDate(own) {

    //  var selDate = $(own).find('.infobox-content').html();
    // $("#selDateTxt").val(own);
    // $("#Form").submit();
    // }
    // $(document).ready(function () {
    //     var options = {
    //         //需要刷新的区域id
    //         target: '#timecntChart',
    //     };
    //     //绑定FORM提交事件
    //     $('#Form').submit(function () {
    //         $(this).ajaxSubmit(options);
    //         return false;
    //     });
				
				
    // });
		laydate.render({
			elem: '#test1'//指定元素
			,trigger: 'click' //采用click弹出"
			,value: '2018-06-01' 
			,min: '2018-04-01'
			,max: '2018-06-30'
			,done: function(value, date, endDate){
    		console.log(value); //得到日期生成的值，如：2017-08-18
				$("#dayDate").val(value);
				$("#timeTitle").text(value);
				getdayDate();
  		}
		});
		
		

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('timecntChart'));

    // 指定图表的配置项和数据
    var option = {
        tooltip: {},
        legend:{
            bottom: 10,
            data:['入园人数','历史平均']
        },
        xAxis: {
					name:'时间',
					data: ${pd.xJson.xData },
        },
        yAxis: {
					name:'人数',
				},
        series: [
            {
                name: '${pd.yJson.yName }',
                type: 'line',
                data: ${pd.yJson.yData },
                itemStyle: {
                    normal: {
                        color: '#16B8BE'
                    }
                }
            },
            {
                name: '${pd.zJson.xName }',
                type: 'line',
                data: ${pd.zJson.yyData },
                itemStyle: {
                    normal: {
                        color: '#F29C47'
                    }
                }
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    /*窗口自适应，关键代码*/
    setTimeout(function () {
        window.onresize = function () {
            myChart.resize();
        }
    }, 200)

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
											color: '#16B8BE'
									}
							}
					},
					{
							name: '${pd.zJson.xName }',
							type: 'line',
							data: yyData ,
							itemStyle: {
									normal: {
											color: '#F29C47'
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
<%@ include file="../../system/index/foot.jsp" %>
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