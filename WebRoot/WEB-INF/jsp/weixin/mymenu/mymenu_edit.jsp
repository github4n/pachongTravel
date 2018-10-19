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

<script type="text/javascript" src="static/weixin/jquery.min.js"></script>

<style>
body{ margin:0; padding:0;}
body,html{ width:100%; min-width:1138px;}
ul,li,p,form,h1,h2,h3,h4,h5,dl,dt,dd{ margin:0; padding:0; list-style:none}
i{ font-style:normal}
img { border:0;}
.clr { clear:both;}
.dis { display:none;}
.wx-main {width:950px; height:580px; margin:20px auto; background-color:#fff;float:left;margin-left: 30px;}
.wx-left { width:317px; height:580px; position:relative; display:inline-block; float:left; border:1px solid #cdcdcd; }
.l-top {width:317px; text-align:center;}
.l-fot {width:100%; height:50px; position: absolute; bottom:0px; border-top:1px solid #cdcdcd; background-color:#f5f5f9;}
.l-fot ul { display:inline-block; width:270px; height:50px;}
.l-fot ul li { display:inline-block; width:33%; height:50px; line-height:50px; text-align:center; float:left; box-sizing:border-box; border-left:1px solid #cdcdcd;}
.l-fot ul li:last-of-type {width:34%;}
.l-fot ul li:hover { background-color:#fff; cursor:pointer; border:1px solid #44b548;}
.l-fot-first {background-color:f5f5f9; display:inline-block; width:47px; height:50px; float:left; vertical-align:middle; text-align:center;}
.l-fot-first img { margin:10px;}
.add-lw {width:88px; height: auto; bottom:65px; left:47px; }
.add-l {cursor:pointer; width:89px; height:45px; line-height:45px; border:1px solid #cdcdcd; position:absolute; bottom:65px; left:47px; font-size:30px; text-align:center; font-weight:bold; color:#cdcdcd; background-color:#f5f5f9;}
.add-l img { position:absolute; left:20px; bottom:-10px;}
.add-m {cursor:pointer; width:89px; height:45px; line-height:45px; border:1px solid #cdcdcd; position:absolute; bottom:65px; left:135px; font-size:30px; text-align:center; font-weight:bold; color:#cdcdcd; background-color:#f5f5f9;}
add-mw {width:88px; height: auto; bottom:65px; left:135px; }
.add-m img { position:absolute; left:20px; bottom:-10px;}
.add-r {cursor:pointer; width:89px; height:45px; line-height:45px; border:1px solid #cdcdcd; position:absolute; bottom:65px; left:224px; font-size:30px; text-align:center; font-weight:bold; color:#cdcdcd; background-color:#f5f5f9;}
add-rw {width:88px; height: auto; bottom:65px; left:224px; }
.add-r img { position:absolute; left:20px; bottom:-10px;}
.wx-right { width:620px; height:580px; display:inline-block; float:right; background-color:#f5f5f9;}
.r-top {width:90%; margin:10px auto;}
.r-top p { width:100%; height:40px; border-bottom:1px solid #cdcdcd;}
.r-topl {display:inline-block; width:100px; height:40px; line-height:40px; float:left;}
.r-topr {display:inline-block; width:70px; height:40px; line-height:40px; float:right; color:#01aff0; text-align:right; cursor:pointer;}
.r-name { width:90%; margin:20px auto; height:30px;}
.r-name form label { display:inline-block; width:85px; height:30px; line-height:30px;}
.r-name form input { width:300px; height:30px; border:1px solid #cdcdcd;}
.r-name p {color:#7c7d82; font-size:12px; margin-left:95px; margin-top:5px;}
.r-cont {width:90%; margin:50px auto; height:auto;}
.r-cont p { display:inline-block; width:85px; height:30px; line-height:30px; }
.r-cont .messe { width:100%; height:auto; margin:20px auto;}
.messe p { display:inline-block; width:85px; height:30px; line-height:30px; float:left;}
.messe textarea { width:300px; height:100px; margin-top:8px; margin-left:10px;}
.r-bottom {width:90%; margin:200px auto;}
.r-bottom p { width:100%; height:40px; border-bottom:1px solid #cdcdcd;}

</style>
<script>
var n1=1;
var n2=1;
var n3=1;
var nowid="";
var ermid = "";
$(function(){
	$("#one-a").click(function(){
		$("#titlexx").show();
		$("#otherxx").hide();
		$("#mtitle").html('一级菜单');
		$("#menuname").val($("#M1").val().replace(",fh,",'').replace(",fh,",''));
		nowid = "one-a";
		tid = "table-l";
		$(".add-lw").removeClass("dis");
		$(".add-l").removeClass("dis");
		$(".add-mw, .add-rw").addClass("dis");
		});
	$("#two-a").click(function(){
		$("#titlexx").show();
		$("#otherxx").hide();
		$("#mtitle").html('一级菜单');
		$("#menuname").val($("#M2").val().replace(",fh,",'').replace(",fh,",''));
		nowid = "two-a";
		tid = "table-m";
		$(".add-mw").removeClass("dis");
		$(".add-m").removeClass("dis");
		$(".add-lw, .add-rw").addClass("dis");
		});
	$("#three-a").click(function(){
		$("#titlexx").show();
		$("#otherxx").hide();
		$("#mtitle").html('一级菜单');
		$("#menuname").val($("#M3").val().replace(",fh,",'').replace(",fh,",''));
		nowid = "three-a";
		tid = "table-r";
		$(".add-rw").removeClass("dis");
		$(".add-r").removeClass("dis");
		$(".add-mw, .add-lw").addClass("dis");
		});
	
	$("#add-l-but").click(function(){
		addmenu1();
    });
	
	$("#add-m-but").click(function(){
		addmenu2();
    });
	
	$("#add-r-but").click(function(){
		addmenu3();
    });
	
	//点击单选按钮
	$(function(){
		$("#mes-f").click(function(){
			$("#mes-fx").removeClass("dis");
			$("#mes-lx").addClass("dis");
			$("#mtype").val("click");
			$("#"+nowid).val($("#menuname").val()+',fh,'+$("#mtype").val()+',fh,'+$("#content1").val());
			});
		$("#mes-l").click(function(){
			$("#mes-lx").removeClass("dis");
			$("#mes-fx").addClass("dis");
			$("#mtype").val("view");
			$("#"+nowid).val($("#menuname").val()+',fh,'+$("#mtype").val()+',fh,'+$("#content1").val());
			});
		});
});

		//点击二级菜单
		function dj(value,mid){
			nowid = value;
			ermid = mid;
			$("#otherxx").show();
			$("#titlexx").show();
			$("#mtitle").html('二级菜单');
			var yvalue = $("#"+value).val();
			var mvalue = yvalue.split(',fh,');
			$("#menuname").val(mvalue[0]);
			$("#mtype").val(mvalue[1]);
			if('view' == mvalue[1]){
				$('#mes-l').click();
			}else{
				$('#mes-f').click();
			}
			$("#content1").val(mvalue[2]);
			$("#content2").val(mvalue[2]);
			$("#"+value).val(yvalue);
		};
		
		var tid = "";
		//删除子菜单
		function deleteM(){
			if(!confirm("确定要删除吗?"))return;
			var fn = 1;
			var yiid = "";
			if("table-l" == tid){
				fn = n1;
				yiid = "one-a";
			}
			if("table-m" == tid){
				fn = n2;
				yiid = "two-a";
			}
			if("table-r" == tid){
				fn = n3;
				yiid = "three-a";
			}
			if(fn == 1){
				$("#"+yiid).html('无');
				if("table-l" == tid)$("#M1").val("");
				if("table-m" == tid)$("#M2").val("");
				if("table-r" == tid)$("#M3").val("");
				$("#menuname").val("");
				return;
			}else{
				$("#menuname").val("");
				$("#content1").val("");
				$("#content2").val("");
				$('#mes-f').click();
			}
			$("#"+tid+(fn-1)).remove();
			$("#"+tid).css("height", $("#"+tid).height() - 45);
			if("table-l" == tid){
				$("#M1"+(fn-1)).val("");
				n1--;
			}
			if("table-m" == tid){
				$("#M2"+(fn-1)).val("");
				n2--;
			}
			if("table-r" == tid){
				$("#M3"+(fn-1)).val("");
				n3--;
			}
			$("#titlexx").hide();
			$("#otherxx").hide();
			$("#mtitle").html('菜单');
		};
		
		//设置菜单标题
		function setTitle(value){
			var tvalue = value;
			if(tvalue == '') tvalue = "无";
			if("one-a" == nowid){
				$("#M1").val(value);
				$("#"+nowid).html(tvalue);
			}else if("two-a" == nowid){
				$("#M2").val(value);
				$("#"+nowid).html(tvalue);
			}else if("three-a" == nowid){
				$("#M3").val(value);
				$("#"+nowid).html(tvalue);
			}else{
				$("#"+ermid).html(tvalue);
				$("#"+nowid).val(value+',fh,'+$("#mtype").val()+',fh,'+$("#content1").val());
			};
		}
		
		//设置内容
		function setContent(value){
			$("#"+nowid).val($("#menuname").val()+',fh,'+$("#mtype").val()+',fh,'+value);
		}
		
		function addmenu1(){
			$("#titlexx").show();
			if('' == ($("#M1").val()).replace(",fh,",'').replace(",fh,",'')){
				$("#menuname").tips({
					side:1,
		            msg:'请输入菜单名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#menuname").focus();
				$("#otherxx").hide();
				$("#mtitle").html('一级菜单');
				return;
			}
			if(n1>5)return;
			$("#table-l").removeClass("dis");
			var adda='<div id="'+"table-l"+n1+'" style="border-top:1px solid #cdcdcd;cursor:pointer;" onclick="dj(\''+"M1"+n1+'\',this.id);">二级'+n1+'</div>';
			$("#table-l").append(adda);
			nowid ="M1"+n1;
			//$("#menuname").val('二级'+n1);
			$("#menuname").val("");
			$('#mes-f').click();
			$("#content1").val("");
			$("#content2").val("");
			$("#M1"+n1).val('二级'+n1+',fh,click,fh,');
			$("#otherxx").show();
			$("#mtitle").html('二级菜单');
			$("#table-l").css("height", $("#table-l").height() + 45);
			$("#table-l").css("border-top", 0);
			n1++;
		}
		
		function addmenu2(){
			$("#titlexx").show();
			if('' == ($("#M2").val()).replace(",fh,",'').replace(",fh,",'')){
				$("#menuname").tips({
					side:1,
		            msg:'请输入菜单名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#menuname").focus();
				$("#otherxx").hide();
				$("#mtitle").html('一级菜单');
				return;
			}
			if(n2>5)return;
			$("#table-m").removeClass("dis");
			var adda='<div id="'+"table-m"+n2+'" style="border-top:1px solid #cdcdcd;cursor:pointer;" onclick="dj(\''+"M2"+n2+'\',this.id);">二级'+n2+'</div>';
			$("#table-m").append(adda);
			nowid ="M2"+n2;
			//$("#menuname").val('二级'+n2);
			$("#menuname").val("");
			$('#mes-f').click();
			$("#content1").val("");
			$("#content2").val("");
			$("#M2"+n2).val('二级'+n2+',fh,click,fh,');
			$("#otherxx").show();
			$("#mtitle").html('二级菜单');
			$("#table-m").css("height", $("#table-m").height() + 45);
			$("#table-m").css("border-top", 0);
			n2++;
		}
		
		function addmenu3(){
			$("#titlexx").show();
			if('' == ($("#M3").val()).replace(",fh,",'').replace(",fh,",'')){
				$("#menuname").tips({
					side:1,
		            msg:'请输入菜单名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#menuname").focus();
				$("#otherxx").hide();
				$("#mtitle").html('一级菜单');
				return;
			}
			if(n3>5)return;
			$("#table-r").removeClass("dis");
			var adda='<div id="'+"table-r"+n3+'" style="border-top:1px solid #cdcdcd;cursor:pointer;" onclick="dj(\''+"M3"+n3+'\',this.id);">二级'+n3+'</div>';
			$("#table-r").append(adda);
			nowid ="M3"+n3;
			//$("#menuname").val('二级'+n3);
			$("#menuname").val("");
			$('#mes-f').click();
			$("#content1").val("");
			$("#content2").val("");
			$("#M3"+n3).val('二级'+n3+',fh,click,fh,');
			$("#otherxx").show();
			$("#mtitle").html('二级菜单');
			$("#table-r").css("height", $("#table-r").height() + 45);
			$("#table-r").css("border-top", 0);
			n3++;
		}
		
		//生成菜单
		function createM(){
			var mym1 = $("#M1").val().replace(",fh,",'').replace(",fh,",'');
			var mym2 = $("#M2").val().replace(",fh,",'').replace(",fh,",'');
			var mym3 = $("#M3").val().replace(",fh,",'').replace(",fh,",'');
			if('' == mym1 && '' == mym2 && '' == mym3){
				alert("还没添加菜单!");
				return;
			}
			if(!confirm("确定要生成菜单吗?"))return;
			$("#form").submit();
		}
		
		function chushiMenu(){
			var mym1 = $("#M1").val().replace(",fh,",'').replace(",fh,",'');
			var mym2 = $("#M2").val().replace(",fh,",'').replace(",fh,",'');
			var mym3 = $("#M3").val().replace(",fh,",'').replace(",fh,",'');
			if('' != mym3){
				$("#three-a").html(mym3);
				for(var i=1;i<6;i++){
					var valm = $("#M3"+i).val().split(',fh,');
					if("" != valm[0]){
						csaddmenu3(valm[0]);
						n3++;
					}else{
						break;
					}
					$(".add-rw").removeClass("dis");
					$(".add-r").removeClass("dis");
					$(".add-mw, .add-lw").addClass("dis");
				}
			}
			if('' != mym2){
				$("#two-a").html(mym2);
				for(var i=1;i<6;i++){
					var valm = $("#M2"+i).val().split(',fh,');
					if("" != valm[0]){
						csaddmenu2(valm[0]);
						n2++;
					}else{
						break;
					}
					$(".add-mw").removeClass("dis");
					$(".add-m").removeClass("dis");
					$(".add-lw, .add-rw").addClass("dis");
				}
			}
			if('' != mym1){
				$("#one-a").html(mym1);
				for(var i=1;i<6;i++){
					var valm = $("#M1"+i).val().split(',fh,');
					if("" != valm[0]){
						csaddmenu1(valm[0]);
						n1++;
					}else{
						break;
					}
					$(".add-lw").removeClass("dis");
					$(".add-l").removeClass("dis");
					$(".add-mw, .add-rw").addClass("dis");
				}
			}
		}
		
		function csaddmenu1(value){
			$("#table-l").removeClass("dis");
			var adda='<div id="'+"table-l"+n1+'" style="border-top:1px solid #cdcdcd;cursor:pointer;" onclick="dj(\''+"M1"+n1+'\',this.id);">'+value+'</div>';
			$("#table-l").append(adda);
			$("#table-l").css("height", $("#table-l").height() + 45);
			$("#table-l").css("border-top", 0);
		}
		
		function csaddmenu2(value){
			$("#table-m").removeClass("dis");
			var adda='<div id="'+"table-m"+n2+'" style="border-top:1px solid #cdcdcd;cursor:pointer;" onclick="dj(\''+"M2"+n2+'\',this.id);">'+value+'</div>';
			$("#table-m").append(adda);
			$("#table-m").css("height", $("#table-m").height() + 45);
			$("#table-m").css("border-top", 0);
		}
		
		function csaddmenu3(value){
			$("#table-r").removeClass("dis");
			var adda='<div id="'+"table-r"+n3+'" style="border-top:1px solid #cdcdcd;cursor:pointer;" onclick="dj(\''+"M3"+n3+'\',this.id);">'+value+'</div>';
			$("#table-r").append(adda);
			$("#table-r").css("height", $("#table-r").height() + 45);
			$("#table-r").css("border-top", 0);
		}
		
</script>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-121" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/weixin/mymenu/mymenu_edit.jsp">

<table data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-121" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/weixin/mymenu/mymenu_edit.jsp">
<tr>
<td>				
<div class="wx-main">
<!--左部分-->
	<div class="wx-left">
    	<div class="l-top">
        	<img src="static/weixin/wx-top.jpg" alt=""/>
        </div>
        <div class="l-mid">
        	
        </div>
        <div class="l-fot">
        	<div class="l-fot-first">
            	<img src="static/weixin/keyboard.png" width="60%" alt="" id="tsMsg"/>
            </div>
            <ul>
                <li id="one-a">无</li>
                <li id="two-a">无</li>
                <li id="three-a">无</li>
            </ul>
        </div>
        <div class="add-lw">
            <div id="add-l-but" class="add-l dis">+
                <img src="static/weixin/wx-arrow.png" alt=""/>
            </div>
            <div class="dis" style="width:89px; height:0px; line-height:45px; border:1px solid #cdcdcd; position:absolute; bottom:110px; left:47px; font-size:16px; text-align:center; font-weight:bold; color:#353637; background-color:#f5f5f9;" id="table-l">
            </div>
        </div>
        <div class="add-mw">
            <div id="add-m-but" class="add-m dis">+
                <img src="static/weixin/wx-arrow.png" alt=""/>
            </div>
            <div class="dis" style="width:89px; height:0px; line-height:45px; border:1px solid #cdcdcd; position:absolute; bottom:110px; left:135px; font-size:16px; text-align:center; font-weight:bold; color:#353637; background-color:#f5f5f9;" id="table-m">
            </div>
        </div>
        <div class="add-rw">
            <div id="add-r-but"  class="add-r dis">+
                <img src="static/weixin/wx-arrow.png" alt=""/>
            </div>
            <div class="dis" style="width:89px; height:0px; line-height:45px; border:1px solid #cdcdcd; position:absolute; bottom:110px; left:224px; font-size:16px; text-align:center; font-weight:bold; color:#353637; background-color:#f5f5f9;" id="table-r">
            </div>
        </div>
    </div>
<!--右部分-->
    <div class="wx-right">
    	<div class="r-top">
        	<p><span class="r-topl" id="mtitle">一级菜单</span><span class="r-topr" onclick="deleteM();">删除菜单</span></p>
            <div class="clr"></div>
        </div>
        <div class="r-name" style="display: none;" id="titlexx" >
        	<form action="" method="">
            	<label>菜单名称</label>
                <input type="input" placeholder="输入菜单名称" id="menuname" onkeyup="setTitle(this.value)">
                <input type="hidden" value="click" id="mtype">
            </form>
            <P>字数不超过4个汉字或8个字母</P>
        </div>
        <div class="r-cont" id="otherxx" style="display: none;">
            <form action="" method="">
            	<p>菜单内容</p>
                <input id="mes-f" type="radio" name="mes" checked="checked">
                <label>发送消息&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <input id="mes-l" type="radio" name="mes">
                <label>跳转网页</label>
            </form>
            <div id="mes-fx" class="messe">
                <p>发送消息</p>
                <textarea placeholder="请输入消息" id="content1" onkeyup="setContent(this.value);"></textarea>
            </div>
            <div id="mes-lx" class="messe dis">
                <p>发送链接</p>
                <textarea placeholder="请输入链接" id="content2" onkeyup="setContent(this.value);"></textarea>
            </div>
        </div>
        <div class="r-bottom">
            <div class="clr"></div>
        	<p><span class="r-topl"></span><span class="r-topr" onclick="createM();">生成菜单</span></p>
        </div>
    </div>
</div>
<form action="<%=basePath%>mymenu/setMyMenu.do" id="form" method="post">
<input name="WXUSERNAME" id="WXUSERNAME" value="${pd.WXUSERNAME }" type="hidden" />
<c:forEach items="${varList}" var="var" varStatus="vs">
<input name="${var.XID }" id="${var.XID }" value="${var.TITLE},fh,${var.TYPE},fh,${var.CONTENT}" type="hidden">
</c:forEach>
</form>
</td>
</tr>
<tr>
<td>错误代码说明：<a href="https://wenku.baidu.com/view/5edee974f78a6529647d53a1.html" target="_bank">https://wenku.baidu.com/view/5edee974f78a6529647d53a1.html</a>(返回错误代码说明功能正常，只是参数配置问题，具体根据错误代码看说明)</td>
</tr>
</table>
</body>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>	
<script type="text/javascript">
$(function(){chushiMenu();});
</script>
	<c:if test="${'0' == pd.status}">
		<script type="text/javascript">
			$(tsMsg());
			function tsMsg(){
				$("#tsMsg").tips({
					side:3,
		            msg:'生成成功,请重新关注公众号查看效果',
		            bg:'#AE81FF',
		            time:100
		        });
			}
		</script>
	</c:if>
	<c:if test="${'0' != pd.status && null != pd.status}">
		<script type="text/javascript">
			$(tsMsg());
			function tsMsg(){
				$("#tsMsg").tips({
					side:3,
		            msg:'生成失败,错误代码：${pd.status}',
		            bg:'#AE81FF',
		            time:100
		        });
			}
		</script>
	</c:if>
</html>