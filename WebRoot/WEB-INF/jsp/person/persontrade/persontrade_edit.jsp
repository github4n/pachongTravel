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
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="persontrade/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="PERSONTRADE_ID" id="PERSONTRADE_ID" value="${pd.PERSONTRADE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注1:</td>
								<td><input type="number" name="ID" id="ID" value="${pd.ID}" maxlength="32" placeholder="这里输入备注1" title="备注1" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注2:</td>
								<td><input type="number" name="MOBILE" id="MOBILE" value="${pd.MOBILE}" maxlength="32" placeholder="这里输入备注2" title="备注2" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注3:</td>
								<td><input type="text" name="AGE" id="AGE" value="${pd.AGE}" maxlength="20" placeholder="这里输入备注3" title="备注3" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注4:</td>
								<td><input type="text" name="GENDER" id="GENDER" value="${pd.GENDER}" maxlength="50" placeholder="这里输入备注4" title="备注4" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注5:</td>
								<td><input type="text" name="PROVINCENAME" id="PROVINCENAME" value="${pd.PROVINCENAME}" maxlength="50" placeholder="这里输入备注5" title="备注5" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注6:</td>
								<td><input type="text" name="CITYNAME" id="CITYNAME" value="${pd.CITYNAME}" maxlength="50" placeholder="这里输入备注6" title="备注6" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注7:</td>
								<td><input type="text" name="MARRYSTATUS" id="MARRYSTATUS" value="${pd.MARRYSTATUS}" maxlength="50" placeholder="这里输入备注7" title="备注7" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注8:</td>
								<td><input type="text" name="LSHAVEKIDS" id="LSHAVEKIDS" value="${pd.LSHAVEKIDS}" maxlength="50" placeholder="这里输入备注8" title="备注8" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注9:</td>
								<td><input type="number" name="T_ORDERNUM_TOTAL" id="T_ORDERNUM_TOTAL" value="${pd.T_ORDERNUM_TOTAL}" maxlength="32" placeholder="这里输入备注9" title="备注9" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注10:</td>
								<td><input type="number" name="T_ORDERNUM_1M" id="T_ORDERNUM_1M" value="${pd.T_ORDERNUM_1M}" maxlength="32" placeholder="这里输入备注10" title="备注10" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注11:</td>
								<td><input type="number" name="T_ORDERNUM_3M" id="T_ORDERNUM_3M" value="${pd.T_ORDERNUM_3M}" maxlength="32" placeholder="这里输入备注11" title="备注11" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注12:</td>
								<td><input class="span10 date-picker" name="T_ORDERNUM_FIRST" id="T_ORDERNUM_FIRST" value="${pd.T_ORDERNUM_FIRST}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="备注12" title="备注12" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注13:</td>
								<td><input class="span10 date-picker" name="T_ORDERNUM_LAST" id="T_ORDERNUM_LAST" value="${pd.T_ORDERNUM_LAST}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="备注13" title="备注13" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注14:</td>
								<td><input type="number" name="T_TICKETNUM_TOTAL" id="T_TICKETNUM_TOTAL" value="${pd.T_TICKETNUM_TOTAL}" maxlength="32" placeholder="这里输入备注14" title="备注14" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注15:</td>
								<td><input type="text" name="T_TICKETNUM_AVG" id="T_TICKETNUM_AVG" value="${pd.T_TICKETNUM_AVG}" maxlength="12" placeholder="这里输入备注15" title="备注15" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注16:</td>
								<td><input type="text" name="T_AMOUNT_TOTAL" id="T_AMOUNT_TOTAL" value="${pd.T_AMOUNT_TOTAL}" maxlength="11" placeholder="这里输入备注16" title="备注16" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注17:</td>
								<td><input type="text" name="T_AMOUNT_AVG" id="T_AMOUNT_AVG" value="${pd.T_AMOUNT_AVG}" maxlength="11" placeholder="这里输入备注17" title="备注17" style="width:98%;"/></td>
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
			if($("#MOBILE").val()==""){
				$("#MOBILE").tips({
					side:3,
		            msg:'请输入备注2',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MOBILE").focus();
			return false;
			}
			if($("#AGE").val()==""){
				$("#AGE").tips({
					side:3,
		            msg:'请输入备注3',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AGE").focus();
			return false;
			}
			if($("#GENDER").val()==""){
				$("#GENDER").tips({
					side:3,
		            msg:'请输入备注4',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GENDER").focus();
			return false;
			}
			if($("#PROVINCENAME").val()==""){
				$("#PROVINCENAME").tips({
					side:3,
		            msg:'请输入备注5',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROVINCENAME").focus();
			return false;
			}
			if($("#CITYNAME").val()==""){
				$("#CITYNAME").tips({
					side:3,
		            msg:'请输入备注6',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CITYNAME").focus();
			return false;
			}
			if($("#MARRYSTATUS").val()==""){
				$("#MARRYSTATUS").tips({
					side:3,
		            msg:'请输入备注7',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MARRYSTATUS").focus();
			return false;
			}
			if($("#LSHAVEKIDS").val()==""){
				$("#LSHAVEKIDS").tips({
					side:3,
		            msg:'请输入备注8',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LSHAVEKIDS").focus();
			return false;
			}
			if($("#T_ORDERNUM_TOTAL").val()==""){
				$("#T_ORDERNUM_TOTAL").tips({
					side:3,
		            msg:'请输入备注9',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#T_ORDERNUM_TOTAL").focus();
			return false;
			}
			if($("#T_ORDERNUM_1M").val()==""){
				$("#T_ORDERNUM_1M").tips({
					side:3,
		            msg:'请输入备注10',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#T_ORDERNUM_1M").focus();
			return false;
			}
			if($("#T_ORDERNUM_3M").val()==""){
				$("#T_ORDERNUM_3M").tips({
					side:3,
		            msg:'请输入备注11',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#T_ORDERNUM_3M").focus();
			return false;
			}
			if($("#T_ORDERNUM_FIRST").val()==""){
				$("#T_ORDERNUM_FIRST").tips({
					side:3,
		            msg:'请输入备注12',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#T_ORDERNUM_FIRST").focus();
			return false;
			}
			if($("#T_ORDERNUM_LAST").val()==""){
				$("#T_ORDERNUM_LAST").tips({
					side:3,
		            msg:'请输入备注13',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#T_ORDERNUM_LAST").focus();
			return false;
			}
			if($("#T_TICKETNUM_TOTAL").val()==""){
				$("#T_TICKETNUM_TOTAL").tips({
					side:3,
		            msg:'请输入备注14',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#T_TICKETNUM_TOTAL").focus();
			return false;
			}
			if($("#T_TICKETNUM_AVG").val()==""){
				$("#T_TICKETNUM_AVG").tips({
					side:3,
		            msg:'请输入备注15',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#T_TICKETNUM_AVG").focus();
			return false;
			}
			if($("#T_AMOUNT_TOTAL").val()==""){
				$("#T_AMOUNT_TOTAL").tips({
					side:3,
		            msg:'请输入备注16',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#T_AMOUNT_TOTAL").focus();
			return false;
			}
			if($("#T_AMOUNT_AVG").val()==""){
				$("#T_AMOUNT_AVG").tips({
					side:3,
		            msg:'请输入备注17',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#T_AMOUNT_AVG").focus();
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