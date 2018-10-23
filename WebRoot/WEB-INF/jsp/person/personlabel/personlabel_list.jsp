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
	<!-- 日期框 -->
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>

	<script src="static/laydate/laydate.js"></script>
	<!-- 自定义css -->
  <link rel="stylesheet" href="static/ace/css/main.css">
	<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script>
</head>
<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-56" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/person/personlabel/personlabel_list.jsp">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-56" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/person/personlabel/personlabel_list.jsp">
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
											<br>
											<label for="endDate">结束日期</label>
											<input class="span10 date-picker" name="endTime" id="endDate"  value="" type="text"  readonly="readonly"  placeholder="结束日期"/>
											<button class="btn-search" onclick="toSearch()">
												查询
											</button>
										</div>
										
										
									</div>
									
								</div>
							
							<ul class="person">
									
								<li class="person-label">
									<section class="user-photo">
										<h1>男性白领游客</h1>
										<img src="static/images/user1.png" alt="">
									</section>
									<section class="user-data">
											<div class="user-data-top" id="male">
												<div class="num">
													<h3>用户数</h3>

													<c:choose>
														<c:when test="${hqmg.userNumber !=null}">
															<h3>${hqmg.userNumber} </h3>
														</c:when>
														<c:otherwise>
															<h3>0</h3>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="perc">
													<h3>占比</h3>

													<c:choose>
														<c:when test="${hqmg.proportion !=null}">
															<h3>${hqmg.proportion} %</h3>
														</c:when>
														<c:otherwise>
															<h3>0</h3>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<ul>
												
												<li class="user-label">
													25-30岁
												</li>
												<li class="user-label">
													男
												</li>
												<li class="user-label">
													上海
												</li>
												
												<li class="user-label">
													消费指数-高
												</li>

											</ul>
									</section>
								</li>
								
								<li class="person-label">
									<section class="user-photo">
										<h1>女性白领游客</h1>
										<img src="static/images/user2.png" alt="">
									</section>
									<section class="user-data">
											<div class="user-data-top" id="female">
												<div class="num">
													<h3>用户数</h3>

													<c:choose>
														<c:when test="${hqfg.userNumber !=null}">
															<h3>${hqfg.userNumber} </h3>
														</c:when>
														<c:otherwise>
															<h3>0</h3>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="perc">
													<h3>占比</h3>

													<c:choose>
														<c:when test="${hqfg.proportion !=null}">
															<h3>${hqfg.proportion}% </h3>
														</c:when>
														<c:otherwise>
															<h3>0</h3>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<ul>
												
												<li class="user-label">
													25-30岁
												</li>
												<li class="user-label">
													女
												</li>
												<li class="user-label">
													上海
												</li>
												
												<li class="user-label">
													消费指数-高
												</li>

											</ul>
									</section>
								</li>

								<li class="person-label">
									<section class="user-photo">
										<h1> 老年游客</h1>
										<img src="static/images/user3.png" alt="">
									</section>
									<section class="user-data">
										<div class="user-data-top" id="old">
											<div class="num">
												<h3>用户数</h3>
	
												<c:choose>
													<c:when test="${etg.userNumber !=null}">
														<h3>${etg.userNumber} </h3>
													</c:when>
													<c:otherwise>
														<h3>0</h3>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="perc">
												<h3>占比</h3>
	
												<c:choose>
													<c:when test="${etg.proportion !=null}">
														<h3>${etg.proportion} %</h3>
													</c:when>
													<c:otherwise>
														<h3>0</h3>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<ul>
											<li class="user-label">
												50-70岁
											</li>
											<li class="user-label">
												上海
											</li>
											
											
	
										</ul>
									</section>
								</li>

								<li class="person-label">
									<section class="user-photo">
										<h1>亲子游</h1>
										<img src="static/images/user4.png" alt="">
									</section>
									<section class="user-data">
											<div class="user-data-top" id="children">
												<div class="num">
													<h3>用户数</h3>

													<c:choose>
														<c:when test="${pctg.userNumber !=null}">
															<h3>${pctg.userNumber} </h3>
														</c:when>
														<c:otherwise>
															<h3>0</h3>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="perc">
													<h3>占比</h3>

													<c:choose>
														<c:when test="${pctg.proportion !=null}">
															<h3>${pctg.proportion}% </h3>
														</c:when>
														<c:otherwise>
															<h3>0</h3>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<ul>
												<li class="user-label">
													25-40岁
												</li>
												<li class="user-label">
													上海
												</li>
												<li class="user-label">
													已婚
												</li>
												<li class="user-label">
													有孩子
												</li>
												<li class="user-label">
													消费指标-高
												</li>

											</ul>
									</section>
								</li>

								<!-- <li class="person-label">
									<section class="user-photo">
										<h1>中年游客类群</h1>
										<img src="static/images/user.png" alt="">
									</section>
									<section class="user-data">
										<div class="user-data-top" id="middle">
											<div class="num">
												<h3>用户数</h3>

												<c:choose>
													<c:when test="${matg.userNumber !=null}">
														<h3>${matg.userNumber} </h3>
													</c:when>
													<c:otherwise>
														<h3>0</h3>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="perc">
												<h3>占比</h3>

												<c:choose>
													<c:when test="${matg.proportion !=null}">
														<h3>${matg.proportion} %</h3>
													</c:when>
													<c:otherwise>
														<h3>0.00% </h3>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<ul>
											<li class="user-label">
												40-60岁
											</li>
											<li class="user-label">
												已婚
											</li>
											<li class="user-label">
												有小孩
											</li>
											<li class="user-label">
												男/女
											</li>

										</ul>
									</section>
								</li> -->

								
								<!-- <li class="person-label">
									<section class="user-photo">
										<h1>穷游类群</h1>
										<img src="static/images/user.png" alt="">
									</section>
									<section class="user-data">
										<div class="user-data-top">
											<div class="num">
												<h3>用户数</h3>

												<c:choose>
													<c:when test="${ptg.userNumber !=null}">
														<h3>${ptg.userNumber} </h3>
													</c:when>
													<c:otherwise>
														<h3>0</h3>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="perc">
												<h3>占比</h3>

												<c:choose>
													<c:when test="${ptg.proportion !=null}">
														<h3>${ptg.proportion} %</h3>
													</c:when>
													<c:otherwise>
														<h3>0.00% </h3>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<ul>
											<li class="user-label">
												非江浙沪地区
											</li>
											<li class="user-label">
												男/女
											</li>
											<li class="user-label">
												未婚
											</li>
											<li class="user-label">
												无小孩
											</li>
											<li class="user-label">
												25-50岁
											</li>
											<li class="user-label">
												消费指数-低
											</li>
										</ul>
									</section>
								</li>
								<li class="person-label">
									<section class="user-photo">
										<h1>职场小白</h1>
										<img src="static/images/user.png" alt="">
									</section>
									<section class="user-data">
										<div class="user-data-top">
											<div class="num">
												<h3>用户数</h3>

												<c:choose>
													<c:when test="${wwg.userNumber !=null}">
														<h3>${wwg.userNumber} </h3>
													</c:when>
													<c:otherwise>
														<h3>0</h3>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="perc">
												<h3>占比</h3>

												<c:choose>
													<c:when test="${wwg.proportion !=null}">
														<h3>${wwg.proportion}% </h3>
													</c:when>
													<c:otherwise>
														<h3>0.00% </h3>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<ul>
											<li class="user-label">
												未婚
											</li>
											<li class="user-label">
												24岁以下
											</li>
											<li class="user-label">
												男/女
											</li>
											<li class="user-label">
												无小孩
											</li>
											<li class="user-label">
												消费指数-高
											</li>

										</ul>
									</section>
								</li>
								<li class="person-label">
									<section class="user-photo">
										<h1>学生群体</h1>
										<img src="static/images/user.png" alt="">
									</section>
									<section class="user-data">
										<div class="user-data-top">
											<div class="num">
												<h3>用户数</h3>

												<c:choose>
													<c:when test="${sg.userNumber !=null}">
														<h3>${sg.userNumber} </h3>
													</c:when>
													<c:otherwise>
														<h3>0</h3>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="perc">
												<h3>占比</h3>

												<c:choose>
													<c:when test="${sg.proportion !=null}">
														<h3>${sg.proportion}% </h3>
													</c:when>
													<c:otherwise>
														<h3>0.00% </h3>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<ul>
											<li class="user-label">
												未婚
											</li>
											<li class="user-label">
												男/女
											</li>
											<li class="user-label">
												16-23岁
											</li>
											<li class="user-label">
												无小孩
											</li>
											<li class="user-label">
												消费指数-高
											</li>

										</ul>
									</section>
								</li>
								<li class="person-label">
									<section class="user-photo">
										<h1>家庭主妇</h1>
										<img src="static/images/user.png" alt="">
									</section>
									<section class="user-data">
										<div class="user-data-top">
											<div class="num">
												<h3>用户数</h3>

												<c:choose>
													<c:when test="${hwg.userNumber !=null}">
														<h3>${hwg.userNumber} </h3>
													</c:when>
													<c:otherwise>
														<h3>0</h3>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="perc">
												<h3>占比</h3>

												<c:choose>
													<c:when test="${hwg.proportion !=null}">
														<h3>${hwg.proportion}%</h3>
													</c:when>
													<c:otherwise>
														<h3>0.00 % </h3>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<ul>
											<li class="user-label">
												已婚
											</li>
											<li class="user-label">
												女
											</li>
											<li class="user-label">
												消费指数-高
											</li>

										</ul>
									</section>
								</li>
								<li class="person-label">
									<section class="user-photo">
										<h1>高端人群</h1>
										<img src="static/images/user.png" alt="">
									</section>
									<section class="user-data">
										<div class="user-data-top">
											<div class="num">
												<h3>用户数</h3>
												<c:choose>
													<c:when test="${hpg.userNumber !=null}">
														<h3>${hpg.userNumber} </h3>
													</c:when>
													<c:otherwise>
														<h3>0 </h3>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="perc">
												<h3>占比</h3>

												<c:choose>
													<c:when test="${hpg.proportion !=null}">
														<h3>${hpg.proportion} %</h3>
													</c:when>
													<c:otherwise>
														<h3>0.00% </h3>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<ul>
											<li class="user-label">
												男/女
											</li>
											<li class="user-label">
												国外旅游人群
											</li>
											<li class="user-label">
												消费指数-高
											</li>

										</ul>
									</section>
								</li> -->

							</ul>
						
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
		type: "POST",  //提交方式
		dataType: "json",  //预期服务器返回的数据类型
		url: "/ZHLY/personlabel/getSegmentation",          //目标url
		data: $('#Form').serialize(), //提交的数据
		success: function (result) {
			console.log(result);       //打印服务端返回的数据(调试用)
			$("#male .num h3:eq(1)").text(result.data.highQualityMaleGroup.userNumber);
			$("#male .perc h3:eq(1)").text(result.data.highQualityMaleGroup.proportion+'%');
			$("#female .num h3:eq(1)").text(result.data.highQualityFemaleGroup.userNumber);
			$("#female .perc h3:eq(1)").text(result.data.highQualityFemaleGroup.proportion+'%');
			$("#old .num h3:eq(1)").text(result.data.elderlyTouristsGroup.userNumber);
			$("#old .perc h3:eq(1)").text(result.data.elderlyTouristsGroup.proportion+'%');
		
			$("#children .num h3:eq(1)").text(result.data.parentChildTourGroup.userNumber);
			$("#children .perc h3:eq(1)").text(result.data.parentChildTourGroup.proportion+'%');
			// $("#middle .num h3:eq(1)").text(result.data.middleAgedTouristsGroup.userNumber);
			// $("#middle .perc h3:eq(1)").text(result.data.middleAgedTouristsGroup.proportion+'%');
			// let xData =  result.data.map((item)=>{return item['ridearea']}),
			// yData = result.data.map((item)=>{return item['sumridenm']});
			// reloadEcharts(xData,yData);		
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


</script>
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
		
		// //检索
		// function tosearch(){
		// 	top.jzts();
		// 	$("#Form").submit();
		// }
		// $('.choose-box').click(function(event) {
		// 	var event=event||e;
		// 	console.log(event.currentTarget.dataset.index);
		// 	$('#insertData').val(event.currentTarget.dataset.index);
		// 	$("#Form").submit();
		// })



		// function gsearch(){
		// 	$("#Form").submit();
		// }

		$(function() {
		
			
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>personlabel/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 tosearch();
					 }else{
						 tosearch();
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>personlabel/delete.do?PERSONLABEL_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						tosearch();
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>personlabel/goEdit.do?PERSONLABEL_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.Modal = true;				//有无遮罩窗口
			 diag. ShowMaxButton = true;	//最大化按钮
		     diag.ShowMinButton = true;		//最小化按钮 
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 tosearch();
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>personlabel/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											tosearch();
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>personlabel/excel.do';
		}
	</script>


</body>
</html>