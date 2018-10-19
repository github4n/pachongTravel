<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	  <script type="text/javascript" src="plugins/tab/js/framework.js"></script>
	  <link href="plugins/tab/css/import_basic.css" rel="stylesheet" type="text/css"/>
    <link  rel="stylesheet" type="text/css" id="skin" prePath="plugins/tab/" />
    <link rel="stylesheet" href="static/ace/css/main.css">
		<!--默认相对于根目录路径为../，可添加prePath属性自定义相对路径，如prePath="<%=request.getContextPath()%>"-->
		<style>
			.zDialogCon{
				background-color: #e9edf5;
			}
		</style>
	  <script type="text/javascript" charset="utf-8" src="plugins/tab/js/tab.js"></script>
	  <script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"58099",secure:"58108"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script>
  </head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-84" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/system/index/tab.jsp">
<div id="tab_menu" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-84" data-genuitec-path="/ZHLY/WebRoot/WEB-INF/jsp/system/index/tab.jsp"></div>
<div style="width:100%;">
	<div id="page" style="width:100%;height:100%;"></div>
</div>		
</body>
<script type="text/javascript">

function tabAddHandler(mid,mtitle,murl){
	tab.update({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});
	tab.add({
		id :mid,
		title :mtitle,
		url :murl,
		isClosed :true
	});

	tab.activate(mid);
}
 var tab;	
$( function() {
	 tab = new TabView( {
		containerId :'tab_menu',
		pageid :'page',
		cid :'tab1',
		position :"top"
	});
	tab.add( {
		id :'tab1_index1',
		title :"主页",
		url :"<%=basePath%>login_default.do",
		isClosed :false
	});
	/**tab.add( {
		id :'tab1_index1',
		title :"主页",
		url :"/per/undoTask!gettwo",
		isClosed :false
	});
	**/
});

	function cmainFrameT(){
		var hmainT = document.getElementById("page");
		var bheightT = document.documentElement.clientHeight;
		hmainT .style.width = '100%';
		hmainT .style.height = (bheightT  - 41) + 'px';
	}
	cmainFrameT();
	window.onresize=function(){  
		cmainFrameT();
	};

</script>
</html>

