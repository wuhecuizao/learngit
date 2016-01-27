<#setting number_format="#">
<#compress>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>南储商务网_有色金属价格行情_有色金属现货_有色金属信息资讯_南储报价</title>
		<meta name="chinaz-site-verification" content="946a59c8-2fe3-4797-85f0-6e99caff9d27" />
		<meta name="keywords" content="南储商务网，有色金属价格，有色金属行情，有色金属资讯，南储报价，上海现货，长江现货，今日铜价，今日铝价，期货交易" />
		<meta name="description" content="南储商务网是权威的有色金属资讯门户，提供南储报价、上海现货、长江现货等有色金属报价服务以及最新的有色金属行情信息，品种涵盖铜、铝、锌、铅、锡、镍等基本金属。" />
		<#include "/WEB-INF/template/common/common_2.0.ftl"/>
		<script type="text/javascript" src="js/version_2.0/tab.js"></script>
		<script type="text/javascript" src="js/version_2.0/commodityTab.js"></script>
        <script type="text/javascript" src="${base}/js/plugins/highcharts/highcharts.js"></script>
		<link href="/css/version_2.0/commodityStyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">

            Date.prototype.Format = function (fmt) { //author: meizz
                var o = {
                    "M+": this.getMonth() + 1, //月份
                    "d+": this.getDate(), //日
                    "h+": this.getHours(), //小时
                    "m+": this.getMinutes(), //分
                    "s+": this.getSeconds(), //秒
                    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                    "S": this.getMilliseconds() //毫秒
                };
                if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                for (var k in o)
                    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                return fmt;
            }

            $().ready(function() {
			 	/*var now = new Date();
			 	var hour = now.getHours();
			 	if(hour < 12){			 		
					$("#moningE").show();
					$("#afternoonE").hide();
					$("#index_one_news_title_left").removeClass("index_one_news_title_left").addClass("index_one_news_title_mid");
					$("#index_one_news_title_mid").removeClass("index_one_news_title_mid").addClass("index_one_news_title_left");
			 	}else{a
			 		$("#afternoonE").show();
					$("#moningE").hide();
					$("#index_one_news_title_left").removeClass("index_one_news_title_mid").addClass("index_one_news_title_left");
					$("#index_one_news_title_mid").removeClass("index_one_news_title_left").addClass("index_one_news_title_mid");
			 	}*/

			var speed=30 
			demo2.innerHTML=demo1.innerHTML 
			function Marquee(){ 

				if(demo2.offsetTop-demo.scrollTop-1120<=0) 
					demo.scrollTop-=demo1.offsetHeight ;

				else{ 
					demo.scrollTop++ ;
					
				} 
			} 
			var MyMar=setInterval(Marquee,speed) 
			demo.onmouseover=function() {clearInterval(MyMar)} 
			demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)} 

            

                Highcharts.setOptions({
                    global: {
                        useUTC: false
                    }
                });
                ajaxRetrieveDataAndChart();

                $('#commodityQuoteChart').click(function(){
                    window.location.href="${base}/database";
                });
                
                //下拉广告

				//$("#addd").slideDown(2000);
				//setTimeout(function(){$("#addd").slideUp(2000);},7000);

			});

            var nowTime = new Date();
            nowTime.setMonth(nowTime.getMonth()-3);
            var searchStartDate = nowTime.Format("yyyy-MM-dd");

            function ajaxRetrieveDataAndChart() {

                $.ajax({
                    type: "post",
                    url: '${base}/retrieveAjaxJsChartData.action',
                    data: {"mainCategoryId": 121 , "subCategoryId": null, "startDate": searchStartDate, "endDate": null},
                    dataType: "json",
                    success: function (ajaxdata) {
                        if (ajaxdata) {

                            mainLineAjaxData = ajaxdata;

                            displayMainLineChart();

                        }
                    }
                });
            }

            function displayMainLineChart() {


                $('#commodityQuoteChart').highcharts({
                    credits: {
                        enabled: false,
                        text: 'www.enanchu.com',
                        href: 'http://www.enanchu.com'
                    },
                    legend: {
                        enabled: false
                    },
                    title: {
                        text: "铝锭南储均价最近三个月走势图",
                        style: { color: "#005ac0", fontSize: "10px" }
                    },
                    xAxis: {
                        type: 'datetime',
                        showFirstLabel: true,
                        showLastLabel: true,
                        minPadding: 0,
                        startOnTick: false,
                        endOnTick: false,
                        labels: {
                            formatter: function() {

                                return Highcharts.dateFormat("%y-%m", this.value);
                            }
                        }
                    },
                    yAxis:[{
                        lineWidth : 0,
                        labels : {
                            format : '{value:.,0f}'
                        },
                        title:{
                            text : ''
                        }
                    }],
                    tooltip: {
                        enabled : false,
                        valueSuffix: '元/吨',
                        xDateFormat: "%Y-%m-%d"
                    },
                    plotOptions: {
                        series: {
                            marker: {
                                enabled: false
                            }
                        }
                    },
                    series: [{
                        data: mainLineAjaxData.mainAxis,
                        yAxis: 0
                    }]
                });
            }

        </script>
	</head>
	<body>
		<#include "/WEB-INF/template/common/header_2.0.ftl"/>
		<#--<a href="${base}/mobileOnline" target="_blank"><div id="addd"></div></a>-->
		<div id="addd"></div>
		<!-- 首页主页开始 -->
	    <div id="index_one" style="margin-top: 10px; height: 330px;">
	        <div id="index_one_ad" style="height: 330px;">
	          <#--${AAds!}-->
	          	<div style = "position: relative; width: 180px;height: 330px;background: #FFF; overflow: hidden;">
					<div style="position: absolute; width: 180px;height: 55px;left: 0px;top: 0px;background: #FFF;">
						<a rel="nofollow" href="http://www.rsdgroup.cn/" target="_blank">
							<img src="${base}/images/version_2.0/ruiside03.gif" alt="A0101锐斯得"/>
						</a>
					</div>
					<div style="position: absolute; width: 180px;height: 55px;left: 0px;top: 65px;background: #FFF;">
						<img src="${base}/images/version_2.0/ad20150814.gif" alt="A0104贵州广铝铝业有限公司"/> 
					</div>
					<div style="position: absolute; width: 180px;height: 54px;left: 0px;top: 130px;background: #FFF;">
						<a rel="nofollow" href="http://www.jnmc.com" target="_blank">
							<img src="/upload/advert/2014/11/04/0422/32_852745.gif" alt="A0102广西金川"/> 
						</a>
					</div>
					<div style="position: absolute; width: 180px;height: 54px;left: 0px;top: 194px;background: #FFF;">
						<a rel="nofollow" href="http://www.bwjs.net" target="_blank">
							<img src="${base}/images/version_2.0/baiwei.jpg" alt="A0103百为"/> 
						</a>
					</div>
					<div style="position: absolute; width: 180px;height: 54px;left: 0px;top: 258px;background: #FFF;">
							<img src="${base}/images/version_2.0/04zhaozu.gif" alt="A0104广告招租"/> 
					</div>
				</div>
	        </div>
            <div id="index_one_price">
            <div id="index_one_price_in">
            <div id="index_one_price_text">
                <div id="index_one_price_text_left">
                    <ul class="nav" style="width: 480px;">
                        <li class="nav_current" id="nav1" onMouseOver="javascript:doClick(this)"><a href="${base}/quotation/1" target="_blank">南储华南</a></li>
                        <li class="nav_link" id="nav2" onMouseOver="javascript:doClick(this)"><a href="${base}/quotation/2" target="_blank">南储华东</a></li>
                        <li class="nav_link" id="nav3" onMouseOver="javascript:doClick(this)"><a href="${base}/quotation/3" target="_blank">上海现货</a></li>
                        <li class="nav_link" id="nav4" onMouseOver="javascript:doClick(this)"><a href="${base}/quotation/4" target="_blank">长江现货</a></li>
                        <li class="nav_link" id="nav5" onMouseOver="javascript:doClick(this)"><a href="${base}/quotation/11" target="_blank">灵通报价</a></li>
                    </ul>
                </div>

                <div id="clear"></div>
            </div>
            <div class="nav-down" style="height: 275px;">
                <div class="dis" id="sub1">
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <th width="15%">品名</th><th width="20%">牌号</th><th width="30%">价格区间</th><th width="10%">中间价</th><th width="10%">涨跌</th><th width="15%">日期</th>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <div class="scroll_table">
                                    <table>
                                        <tbody>
                                            <#if quotes?exists>
                                                <#list quotes as quote>
                                                    <#if quote.area == "4" && quote.quoteType == 1 && quote.commodityId != 58 && quote.commodityId != 59 && quote.commodityId != 60 && quote.commodityId != 61>
                                                    <tr>
                                                        <td width="15%">${quote.gbName!""}</td>
                                                        <td width="20%">${quote.grade!""}</td>
                                                        <td width="30%">
                                                            <#if quote.commodityName?trim == "升贴水">
                                                                <#if quote.lowPrice?eval lt 0>(c)${quote.lowPrice!?substring(1, quote.lowPrice!?length)}<#else>(b)${quote.lowPrice!"0"}</#if>-<#if quote.highPrice?eval lt 0>(c)${quote.highPrice!?substring(1, quote.highPrice!?length)}<#else>(b)${quote.highPrice!"0"}</#if>
                                                            <#else>
                                                            ${quote.lowPrice!"0"}-${quote.highPrice!"0"}
                                                            </#if>
                                                        </td>
                                                        <td width="10%">
                                                        	<#if quote.lowPrice?exists && quote.highPrice?exists>${((quote.lowPrice!?eval + quote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                                        </td>
                                                        <td width="10%" <#if quote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>${quote.priceRate!"0"}</td>
                                                        <td width="15%">
                                                            <#if quote.commodityName?trim == "升贴水" && quote.grade?trim == "Al99.7">
                                                                13:00
                                                            <#elseif quote.commodityName?trim == "升贴水">
                                                                10:30
                                                            <#else>
                                                            	${quote.quoteTime?string('MM-dd')}
                                                            </#if>
                                                        </td>
                                                    </tr>
                                                    </#if>
                                                </#list>
                                            </#if>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="dis" id="sub2">
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <th width="15%">品名</th><th width="20%">牌号</th><th width="30%">价格区间</th><th width="10%">中间价</th><th width="10%">涨跌</th><th width="15%">日期</th>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <div class="scroll_table">
                                    <table>
                                        <tbody>
                                            <#if quotes?exists>
                                                <#list quotes as quote>
                                                    <#if quote.area == "5" && quote.quoteType == 1 >
                                                    <tr>
                                                        <td width="15%">${quote.gbName!""}</td>
                                                        <td width="20%">${quote.grade!""}</td>
                                                        <td width="30%">
                                                            <#if quote.commodityName?trim == "升贴水">
                                                                <#if quote.lowPrice?eval lt 0>(c)${quote.lowPrice!?substring(1, quote.lowPrice!?length)}<#else>(b)${quote.lowPrice!"0"}</#if>-<#if quote.highPrice?eval lt 0>(c)${quote.highPrice!?substring(1, quote.highPrice!?length)}<#else>(b)${quote.highPrice!"0"}</#if>
                                                            <#else>
                                                            	${quote.lowPrice!"0"}-${quote.highPrice!"0"}
                                                            </#if>
                                                        </td>
                                                        <td width="10%">
                                                        	<#if quote.lowPrice?exists && quote.highPrice?exists>${((quote.lowPrice!?eval + quote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                                        </td>
                                                        <td width="10%" <#if quote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>${quote.priceRate!"0"}</td>
                                                        <td width="15%">
                                                            <#if quote.commodityName?trim == "升贴水" && quote.grade?trim == "Al99.7">
                                                                13:00
                                                            <#elseif quote.commodityName?trim == "升贴水">
                                                                10:30
                                                            <#else>
                                                            	${quote.quoteTime?string('MM-dd')}
                                                            </#if>
                                                        </td>
                                                    </tr>
                                                    </#if>
                                                </#list>
                                            </#if>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="dis" id="sub3">
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <th width="15%">品名</th><th width="20%">牌号</th><th width="30%">价格区间</th><th width="10%">中间价</th><th width="10%">涨跌</th><th width="15%">日期</th>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <div class="scroll_table">
                                    <table>
                                        <tbody>
                                            <#if quotes?exists>
                                                <#list quotes as quote>
                                                    <#if quote.area == "2"  && quote.quoteType == 1>
                                                    <tr>
                                                        <td width="15%">${quote.gbName!""}</td>
                                                        <td width="20%">${quote.grade!""}</td>
                                                        <td width="30%">
                                                            <#if quote.commodityName?trim == "升贴水">
                                                                <#if quote.lowPrice?eval lt 0>(c)${quote.lowPrice!?substring(1, quote.lowPrice!?length)}<#else>(b)${quote.lowPrice!"0"}</#if>-<#if quote.highPrice?eval lt 0>(c)${quote.highPrice!?substring(1, quote.highPrice!?length)}<#else>(b)${quote.highPrice!"0"}</#if>
                                                            <#else>
                                                            	${quote.lowPrice!"0"}-${quote.highPrice!"0"}
                                                                <#if quote.commodityId?exists && quote.commodityId == 7>
                                                                    美元
                                                                </#if>
                                                            </#if>
                                                        </td>
                                                        <td width="10%">
                                                        	<#if quote.lowPrice?exists && quote.highPrice?exists>${((quote.lowPrice!?eval + quote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                                        </td>
                                                        <td width="10%" <#if quote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>${quote.priceRate!"0"}</td>
                                                        <td width="15%">
                                                            <#if quote.commodityName?trim == "升贴水" && quote.grade?trim == "Al99.7">
                                                                10:15
                                                            <#elseif quote.commodityName?trim == "升贴水">
                                                                10:30
                                                            <#else>
                                                            	${quote.quoteTime?string('MM-dd')}
                                                            </#if>
                                                        </td>
                                                    </tr>
                                                    </#if>
                                                </#list>
                                            </#if>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="dis" id="sub4">
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <th width="15%">品名</th><th width="20%">牌号</th><th width="30%">价格区间</th><th width="10%">中间价</th><th width="10%">涨跌</th><th width="15%">日期</th>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <div class="scroll_table">
                                    <table>
                                        <tbody>
                                            <#if quotes?exists>
                                                <#list quotes as quote>
                                                    <#if quote.area == "3"  && quote.quoteType == 1 >
                                                    <tr>
                                                        <td width="15%">${quote.gbName!""}</td>
                                                        <td width="20%">${quote.grade!""}</td>
                                                        <td width="30%">
                                                            <#if quote.commodityName?trim == "升贴水">
                                                                <#if quote.lowPrice?eval lt 0>(c)${quote.lowPrice!?substring(1, quote.lowPrice!?length)}<#else>(b)${quote.lowPrice!"0"}</#if>-<#if quote.highPrice?eval lt 0>(c)${quote.highPrice!?substring(1, quote.highPrice!?length)}<#else>(b)${quote.highPrice!"0"}</#if>
                                                            <#else>
                                                            	${quote.lowPrice!"0"}-${quote.highPrice!"0"}
                                                            </#if>
                                                        </td>
                                                        <td width="10%">
                                                        	<#if quote.lowPrice?exists && quote.highPrice?exists>${((quote.lowPrice!?eval + quote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                                        </td>
                                                        <td width="10%" <#if quote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>${quote.priceRate!"0"}</td>
                                                        <td width="15%">
                                                            <#if quote.commodityName?trim == "升贴水" && quote.grade?trim == "Al99.7">
                                                                13:00
                                                            <#elseif quote.commodityName?trim == "升贴水">
                                                                10:30
                                                            <#else>
                                                            	${quote.quoteTime?string('MM-dd')}
                                                            </#if>
                                                        </td>
                                                    </tr>
                                                    </#if>
                                                </#list>
                                            </#if>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="dis" id="sub5">
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                        <tr>
                            <th width="35%">品名</th><th width="30%">价格区间</th><th width="10%">中间价</th><th width="10%">涨跌</th><th width="15%">日期</th>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <div class="scroll_table">
                                    <table>
                                        <tbody>
                                            <#if quotes?exists>
                                                <#list quotes as quote>
                                                    <#if quote.area == "6" && quote.quoteType == 1>
                                                    <tr>
                                                        <td width="35%">${quote.gbName!""}</td>
                                                        <td width="30%">
                                                            <#if quote.commodityName?trim == "升贴水">
                                                                <#if quote.lowPrice?eval lt 0>(c)${quote.lowPrice!?substring(1, quote.lowPrice!?length)}<#else>(b)${quote.lowPrice!"0"}</#if>-<#if quote.highPrice?eval lt 0>(c)${quote.highPrice!?substring(1, quote.highPrice!?length)}<#else>(b)${quote.highPrice!"0"}</#if>
                                                            <#else>
                                                            ${quote.lowPrice!"0"}-${quote.highPrice!"0"}
                                                            </#if>
                                                        </td>
                                                        <td width="10%">
                                                        	<#if quote.lowPrice?exists && quote.highPrice?exists>${((quote.lowPrice!?eval + quote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                                        </td>
                                                        <td width="10%" <#if quote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>${quote.priceRate!"0"}</td>
                                                        <td width="15%">
                                                            <#if quote.commodityName?trim == "升贴水" && quote.grade?trim == "Al99.7">
                                                                13:00
                                                            <#elseif quote.commodityName?trim == "升贴水">
                                                                10:30
                                                            <#else>
                                                            ${quote.quoteTime?string('MM-dd')}
                                                            </#if>
                                                        </td>
                                                    </tr>
                                                    </#if>
                                                </#list>
                                            </#if>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            </div>
            <div id="index_one_price_bottom">
                <div id="index_one_price_bottom_left"><a href="${base}/aboutQuote" target="_blank">关于南储报价>></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上述为批发、仓库自提、即时付款的成交价格</div>
                <div id="index_one_price_bottom_right"><a href="${base}/price/history/area=4;category=18;startDate=;endDate=" target="_blank"><span style='color:red; font-weight: bold; font-size: 15px;'>历史价格>>></span></a></div>
                <div id="clear"></div>
            </div>
            </div>
			<div id="index_one_news">
				<div id="index_two_view_title">
					<div id="index_one_news_title_left" class="index_one_news_title_left" onMouseOver="javascript:changeStatus(this)"><h2><a target="_blank" href="${base}/comments/list-04">南储评述</a></h2></div>
					<div id="index_one_news_title_mid" class="index_one_news_title_mid" onMouseOver="javascript:changeStatus(this)"><h2><a target="_blank" href="${base}/news/reports">南储报告</a></h2></div>
					
					<div id="clear"></div>
				</div>
				<div id="afternoonE">
					<div id="index_one_news_text">
						<div id="index_one_news_text_in">
							<#if commentList?exists>
								<#list commentList as cl>
									<div id="news290_32">
									   <#if cl.code2?? && cl.code2 != '1000'><div id="news290_32_left"><a target="_blank"  href="${base}/${cl.typeName!""}">[${cl.gateName2}]</a></div><#else><div id="news290_32_left2"><a>&nbsp;</a></div></#if>
									   <div id="news290_32_mid"><a target="_blank" <#if cl.red==1>style="color:red;"</#if>  href="${base}/articles/${cl.id}">${cl.title}</a></div>
									   <div id="news290_32_right">[${cl.createDate?string("MM-dd")}]</div>
									   <div id="clear"></div>
									</div>
								</#list>
							</#if>
						</div>
					</div>
				</div>
				
				<div id="moningE" style="display:none" >
					<div id="index_one_news_text">
						<div id="index_one_news_text_in">
							<#import "/WEB-INF/template/version_2.0/specialTabContent.ftl" as nanchuReport>
                        	<@nanchuReport.tabContentComponent cmsNewContentListName = 'nanchuReportList' sizeLimit = 7 openLink = '${base}/articles/' content_width = 290 content_hight = 30 hideCategory = true imgErrorPath = '${base}/images/version_2.0/home/ncReport.jpg' />
						</div>
					</div>
				</div>
			</div>
			<div id="clear"></div>
		</div>
	   
		<div id="index_two" style="margin-top: 10px;">
			<div id="index_two_left">
				<div id="index_two_view">
					<div id="index_two_view_title">
						<div id="interview_title_0" class="interview_tab_selected" onmouseover="onMouseOverTab('interview_title_', 'interview_content_', 0)"><h3><a target="_blank" href="${base}/research">南储研究</a></h3></div>
						<div id="interview_title_1" class="interview_tab" onmouseover="onMouseOverTab('interview_title_', 'interview_content_', 1)"><a target="_blank" href="${base}/topics">专题报道</a></div>
						<div id="clear"></div>
	                </div>
	                <div id="interview_content_0">
	                	<div id="index_two_view_text">
                        	<#import "/WEB-INF/template/version_2.0/specialTabContent.ftl" as research>
                        	<@research.tabContentComponent cmsNewContentListName = 'researchList' sizeLimit = 4 openLink = '${base}/articles/' content_width = 290 content_hight = 30 hideCategory = true imgErrorPath = '${base}/images/version_2.0/home/Topics.jpg'/>
						</div>
					</div>
					<div id="interview_content_1" style="display:none">
						<div id="index_two_view_text">
							<#import "/WEB-INF/template/version_2.0/specialTabContent.ftl" as specialReport>
                        	<@specialReport.tabContentComponent cmsNewContentListName = 'specialReportList' sizeLimit = 4 openLink = '${base}/articles/' content_width = 290 content_hight = 30 hideCategory = true imgErrorPath = '${base}/images/version_2.0/home/Topics.jpg'/>
						</div>
					</div>
				</div>
	           
				<div id="index_two_report">
					<div id="index_two_report_title">
						<div id="report_title_0" class="interview_tab_selected" onmouseover="onMouseOverTab('report_title_', 'report_content_', 0)"><a target="_blank" href="${base}/comments/list-03">机构点评</a></div>
						<div id="report_title_1" class="interview_tab" onmouseover="onMouseOverTab('report_title_', 'report_content_', 1)"><a target="_blank" href="${base}/news/reports">机构报告</a></div>
						<div id="clear"></div>
					</div>
					<div id="report_content_0">
	                	<div id="index_two_view_text">
                        	<#import "/WEB-INF/template/version_2.0/specialTabContent.ftl" as orgComment>
                        	<@orgComment.tabContentComponent cmsNewContentListName = 'orgCommentList' sizeLimit = 4 openLink = '${base}/articles/' content_width = 290 content_hight = 30 hideCategory = true imgErrorPath = '${base}/images/version_2.0/home/ncReport.jpg' />
						</div>
					</div>
					<div id="report_content_1" style="display:none">
						<div id="index_two_view_text">
                        	<#import "/WEB-INF/template/version_2.0/specialTabContent.ftl" as orgReport>
                        	<@orgReport.tabContentComponent cmsNewContentListName = 'orgReportList' sizeLimit = 4 openLink = '${base}/articles/' content_width = 290 content_hight = 30 hideCategory = true imgErrorPath = '${base}/images/version_2.0/home/jgReport.jpg' />
						</div>
					</div>
				</div>
				<div id="index_two_play">
					<div id="index_two_play_title" style="margin-top: -10px;">
						<div id="index_two_play_title_left">付费会员</div>
						<div id="index_two_play_title_right"><a href="${base}/member" target="_blank">付费会员有哪些服务？</a></div>
						<div id="clear"></div>
					</div>
					<div id="index_two_play_text111">
					<div id="demo" style="overflow:hidden; height:190px;width:290px">
						<div id="demo1">
							<#if pmsList?exists>
								<#list pmsList as pms>
									<a rel="nofollow" target="_blank" href="${(pms.linkPath)!'#'}"><img src="${pms.picPath}" width="90px" height="70px" style="margin-top:20px;"/></a>
								</#list>
							</#if>
						</div>
						<div id="demo2"></div>
					</div>
					</div>
				</div>
			</div>
			<div id="index_two_mid" style="height: 760px;">
				<div id="index_two_mid_title"><a href="${base}/news/headlines" target="_blank" style="color: #005ac0;">热点要闻</a></div>
				<div id="index_two_mid_in">
					<div style="margin-top: 0px; height: 180px; border-bottom: #CCC 1px dotted;">
                        <#if hotNewsArticle?exists && hotNewsArticle.content?exists>
                            ${hotNewsArticle.content}
                        </#if>
					</div>
					
					<div class="links" style="margin-top: 10px;"><a href="${base}/news/industry/1" target="_blank">产业</a>&nbsp&nbsp<span style="color:#005ac0;"><b>|</b></span>&nbsp&nbsp<a href="${base}/news/application/1" target="_blank">应用</a></div>
                    <#import "/WEB-INF/template/cms/highLight_2.0.ftl" as importIndustryAndAppliance>
                    <@importIndustryAndAppliance.highLightComponent cmsNewContentListName = 'industryAndApplianceList' sizeLimit = 6 openLink = '${base}/articles/' listId = 'index_two_mid_list_without_dottedBottom' titleId = 'index_two_mid_list_title' textId = 'index_two_mid_list_text' isMain = 1/>

					<div class="links" style="margin-top: 10px;"><a href="${base}/news/futures/1" target="_blank">期货</a></div>
                    <#import "/WEB-INF/template/cms/highLight_2.0.ftl" as importFutureList>
                    <@importFutureList.highLightComponent cmsNewContentListName = 'futureList' sizeLimit = 3 openLink = '${base}/articles/' listId = 'index_two_mid_list_without_dottedBottom' titleId = 'index_two_mid_list_title' textId = 'index_two_mid_list_text' isMain = 1/>

                    <div class="links" style="margin-top: 10px;"><a href="${base}/news/macro/1" target="_blank">宏观</a></div>
                    <#import "/WEB-INF/template/cms/highLight_2.0.ftl" as importMacro>
                    <@importMacro.highLightComponent cmsNewContentListName = 'macroList' sizeLimit = 3 openLink = '${base}/articles/' listId = 'index_two_mid_list_without_dottedBottom' titleId = 'index_two_mid_list_title' textId = 'index_two_mid_list_text' isMain = 1/>

				</div>
			</div>
			<div id="index_two_right">
				<div id="index_two_right_in" style="height: 220px;">
					<div id="index_two_right_title">
						<div id="index_two_right_title_left"><a href="${base}/database">数据库</a></div>
						<div id="clear"></div>
					</div>
					<div id="index_two_right_text">
                        <div>
                            <div id="commodityQuoteChart" style="width:290px ; height:190px ; cursor:pointer;">
                            <!--<a href="${base}/database" target="_blank" ><img src="images/version_2.0/database_20150115.png" width="290" height="190" /></a>-->
                            </div>
                        </div>
                        <div>
                            <div id="index_three_database_button01" style="margin-left: 0px; width: 90px; background: url('${base}/images/version_2.0/database_btn01_20150115.png');"><a href="${base}/database/187" target="_blank">国内外宏观数据</a></div>
                            <div id="index_three_database_button02" style="margin-left: 0px; width: 130px; background: url('${base}/images/version_2.0/database_btn02_20150115.png');"><a href="${base}/database" target="_blank">有色金属产业链数据</a></div>
                            <div id="index_three_database_button02" style="margin-left: 0px; width: 70px; background: url('${base}/images/version_2.0/database_btn03_20150115.png');"><a href="${base}/database/506" target="_blank">南储数据</a></div>
                        </div>
					</div>
					<div id="clear"></div>
				</div>

                <div id="index_two_right_in" style="height: 220px; margin-top: 40px;">

                    <div id="index_two_right_title">
                        <div id="index_two_right_title_left"><h3><a target='_blank' href="${base}/data">数据统计</a></h3></div>
                        <div id="clear"></div>
                    </div>
                    <div id="index_two_right_text">
						<#if dataList?exists>
							<#list dataList as cl>
                                <div id="news290_32">
									<#if cl.code2?? && cl.code2 != '1000'><div id="news290_32_left"><a target="_blank"  href="${base}/${cl.typeName!""}">[${cl.gateName2}]</a></div><#else><div id="news290_32_left2"><a>&nbsp;</a></div></#if>
                                    <div id="news290_32_mid"><a target="_blank"  href="${base}/articles/${cl.id}">${cl.title}</a></div>
                                    <div id="news290_32_right">[${cl.createDate?string("MM-dd")}]</div>
                                    <div id="clear"></div>
                                </div>
							</#list>
						</#if>
                    </div>
                    <div id="clear"></div>
                </div>

				<div id="index_two_right_in" style="height: 220px; margin-top: 36px;">
					
					<div id="index_two_right_title">
						<div id="index_two_right_title_left"><a target="_blank" href="${base}/news/enterprise">企业动态</a></div>
						<div id="clear"></div>
					</div>
					<div id="index_two_right_text">
					
	                    <#if contentList?exists>
						<#assign index = 0>
							<#list contentList as cl>
								<#if cl.code=="200010061003" && index<6>
								<#assign index = index+1>
								<div id="news290_32">
								   <div id="news290_32_left2"><a target="_blank" <#-- href="${base}/${cl.typeName!""}" --> >&nbsp<#-- [${cl.gateName2}] --></a></div> 
								   <div id="news290_32_mid"><a target="_blank"  href="${base}/articles/${cl.id}">${cl.title}</a></div>
								   <div id="news290_32_right">[${cl.createDate?string("MM-dd")}]</div>
								   <div id="clear"></div>
								</div>
								</#if>
							</#list>
						</#if>
						
					</div>
					<div id="clear"></div>
				</div>

			</div>
			<div id="clear"></div>
		</div>
	   
		<div id="mid_ad" style="margin-top: 10px;">
			<#--${CAds!}-->
			<div style = "position: relative; width: 1000px;height: 65px;background: #FFF; overflow: hidden;">
			<div style="position: absolute; width: 260px;height: 65px;left: 0px;top: 0px;background: #FFF;">
				<a rel="nofollow" href="http://www.lfwxd.com/" target="_blank">
					<img src="${base}/images/version_2.0/linfenjiaohua.gif" alt="C0101临汾焦化"/>
				</a>
			</div>
			<div style="position: absolute; width: 260px;height: 65px;left: 253px;top: 0px;background: #FFF;">
				<img src="${base}/images/version_2.0/05zhaozu.gif" alt="C0102广告招租"/>
			</div>
			<div style="position: absolute; width: 260px;height: 65px;left: 506px;top: 0px;background: #FFF;">
				<img src="/upload/advert/2014/11/05/0954/45_068726.gif" alt="C0103南储仓"/>
			</div>
			<div style="position: absolute; width: 260px;height: 65px;left: 760px;top: 0px;background: #FFF;">
				<a rel="nofollow" href="http://www.cttd.cn/" target="_blank">
					<img src="${base}/images/version_2.0/zhongjvjinshu.png" alt="C0104中钜"/>
				</a>
			</div>
			</div>
		</div>

		<div id="index_four" style="margin-top: 0px;">
			<div id="index_four_left">
				<#include "/WEB-INF/template/version_2.0/commodityTable.ftl"/>
			</div>
			<div id="index_four_right">
				<div id="index_four_right_in">
					<div id="index_four_right_title">
						<div id="index_four_right_title_left"><a target="_blank" href="${base}/recommend">企业推荐</a></div>
						<div id="clear"></div>
					</div>
					<div id="index_four_right_text">
						<#if enterpriseList?exists>
							<#list enterpriseList as enterprise>
								<div id="news290_32">
									<#if enterprise.commType?? && enterprise.commType != '1000'><div id="news290_32_left"><a target="_blank" href="${base}/${enterprise.commodityCategoryCodeShortName}/recommend">[${enterprise.commName!""}]</a></div><#else><div id="news290_32_left2"><a>&nbsp;</a></div></#if>
									<div id="news290_32_mid"><a rel="nofollow" href="${enterprise.url!""}" target="_blank">${enterprise.name!""}</a></div>
									<div id="news290_32_right">[${enterprise.updateTime?string("MM-dd")}]</div>
									<div id="clear"></div>
								</div>
							</#list>							
						</#if>
					</div>
				</div>
				<div id="clear"></div>
			</div>
			<div id="clear"></div>
		</div>
	   
		<div id="index_five" style="margin-top: 10px;">
			<div id="index_five_left">
				<div id="index_five_left_in">
					<div id="index_five_left_title">
						<div id="index_five_left_title_left"><a target="_blank"  href="${base}/baike">有色百科</a></div>
						<div id="clear"></div>
					</div>
					<div id="index_five_left_text">
					
						<#if contentList?exists>
						<#assign index = 0>
							<#list contentList as cl>
									<#if cl.code=="200010061004" && index<8>
								<#assign index = index+1>
									<div id="news320_32">
									   <div id="news320_32_left"><a target="_blank" <#-- href="${base}/${cl.typeName!""}" --> >&nbsp<#-- [${cl.gateName2}] --></a></div> 
									   <div id="news320_32_mid"><a target="_blank"  href="${base}/articles/${cl.id}">${cl.title}</a></div>
									   <div id="news320_32_right">[${cl.createDate?string("MM-dd")}]</div>
									   <div id="clear"></div>
									</div>
								</#if>
							</#list>
						</#if>
					
					</div>
				</div>
				<div id="clear"></div>
			</div>
			<div id="index_five_mid">
				<div id="index_five_mid_in">
					<div id="index_five_mid_title">
						<div id="index_five_mid_title_left"><a target="_blank" href="${base}/bbs">互动</a></div>
						<div class="bbs-ask"><a target="_blank" href="${base}/bbs/ask">我要提问</a></div>
						<div id="clear"></div>
					</div>
					<div id="index_five_mid_text">
					<#if tquestionList?exists>
						<#list tquestionList as cl> 
		                    <div id="index_five_mid_inter">
								<div id="index_five_mid_inter_user"><a target="_blank" href="${base}/bbs/${(cl.id)!0}"><span>网友：</span>${(cl.title)!""}</a></div>
								<div id="index_five_mid_inter_we">
								<a target="_blank" href="${base}/bbs/${(cl.id)!0}">
									<span>南储：</span>
										<#if cl.answerContent?? && cl.answerContent?string?length gt 42 >
											${cl.answerContent?substring(0,42)}......
										<#else>
											${cl.answerContent!""}
										</#if>
									
								</a>
								</div>
		                    </div>
                		</#list>
	                </#if>   
					</div>
				</div>
				<div id="clear"></div>
			</div>
			<div id="index_five_right">
				<div id="index_five_right_in">
					<div id="index_five_right_title">
						<div id="index_five_right_title_left"><a target="_blank" href="${base}/joke">轻松一刻</a></div>
						<div id="clear"></div>
					</div>
					<div id="index_five_right_text">
						<#if contentList?exists>
						<#assign index = 0>
							<#list jokeList as cl>
								<#if cl.code=="200010061005" && index<4 >
								<#assign index = index+1>
									<div id="index_five_right_text_in">
										<div id="index_five_right_text_in_title"><a href="${base}/articles/${cl.id}">${cl.title}</a></div>
										<div id="index_five_right_text_in_text">
											<#if cl.textContent?? && cl.textContent?string?length gt 42>
												${cl.textContent?substring(0,42)}......
											<#else>
												${cl.textContent}
											</#if>
										</div>
									</div>
								</#if>
							</#list>
						</#if>
					</div>
				</div>
				<div id="clear"></div>
			</div>
			<div id="clear"></div>
		</div>
		
		<div id="mid_ad">
			<#--${EAds!}-->
			<div style = "position: relative; width: 1000px;height: 65px;background: #FFF; overflow: hidden;">
				<div style="position: absolute; width: 260px;height: 65px;left: 0px;top: 0px;background: #FFF;">
					<img src="${base}/images/version_2.0/zhongzhuyihong.png" alt="E0101中珠亿宏"/> 
				</div>
				<div style="position: absolute; width: 260px;height: 65px;left: 253px;top: 0px;background: #FFF;">
					<img src="${base}/images/version_2.0/02nanchuwuliu_240_65.png" alt="E0102南储物流"/> 					
				</div>
				<div style="position: absolute; width: 260px;height: 65px;left: 507px;top: 0px;background: #FFF;">
					<img src="/upload/advert/2014/11/05/0956/51_809827.gif" alt="E0103船运"/> 
				</div>
				<div style="position: absolute; width: 260px;height: 65px;left: 760px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.ghmcchina.com/index/index.jsp/" target="_blank">
						<img src="${base}/images/version_2.0/riye.gif" alt="E0104日野"/>
					</a>
				</div>
			</div>
		</div> 
	   <!-- 首页主页结束 -->
        <#include "/WEB-INF/template/common/footer_2.0.ftl"/>
	</body>
</html>	

</#compress>
