<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>马鞍山市交警支队</title>
<link href="${ctx}/resources/portal/css/css.css" rel="stylesheet" />
<link href="${ctx}/resources/portal/css/index.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.bcat.bgswitcher.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="${ctx}/resources/portal/js/common.js"></script>
</head>
<body>
<div class=" top_body">
<div id="bg-body"></div>
<script type="text/javascript">
var ctx = "${ctx}";    
var srcBgArray = [ctx+"/resources/portal/images/banner1.jpg",ctx+"/resources/portal/images/banner2.jpg",ctx+"/resources/portal/images/banner3.jpg"];

//根据栏目编码加载文章
function loadArticleByTopic(topicCode,page,rows){
	var articleData=null;
	$.ajax({
		cache: true,
		type: "POST",
		url:'${ctx}/article/loadArticleByTopic',
		data:{
			topicCode:topicCode,
			page:page,
			rows:rows
		},
		async: false,
	    error: function(request) {
	        $.messager.alert('提示信息',"系统正在升级，请联系管理员或稍后再试！");
	    },
	    success: function(data) {
	    	articleData=data;
	    }
	})
	return articleData;
}

//加载文章（参数1：要显示的DIV的ID,参数2：要显示的文章数据）
function showArticle(dispDivId,articleData){
	for(var i=0;i<articleData.total;i++){
		  if(i<8){
			  var articleObj=articleData.rows[i];
			  var createDate=articleObj.createDate.substr(0,10);
			  var articleTitle=articleObj.articleTitle;
			  var articleUrl=ctx+"/portal/content?id="+articleObj.id;
			  var articleTitlePart="";
			  //通知
			  if(dispDivId=='TZ'){
				  if(articleTitle.length>=30){
					  articleTitlePart=articleTitle.substr(0,15);
				  }else{
					  articleTitlePart=articleTitle;
				  }
				  $('#'+dispDivId).append('<li title="'+articleTitle+'"><a target="_blank" href="'+articleUrl+'" >'+articleTitlePart+'</a><span>'+createDate+'</span></li>');
			  }else if(dispDivId=='SJWJ'||dispDivId=='ZDWJ'||dispDivId=='GZDT'){
			  //上级文件
			  	  var cDate=articleObj.createDate.substr(5,5);
				  if(articleTitle.length>=10){
					  articleTitlePart=articleTitle.substr(0,10);
				  }else{
					  articleTitlePart=articleTitle;
				  }
				  $('#'+dispDivId).append('<li><span class="date">'+cDate+'</span><a target="_blank" href="'+articleUrl+'" title="'+articleTitle+'" >'+articleTitlePart+'</a></li>');
			  }else if(dispDivId=='HYTZ'){
			  //会议通知 
				  if(articleTitle.length>=12){
					  articleTitlePart=articleTitle.substr(0,12);
				  }else{
					  articleTitlePart=articleTitle;
				  }
			      var html='<li><span>></span><a title="'+articleTitle+'" href="'+articleUrl+'">'+articleTitlePart+'</a></li>';
				  $('#'+dispDivId).append(html);
			  }else if(dispDivId=='GG'){
			  //公告	  
				  //$('#'+dispDivId).append(articleObj.articleContent);
				  $('#'+dispDivId).append('<a href="'+articleUrl+'">'+articleObj.articleTitle+'</a>');
			  } else{
			  //综合要闻&&领导动态	  
				  if(articleTitle.length>=15){
					  articleTitlePart=articleTitle.substr(0,15);
				  }else{
					  articleTitlePart=articleTitle;
				  }
				  $('#'+dispDivId).append('<li><span class="date">'+createDate+'</span><a target="_blank" href="'+articleUrl+'" title="'+articleTitle+'" >'+articleTitlePart+'</a></li>');
			  }
		  }
	  }
}


