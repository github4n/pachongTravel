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
<body class="no-skin" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-119" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/weixin/key/key_edit.jsp">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-119" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/weixin/key/key_edit.jsp">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="key/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="KEY_ID" id="KEY_ID" value="${pd.KEY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公众号:</td>
								<td>
									<c:if test="${msg == 'save'}">
									<input type="text" name="WXUSERNAME" id="WXUSERNAME" value="${pd.WXUSERNAME}" maxlength="100" placeholder="这里输入公众号" title="公众号" style="width:98%;"/>
									</c:if>
									<c:if test="${msg == 'edit'}">
									${pd.WXUSERNAME}
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用户名:</td>
								<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME}" maxlength="100" placeholder="这里输入用户名" title="用户名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">appid:</td>
								<td><input type="text" name="APPID" id="APPID" value="${pd.APPID}" maxlength="100" placeholder="这里输入appid" title="appid" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">appsecret:</td>
								<td><input type="text" name="APPSECRET" id="APPSECRET" value="${pd.APPSECRET}" maxlength="100" placeholder="这里输入appsecret" title="appsecret" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="BZ" id="BZ" value="${pd.BZ}" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
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
			if($("#USERNAME").val()==""){
				$("#USERNAME").tips({
					side:3,
		            msg:'请输入用户名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERNAME").focus();
			return false;
			}
			if($("#APPID").val()==""){
				$("#APPID").tips({
					side:3,
		            msg:'请输入appid',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#APPID").focus();
			return false;
			}
			if($("#APPSECRET").val()==""){
				$("#APPSECRET").tips({
					side:3,
		            msg:'请输入appsecret',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#APPSECRET").focus();
			return false;
			}
			if($("#BZ").val()==""){
				$("#BZ").tips({
					side:3,
		            msg:'请输入备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BZ").focus();
			return false;
			}
			if($("#WXUSERNAME").val()==""){
				$("#WXUSERNAME").tips({
					side:3,
		            msg:'请输入公众号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WXUSERNAME").focus();
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