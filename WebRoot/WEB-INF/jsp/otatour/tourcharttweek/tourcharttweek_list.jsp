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
    <script src="static/ace/js/jquery-form.js"></script>

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
					/*模拟checkbox */
        input[type="checkbox"] + label::before,
				input[type="radio"] + label::before {
            content: "\a0"; /*不换行空格*/
            display: inline-block;
            vertical-align: baseline;
            width: .8em;
            height: .8em;
            margin-right: .2em;
            border-radius: .2em;
            background-color: silver;
            text-indent: .15em;
            line-height: .65; /*行高不加单位，子元素将继承数字乘以自身字体尺寸而非父元素行高*/
        }

        input[type="checkbox"]:checked + label::before,
				input[type="radio"]:checked + label::before{
            content: "\2713";
            background-color: yellowgreen;
        }
				
        input[type="checkbox"],
				input[type="radio"] {
            position: absolute;
            clip: rect(0, 0, 0, 0);
        }
				
        input[type="checkbox"]:focus + label::before,
				input[type="radio"]:focus + label::before {
            box-shadow: 0 0 .1em .1em #58a;
        }

        input[type="checkbox"]:disabled + label::before,
				input[type="radio"]:disabled + label::before{
            background-color: gray;
            box-shadow: none;
            color: #555;
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
															<input id="checkbox1" type="checkbox" checked value="1"/>
															<label for="checkbox1">开园:5月19日-6月30日</label>
														</li>
														<li>
															<input id="checkbox2" name="time" type="radio" checked/>
															<label for="checkbox2">天</label>
														</li>
                            <li class="date-picker">
															<input id="checkbox3" name="time" type="radio"/>
															<label for="checkbox3">小时</label>
														
															<div id="test1" style="visibility:hidden;"></div>

                            </li>
                        </ul>
                    </div>
                    
                    
                    <script>
                        $(document).ready(function () {
                            $(".control-button li").click(function () {
                                $(this).addClass('active').siblings().removeClass('active');

                            });
                        });

                    </script>


                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="row">

                                <div class="col-sm-12">
                                    <div class="widget-box">
                                        <div class="widget-header widget-header-flat">
                                            <!-- <h4 class="widget-title smaller" >${pd.selDate}</h4> -->
                                            <h4 class="widget-title smaller">最近一个月入园人数走势图</h4>
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
<form action="tourchartmonth/list.do" method="post" name="Form" id="Form">
    <input type="hidden" name="dayDate" id="dayDate"/>
    <input type="hidden" name="selectedVal" id="selectedVal" value="1"/>
</form>
<script type="text/javascript">

    //点击事件
    function toSubmit() {
        console.log('表单提交');
        // 这里面可以做表单提交前的验证判断
        $("#Form").submit();
    }

    //点击事件

    // function gsearchTicheDate(own) {

    //  var selDate = $(own).find('.infobox-content').html();
    // $("#selDateTxt").val(own);
    // $("#Form").submit();
    // }
    $(document).ready(function () {
        var options = {
            //需要刷新的区域id
            target: '#timecntChart',
        };
        //绑定FORM提交事件
        $('#Form').submit(function () {
            $(this).ajaxSubmit(options);
            return false;
        });
				$("#checkbox1").change(function () {

					if (this.checked) {
							$("#selectedVal").val(1);
							console.log('勾选');
					} else {
							$("#selectedVal").val(0);
							console.log('取消勾选');
					}
					$("#Form").submit();
				});
				$("#checkbox2").change(function () {

					if (this.checked) {
						//$("#checkbox3").attr("checked", false);
						$("#Form").submit();
					}
				});
				$("#checkbox3").change(function () {

					if (this.checked) {
						//$("#checkbox2").attr("checked", false);	
						$('#test1').click();
					}
				});
    });
		laydate.render({
			elem: '#test1'//指定元素
			,value: '${firstDate}' 
			,min: '${firstDate}'
			,max: '${lastDate}'
			,done: function(value, date, endDate){
    		console.log(value); //得到日期生成的值，如：2017-08-18
				$("#dayDate").val(value);
				$('#Form').submit();
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
            data: ${pd.xJson.xData },
        },
        yAxis: {},
        series: [
            {
                name: '${pd.yJson.yName }',
                type: 'line',
                data: ${pd.yJson.yData },
                itemStyle: {
                    normal: {
                        color: '#87B87F'
                    }
                }
            },
            {
                name: '${pd.zJson.xName }',
                type: 'line',
                data: ${pd.zJson.yyData },
                itemStyle: {
                    normal: {
                        color: '#F2f830'
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
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">
    $(top.hangge());//关闭加载状态
</script>
</body>
</html>