$(document).ready(function() {
  $('#bg-body').bcatBGSwitcher({
    urls: srcBgArray,
    alt: 'Full screen background image'
  });
  
  //综合要闻
  var zhywData=loadArticleByTopic("ZHYW",'1','10');
  showArticle('ZHYW',zhywData);
  //领导动态
  var lddtData=loadArticleByTopic("LDDT",'1','10');
  showArticle('LDDT',lddtData);
  //通知
  var tzData=loadArticleByTopic("TZ",'1','3');
  showArticle('TZ',tzData);
  //公告
  var ggData=loadArticleByTopic("GG",'1','3');
  showArticle('GG',ggData);
  //会议通知(加载3条)
  var hhtzData=loadArticleByTopic("HYTZ",'1','3');
  showArticle('HYTZ',hhtzData);
  //上级文件(加载10条)
  var sjwjData=loadArticleByTopic("SJWJ",'1','10');
  showArticle('SJWJ',sjwjData);
  //支队文件(加载10条)
  var zdwjData=loadArticleByTopic("ZDWJ",'1','10');
  showArticle('ZDWJ',zdwjData);
  //工作动态（加载10条）
  var gzdtData=loadArticleByTopic("GZDT",'1','10');
  showArticle('GZDT',gzdtData);
  
});
</script><!--end of bg-body script-->
<div class="container">
	<div class="header">
    	
        	<div class="h_logo"><a href="#"><img src="${ctx}/resources/portal/images/logo.png" /></a></div>
        </div>
    
    <div class="navbox ">
    	<ul>
        	<li>
            	<dl>
            		<dt class="n_1"><a href="${ctx}/portal/index"><span>首页</span></a></dt>
                	<dd><a href="#">综合要闻</a></dd>
                    <dd><a href="#">领导动态</a></dd>
                    <dd><a href="#">通知公告</a></dd>
                    <dd><a href="#">会议通知</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_2"><a href="#"><span>动态</span></a></dt>
                	<dd><a href="#">工作动态</a></dd>
                    <dd><a href="#">新闻观察</a></dd>
                    <dd><a href="#">预警研判</a></dd>
                    <dd><a href="#">警务观察</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_3"><a href="#"><span>阅览</span></a></dt>
                	<dd><a href="#">支队文件</a></dd>
                    <dd><a href="#">值带班表</a></dd>
                    <dd><a href="#">上级文件</a></dd>
                    <dd><a href="#">信息报送</a></dd>
                </dl>
            </li>
            <li>
            	<dl>
            		<dt class="n_4"><a href="#"><span>警务</span></a></dt>
                	<dd><a href="#">警务视频</a></dd>
                    <dd><a href="#">调查研究</a></dd>
                    <dd><a href="#">舆情动态</a></dd>
                    <dd><a href="#">工作简报</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <!--通知开始-->
    <div class="tongzhiBox">
    	<div class="tzgg"><b>通知：</b>
        	<div class="tzggCon" >
                <ul id="TZ">
                	<%--
                    <li> 我hi芜湖撒大苏打撒旦撒旦撒旦撒撒旦不能随便的你们仨百度1<span>[2017-12-12]</span></li>
                    <li> 我hi芜湖撒大苏打撒旦撒旦撒旦撒撒旦不能随便的你们仨百度2<span>[2017-12-12]</span></li>
                    <li> 我hi芜湖撒大苏打撒旦撒旦撒旦撒撒旦不能随便的你们仨百度3<span>[2017-12-12]</span></li>
                    <li> 我hi芜湖撒大苏打撒旦撒旦撒旦撒撒旦不能随便的你们仨百度4<span>[2017-12-12]</span></li>
                     --%>
                </ul>

      		</div>
       </div>
       <script type="text/javascript">
		jQuery(".tzgg").slide({mainCell:".tzggCon ul",autoPage:true,effect:"top",autoPlay:true,vis:1});
		</script>
        <div class="index_day">
        	<div class="bd">
				<ul class="infoList">
					<li>2017年5月12日  星期二  小雪</li>
                    <li>2017年5月12日  星期二  小雪</li>
                    <li>2017年5月12日  星期二  小雪</li>
                    <li>2017年5月12日  星期二  小雪</li>
					
				</ul>
			</div>
        </div>
        
        <script type="text/javascript">
		jQuery(".index_day").slide({mainCell:".bd ul",autoPlay:true,effect:"leftMarquee",vis:2,interTime:50});
		</script>
        
    </div>
    <!--通知结束-->
