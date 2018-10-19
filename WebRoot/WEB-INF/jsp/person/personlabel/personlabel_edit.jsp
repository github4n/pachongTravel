<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-55" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/person/personlabel/personlabel_edit.jsp">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-55" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/person/personlabel/personlabel_edit.jsp">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="personlabel/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PERSONLABEL_ID" id="PERSONLABEL_ID" value="${pd.PERSONLABEL_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注1:</td>
								<td><input type="number" name="ID" id="ID" value="${pd.ID}" maxlength="32" placeholder="这里输入备注1" title="备注1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注2:</td>
								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="20" placeholder="这里输入备注2" title="备注2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注3:</td>
								<td><input type="number" name="USERNUM" id="USERNUM" value="${pd.USERNUM}" maxlength="32" placeholder="这里输入备注3" title="备注3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注4:</td>
								<td><input type="number" name="USERAGE" id="USERAGE" value="${pd.USERAGE}" maxlength="32" placeholder="这里输入备注4" title="备注4" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注5:</td>
								<td><input type="text" name="USERLABEL" id="USERLABEL" value="${pd.USERLABEL}" maxlength="20" placeholder="这里输入备注5" title="备注5" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注6:</td>
								<td><input class="span10 date-picker" name="CREATEDATE" id="CREATEDATE" value="${pd.CREATEDATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="备注6" title="备注6" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#ID").val()==""){
				$("#ID").tips({
					side:3,
		            msg:'请输入备注1',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ID").focus();
			return false;
			}
			if($("#USERNAME").val()==""){
				$("#USERNAME").tips({
					side:3,
		            msg:'请输入备注2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERNAME").focus();
			return false;
			}
			if($("#USERNUM").val()==""){
				$("#USERNUM").tips({
					side:3,
		            msg:'请输入备注3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERNUM").focus();
			return false;
			}
			if($("#USERAGE").val()==""){
				$("#USERAGE").tips({
					side:3,
		            msg:'请输入备注4',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERAGE").focus();
			return false;
			}
			if($("#USERLABEL").val()==""){
				$("#USERLABEL").tips({
					side:3,
		            msg:'请输入备注5',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERLABEL").focus();
			return false;
			}
			if($("#CREATEDATE").val()==""){
				$("#CREATEDATE").tips({
					side:3,
		            msg:'请输入备注6',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATEDATE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>