<div class="indexbody">  
    <div class="zt1 pad10"><a href="#"><img src="${ctx}/resources/portal/images/zt1.jpg" /></a></div>
    
    <div class="index1 mar10">
    	<div class="imageNews fl">
        	<ul class="pic">
					<li><a href="#" ><img src="${ctx}/resources/portal/images/1.jpg"/></a></li>
					<li><a href="#" ><img src="${ctx}/resources/portal/images/banner1.jpg"/></a></li>
					
			</ul>
			<div class="txt-bg"></div>
			<div class="txt">
				<ul>
					<li><a href="#">公安局交警支队送温暖活动</a></li>
					<li><a href="#">公安局交警支队送温暖活动2</a></li>
                    <li><a href="#">公安局交警支队送温暖活动3</a></li>
                    <li><a href="#">公安局交警支队送温暖活动4</a></li>
					
				</ul>
			</div>

			<ul class="num">
				<li><a>1</a><span></span></li>
				<li><a>2</a><span></span></li>
                <li><a>3</a><span></span></li>
                <li><a>4</a><span></span></li>
				
			</ul>
        </div>
        <script type="text/javascript">
		jQuery(".imageNews").slide({ titCell:".num li", mainCell:".pic",effect:"fold", autoPlay:true,trigger:"click",
			//下面startFun代码用于控制文字上下切换
			startFun:function(i){
				 jQuery(".imageNews .txt li").eq(i).animate({"bottom":0}).siblings().animate({"bottom":-36});
			}
		});
	</script>
    
    <div class="index1News fl ml10">
    	<div class="zhywNews">
        	<div class="hd">
				<ul><li id="lg1" class="on">综合要闻</li><li id="lg2">领导动态</li></ul>
			</div>
			<div class="bd">
				<ul id="ZHYW">
					<%--
					<li><span class="date">2011-11-11</span><a href="#" >中国打破了世界软件巨头规则</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >口语：会说中文就能说英语！</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >农场摘菜不如在线学外语好玩</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >数理化老师竟也看学习资料？</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >学英语送ipad2,45天突破听说</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >学外语，上北外！</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >那些无法理解的荒唐事</a></li>
                    <li><span class="date">2011-11-11</span><a href="#" >那些无法理解的荒唐事</a></li>
                     --%>
				</ul>
				<ul id="LDDT" style="display:none;">
					<%--
					<li><span class="date">2011-11-11</span><a href="#" >名师教作文：３妙招巧写高分</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >耶鲁小子：教你备考SAT</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >施强：高端专业语言教学</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >数理化老师竟也看学习资料？</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >【推荐】名校英语方法曝光！</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >2012高考“考点”大曝光!!</a></li>
					<li><span class="date">2011-11-11</span><a href="#" >涨价仍爆棚假日旅游冰火两重天</a></li>
                    <li><span class="date">2011-11-11</span><a href="#" >涨价仍爆棚假日旅游冰火两重天</a></li>
                      --%>
				</ul>
				
			</div>
        </div>
        
        <script type="text/javascript">
        	$('#lg1').click(function () {  
                $("#lg2").removeClass("on");//清空liCSS属性  
                $(this).addClass('on');//选中li添加属性
				$(this).parent().parent().css('background','url(${ctx}/resources/portal/images/1.png)');  
                $("#ZHYW").css("display", "block");  
                $("#LDDT").css("display", "none");  
               
            });  
            $('#lg2').click(function () {  
                $("#lg1").removeClass("on");//清空liCSS属性  
                $(this).addClass('on');//选中li添加属性 
				$(this).parent().parent().css('background','url(${ctx}/resources/portal/images/2.png)');  
                $("#ZHYW").css("display", "none");  
                $("#LDDT").css("display", "block");  
                
            });  

        </script>
        
        
    </div>
    <!--通知模块开始-->
    <div class="zhongzhiBox fr">
    	<div class="h_titleBox"><h1>公告</h1></div>
        <div class="ggBox">
        	<marquee id="GG" direction="up" scrollamount="2" loop="-1" height="75px">
        	<%--
        		公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告公告
            公告公告公告公告公告公告公告
        	 --%>
            </marquee>
        </div>
        <div class="h_titleBox"><h1>会议通知</h1></div>
        <div class="hyBox">
        	<ul id="HYTZ">
        	   <%--
            	<li><span>></span><a href="#">会议通知撒大苏打撒</a></li>
                <li><span>></span><a href="#">会议通知撒大苏打撒</a></li>
                <li><span>></span><a href="#">会议通知撒大苏打撒</a></li>
                 --%>
            </ul>
        </div>
        <div class="birthday">
			<div class="bd">
				<ul class="infoList">
					<li>王XX生日快乐</li>
                    <li>吴XX生日快乐</li>
                    <li>李XX生日快乐</li>
                    <li>胡XX生日快乐</li>
				</ul>
			</div>
        </div>
        
        <script type="text/javascript">
		jQuery(".birthday").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true,vis:1});
		</script>
        
        
    </div>
    <!--通知模块结束-->
    <div class="clear_f"></div>
    </div>
    
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>上级文件</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul id="SJWJ">
               <%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                --%>
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>支队文件</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul id="ZDWJ">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                --%>
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>工作动态</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul id="GZDT">
            	<%--
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
              --%>
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    
    <!--快速入口开始-->
    <div class="index3 mar10">
    	<div class="ksrk_i"></div>
        <div class="ksrk_more"><a href="#">更多系统</a></div>
        <ul class="ksrkBox">
        	<li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
            <li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
            <li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
            <li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
            <li><a href'#'><img src="${ctx}/resources/portal/images/xt.jpg" /></a></li>
        </ul>
        <div class="clear_f"></div>
    </div>
    <!--快速入口结束-->
    <!--搜索开始-->
    <div class="index_searchBox mar10">
    	<div class="seachBox fl" id="secrchBox">
        	<div class="s_tit fl">站内搜索</div>
        	<form action="#" method="post" autocomplete="off" onsubmit="return check('secrchBox')">
            	<div class="s1 fl"><input type="text" name="keys" id="keys" class="index_s" placeholder="请输入关键字" /></div>
                <div class="s1 fl"><input type="submit" class="index_submit" value="搜索" /></div>
            </form>
        </div>
        
        <div class="s_link fl">
        	<a href="#">部局直达</a>
            <a href="#">总队直达</a>
            <a href="#">市局直达</a>
            <a href="#">省厅直达</a>
        </div>
    </div>
    <!--搜索结束-->
    
    
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>警务视频</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>队伍建设</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>党风廉政</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
               
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    
    <div class="zt1 pad10"><a href="#"><img src="${ctx}/resources/portal/images/zt2.jpg" /></a></div>
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>会议纪要</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>调查研究</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>工作简报</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
               
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    
    <!--快速通道开始-->
    <div class="kstdBox mar10">
    	<ul>
        	<li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/ic1.jpg" /></a></li>
        </ul>
        <div class="clear_f"></div>
    </div>
    
    <!--快速通道结束-->
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>工作指令</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>舆情动态</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>预警研判</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
               
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    <%--专题 --%>
    <div class="index_zhuanti mar10">
    	<ul class="picList">
        	<li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
        </ul>
    </div>
    
    <script type="text/javascript">
		jQuery(".index_zhuanti").slide({mainCell:"ul",autoPlay:true,effect:"leftMarquee",vis:4,interTime:50});
	</script>
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>每日情况</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>警务观察</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                
            </ul>
        </div>
        <div class="index_news fr">
        	<div class="titBox">
            	<h1>道路建设管理</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
               
            </ul>
        </div>
        <div class="clear_f"></div>
    </div>
    
    <div class="index2 mar10">
    	<div class="index_news fl ">
        	<div class="titBox">
            	<h1>警坛文苑</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                
            </ul>
        </div>
        <div class="index_news fl ml10">
        	<div class="titBox">
            	<h1>新闻资讯</h1>
                <a href="#" class="fr more">更多>></a>
            </div>
            <ul>
            	<li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                <li><a href="#"><span class="date">11-11</span>撒旦飒飒萨达萨达是</a></li>
                
            </ul>
        </div>
        <div class="xxpmBox fr">
        	<div class="xx_tit">
            	<h1>信息排名</h1>
                <a href="#" class="fr more">更多排名>></a>
            </div>
            <div class="xx_bg">
            	<dl class="xx_h">
                	<dt class="xx_bumen">部门</dt>
                	<dt class="dt">支队</dt>
                    <dt class="dt">市局</dt>
                    <dt class="dt">总队</dt>
                    <dt class="dt">省厅</dt>
                    <dt class="dt">部局</dt>
                </dl>
                <div class="clear_f"></div>
                <dl class="xx_dd">
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                <dl class="xx_dd">
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                <dl class="xx_dd">
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
                <dl class="xx_dd">
                	<dt class="xx_bumen">科技科</dt>
                	<dt class="dt">12</dt>
                    <dt class="dt">2</dt>
                    <dt class="dt">3</dt>
                    <dt class="dt">4</dt>
                    <dt class="dt">5</dt>
                </dl>
            </div>
            
        </div>
        <div class="clear_f"></div>
    </div>
    
    <!--图片展示开始-->
    <div class="index_tupian mar10">
    	<div class="tp_title">
        	<h1>图片展示</h1>
            <a href="#" class="more">查看更多>></a>
             <div class="clear_f"></div>
        </div>
        <div class="tp_bg">
            <ul>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
                <li><a href="#"><img src="${ctx}/resources/portal/images/zhuanti.jpg" /></a></li>
            </ul>
        </div>
         <div class="clear_f"></div>
    </div>
    <script type="text/javascript">
		jQuery(".index_tupian").slide({mainCell:"ul",autoPlay:true,effect:"leftMarquee",vis:4,interTime:50});
	</script>
    <!--图片展示结束-->
    
    <!--网站导航开始-->
    <div class="index_daohang">
      <div class="i_daohang_title bot10">
        <h1>公安网站导航</h1>
        
        <div class="hd">
          <ul>
              <li>全国公安导航</li>
              <li>全国交警导航</li>
              <li>省公安导航</li>
              <li>省交警导航</li>
              <li>本市公安导航</li>
              <li>本市公安导航</li>
              <li>支队机构导航</li>
          </ul>
		</div>
        
      </div>
      <div class="bd">
        <div class="dh_db">
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
        </div>
         <div class="dh_db">
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
        </div>
         <div class="dh_db">
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
        </div>
         <div class="dh_db">
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
        </div>
         <div class="dh_db">
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
        </div>
         <div class="dh_db">
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
        </div>
         <div class="dh_db">
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            <a href="#" target="_blank" title="链接名称">链接名称</a>
            
            <div class="clear_f"></div>
        </div>
        
        
        
        
        
    </div>
        
      
      
        
    </div>
    
    <script type="text/javascript">jQuery(".index_daohang").slide();</script>
    <!--网站导航结束-->
    
    
  </div>
</div>
</div>

<!--底部-->
<div class="footer mar10">
	<div class="container">
    	<div class="f_nav">
            <a href="javascript:void(0);" onclick="SetHome(this,'#');">加入收藏</a>
            <a href="javascript:void(0);" onclick="AddFavorite('我的网站',location.href)">设为首页</a>
            <a href="#">旧版</a>
            <span>建议分辨率为1440*960</span>
            <span>浏览器IE8以上版本</span>
        </div>
        <div class="f_logo"></div>
        
        <div class="f_copyright">
        	联系电话：0555-2425010   邮编：243000     技术支持：山河网络
        </div>
    </div>
</div>
<script type="text/JavaScript">
window.open ('首页弹窗公告.html','公告名称','height=500,width=700,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no')
</script>

</body>
</html>