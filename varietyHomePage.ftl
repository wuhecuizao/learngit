<#setting number_format="#">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<#if varietyCode == "10001000">
			<title>铜价_电解铜价格_最新铜价行情_铜价格走势_南储商务网铜专区</title>
			<meta name="chinaz-site-verification" content="946a59c8-2fe3-4797-85f0-6e99caff9d27" />
			<meta name="keywords" content="铜价格，电解铜价格，今日铜价，铜价行情，铜价格走势图" />
			<meta name="description" content="南储商务网权威发布今日铜价格、电解铜价格，深度剖析最新铜价格走势，并提供铜现货历史价格查询服务。" />
		</#if>
		<#if varietyCode == "10001001">
			<title>铝价_铝锭价格_氧化铝价格_铝价格走势_南储商务网铝专区</title>
			<meta name="chinaz-site-verification" content="946a59c8-2fe3-4797-85f0-6e99caff9d27" />
			<meta name="keywords" content="铝价格，铝锭价格，今日铝锭价格，今日铝价，铝价走势" />
			<meta name="description" content="南储商务网权威发布今日铝价格、铝锭价格，深度剖析最新铝价格走势，并提供铝价格查询服务。" />
		</#if>
		<#if varietyCode == "10001002">
			<title>锌价_锌锭价格_锌价格行情_锌价格走势_南储商务网锌专区</title>
			<meta name="chinaz-site-verification" content="946a59c8-2fe3-4797-85f0-6e99caff9d27" />
			<meta name="keywords" content="锌价格，锌锭价格，锌价格行情" />
			<meta name="description" content="南储商务网权威发布今日锌价格、锌锭价格，深度剖析最新锌价格走势，并提供锌价格查询服务。" />
		</#if>
		<#if varietyCode == "10001003">
			<title>铅价_今日铅价_铅锭价格_铅价格走势_南储商务网铅专区</title>
			<meta name="chinaz-site-verification" content="946a59c8-2fe3-4797-85f0-6e99caff9d27" />
			<meta name="keywords" content="铅价格，今日铅价，铅锭价格，铅精矿价格" />
			<meta name="description" content="南储商务网权威发布今日铅价格、铅锭价格，深度剖析最新铅价格走势，并提供铅价格查询服务。" />
		</#if>
		<#if varietyCode == "10001011">
			<title>锡价_今日锡价_锡锭价格_锡价格走势_南储商务网锡专区</title>
			<meta name="chinaz-site-verification" content="946a59c8-2fe3-4797-85f0-6e99caff9d27" />
			<meta name="keywords" content="锡价格，今日锡价，锡价格行情，锡锭" />
			<meta name="description" content="南储商务网权威发布今日锡价格、锡锭价格，深度剖析最新锡价格走势，并提供锡价格查询服务。" />
		</#if>
		<#if varietyCode == "10001004">
			<title>镍价_电解镍价格_镍价行情_镍价格走势__南储商务网镍专区</title>
			<meta name="chinaz-site-verification" content="946a59c8-2fe3-4797-85f0-6e99caff9d27" />
			<meta name="keywords" content="镍价，镍价格，电解镍价格，镍价格行情" />
			<meta name="description" content="南储商务网权威发布今日镍价格、电解镍价格，深度剖析最新镍价格走势，并提供镍价格查询服务。" />
		</#if>
		<#include "/WEB-INF/template/common/common_2.0.ftl"/>
        <link href="${base}/css/version_2.0/style_two.css" rel="stylesheet" type="text/css" />
        <link href="${base}/css/version_2.0/style.css" rel="stylesheet" type="text/css" />
        <link href="${base}/css/version_2.0/commodityStyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${base}/js/plugins/highcharts/highcharts.js"></script>
        <script type="text/javascript" src="${base}/js/version_2.0/commodityTab.js"></script>

        <style type="text/css">

            .scroll_table table {
                width: 100%;
                text-align: center;
                border-spacing: 0px;
            }

            .header {
                height: 30px;
                background: #F6F7F6;
            }

            .scroll_table table tr {
                height: 30px;
            }

            .scroll_table table tr td {
                border-bottom: 1px solid #ccc;
            }

        </style>

        <script type="text/javascript">

            var mainLineAjaxData;

            $(document).ready(function() {

                Highcharts.setOptions({
                    global:{
                        useUTC : false
                    }
                });
                ajaxRetrieveDataAndChart();

            });

            function onMouseOverTab(tabPrefixId, contentPrefixId, activedIndex) {

                var tabs = $("div[id^='" + tabPrefixId + "']");

                var contents = $("div[id^='" + contentPrefixId + "']");

                $.each(tabs, function(index, item) {

                    var tab = $(item);

                    if (index == activedIndex) {

                        if (index == 0) {
                            tab.attr('class', 'variety_tab_first_selected');
                        } else {
                            tab.attr('class','variety_tab_selected');
                        }

                    } else {
                        if (index == 0) {
                            tab.attr('class', 'variety_tab_first_normal');
                        } else {
                            tab.attr('class', 'variety_tab_normal');
                        }
                    }
                });

                $.each(contents, function(index, item) {

                    var content = $(item);

                    if (index == activedIndex) {
                        content.css('display','block');
                    } else {
                        content.css('display','none');
                    }
                });
            }

            function ajaxRetrieveDataAndChart() {

                $.ajax({
                    type: "post",
                    url: '${base}/ajaxVarietyChartsData.action',
                    data: {"code": ${varietyCode} },
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

                var minXValue;
                if (mainLineAjaxData.mainAxis && mainLineAjaxData.mainAxis[0] && mainLineAjaxData.mainAxis[0][0]) {
                    minXValue = mainLineAjaxData.mainAxis[0][0];
                }

                var maxXValue;
                if (mainLineAjaxData.mainAxis && mainLineAjaxData.mainAxis[mainLineAjaxData.mainAxis.length-1] && mainLineAjaxData.mainAxis[mainLineAjaxData.mainAxis.length-1][0]) {
                    maxXValue = mainLineAjaxData.mainAxis[mainLineAjaxData.mainAxis.length-1][0];
                }

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
                        text: "最近三个月走势图",
                        style: { color: "#005ac0", fontSize: "10px" }
                    },
                    xAxis: {
                        type: 'datetime',
                        showFirstLabel: true,
                        showLastLabel: true,
                        minPadding: 0,
                        min: minXValue,
                        max: maxXValue,
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
                        title:{
                            text : ''
                        }
                    }],
                    tooltip: {
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
                        name: '${varietyName}',
                        yAxis: 0
                    }]
                });
            }

		</script>

	</head>
	<body>
		<#include "/WEB-INF/template/common/header_2.0.ftl"/>

    <div id="variety_one">
        <div id="variety_one_left">
            <#import "/WEB-INF/template/cms/news_2.0.ftl" as importComment>
            <@importComment.cmsNewContentComponent foobarName = '${varietyName}市点评' moreLink = '${base}/${varietyShortName}/comments/1' cmsNewContentListName = 'commentList' sizeLimit = 6 openLink = '${base}/articles/' content_width = 245 content_hight = 32 primeTagId = 'variety_one_omments' subTagId = 'variety_one_omments' hideCategory = true />
        </div>
        <div id="variety_one_mid">
            <#if commodityCode?exists>
                <!-- 铜 -->
                <#if commodityCode == "10001000">
                    <div id="variety_three_box_top" style="margin-top: 0px; width: 100%;">
                        <div id="tab_price_one_0" class="variety_tab_first_selected" onmouseover="onMouseOverTab('tab_price_one_', 'content_price_one_', 0)" >铜报价</div>
                        <div id="tab_price_one_1" class="variety_tab_normal" onmouseover="onMouseOverTab('tab_price_one_', 'content_price_one_', 1)" >灵通报价</div>
                        <div id="tab_price_one_2" class="variety_tab_normal" onmouseover="onMouseOverTab('tab_price_one_', 'content_price_one_', 2)" >铜加工材</div>
                        <div id="clear"></div>
                    </div>
                    <div id="content_price_one_0">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                    <tr class="header">
                                        <th width="35%">品名</th>
                                        <th width="25%">价格区间</th>
                                        <th width="15%">均价</th>
                                        <th width="15%">涨跌</th>
                                        <th width="10%">日期</th>
                                    </tr>
                                    <#if copperCommodityQuoteList?exists>
                                        <#list copperCommodityQuoteList as commodityQuote>
                                            <tr>
                                                <td width="35%">
                                                    <#if commodityQuote.quoteType == 1>
                                                        ${commodityQuote.commodityType.gbName!""}
                                                        &nbsp;
                                                        (${commodityQuote.quotationArea})
                                                    </#if>
                                                    <#if commodityQuote.quoteType == 3>
                                                        ${commodityQuote.quotationType}
                                                        &nbsp;
                                                        (${commodityQuote.quotationArea})
                                                    </#if>
                                                </td>
                                                <td width="25%">
                                                	<#if commodityQuote.commodityName?trim == "升贴水" >
                                                		<#if commodityQuote.lowPrice?eval lt 0>(c)${commodityQuote.lowPrice!?substring(1, commodityQuote.lowPrice!?length)}<#else>(b)${commodityQuote.lowPrice!"0"}</#if>-<#if commodityQuote.highPrice?eval lt 0>(c)${commodityQuote.highPrice!?substring(1, commodityQuote.highPrice!?length)}<#else>(b)${commodityQuote.highPrice!"0"}</#if>
                                                	<#else>
                                                   		${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                                    </#if>
                                                </td>
                                                <td width="15%">
                                                    <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                                </td>
                                                <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                    ${commodityQuote.priceRate!"0"}
                                                </td>
                                                <td width="10%">
                                                    ${commodityQuote.quoteTime?string('MM-dd')}
                                                </td>
                                            </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="content_price_one_1"  style="display: none; height: 230px; overflow: auto;">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                <tr class="header">
                                    <th width="35%">品名</th>
                                    <th width="25%">价格区间</th>
                                    <th width="15%">均价</th>
                                    <th width="15%">涨跌</th>
                                    <th width="10%">日期</th>
                                </tr>
                                    <#if commodityQuoteList?exists>
                                        <#list commodityQuoteList as commodityQuote>
                                            <#if commodityQuote.area == "6" && commodityQuote.quoteType == 1>
                                                <tr>
                                                    <td width="35%">
                                                        ${commodityQuote.commodityType.gbName!""}
                                                    </td>
                                                    <td width="25%">
                                                    ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                                    </td>
                                                    <td width="15%">
                                                    <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                                    </td>
                                                    <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                    ${commodityQuote.priceRate!"0"}
                                                    </td>
                                                    <td width="10%">
                                                    ${commodityQuote.quoteTime?string('MM-dd')}
                                                    </td>
                                                </tr>
                                            </#if>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <!-- 铜分类下加入“铜加工材” -->
                    <div id="content_price_one_2"  style="display: none; height: 230px; overflow: auto;">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                <tr class="header">
                                    <th width="35%">品名</th>
                                    <th width="25%">价格区间</th>
                                    <th width="15%">均价</th>
                                    <th width="15%">涨跌</th>
                                    <th width="10%">日期</th>
                                </tr>
                                    <#if copperProcessCommodityQuoteList?exists>
                                        <#list copperProcessCommodityQuoteList?sort_by("commodityId") as commodityQuote>
                                            <#if commodityQuote.area == "4" && commodityQuote.quoteType == 1>
                                                <tr>
                                                    <td width="35%">
                                                        ${commodityQuote.commodityName}
                                                    </td>
                                                    <td width="25%">
                                                    ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                                    </td>
                                                    <td width="15%">
                                                    <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                                    </td>
                                                    <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                    ${commodityQuote.priceRate!"0"}
                                                    </td>
                                                    <td width="10%">
                                                    ${commodityQuote.quoteTime?string('MM-dd')}
                                                    </td>
                                                </tr>
                                            </#if>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                <!-- 铅 -->
                <#elseif commodityCode == "10001003">
                    <div id="variety_three_box_top" style="margin-top: 0px; width: 100%;">
                        <div id="tab_price_two_0" class="variety_tab_first_selected" onmouseover="onMouseOverTab('tab_price_two_', 'content_price_two_', 0)" >铅报价</div>
                        <div id="clear"></div>
                    </div>
                    <div id="content_price_two_0">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                    <tr class="header">
                                        <th width="35%">品名</th>
                                        <th width="25%">价格区间</th>
                                        <th width="15%">均价</th>
                                        <th width="15%">涨跌</th>
                                        <th width="10%">日期</th>
                                    </tr>
                                    <#if leadCommodityQuoteList?exists>
                                        <#list leadCommodityQuoteList as commodityQuote>
                                        <tr>
                                            <td width="35%">
                                                <#if commodityQuote.quoteType == 1>
                                                    ${commodityQuote.commodityType.gbName!""}
                                                    &nbsp;
                                                    (${commodityQuote.quotationArea})
                                                </#if>
                                                <#if commodityQuote.area == '1'>
                                                    ${commodityQuote.quotationType}
                                                </#if>
                                            </td>
                                            <td width="25%">
                                                ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                            </td>
                                            <td width="15%">
                                                <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                            </td>
                                            <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                ${commodityQuote.priceRate!"0"}
                                            </td>
                                            <td width="10%">
                                                ${commodityQuote.quoteTime?string('MM-dd')}
                                            </td>
                                        </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="margin-top: 65px; text-align: center;">
                        注：国产铅精矿T/C单位为 元/金属吨， 进口铅精矿T/C单位为 美元/千吨
                    </div>

                <!-- 锡 -->
                <#elseif commodityCode == "10001011">
                    <div id="variety_three_box_top" style="margin-top: 0px; width: 100%;">
                        <div id="tab_price_three_0" class="variety_tab_first_selected" onmouseover="onMouseOverTab('tab_price_three_', 'content_price_three_', 0)" >锡报价</div>
                        <div id="clear"></div>
                    </div>
                    <div id="content_price_three_0">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                    <tr class="header">
                                        <th width="35%">品名</th>
                                        <th width="25%">价格区间</th>
                                        <th width="15%">均价</th>
                                        <th width="15%">涨跌</th>
                                        <th width="10%">日期</th>
                                    </tr>
                                    <#if tinCommodityQuoteList?exists>
                                        <#list tinCommodityQuoteList as commodityQuote>
                                        <tr>
                                            <td width="35%">
                                                <#if commodityQuote.quoteType == 1>
                                                    ${commodityQuote.commodityType.gbName!""}
                                                    &nbsp;
                                                    (${commodityQuote.quotationArea})
                                                </#if>
                                            </td>
                                            <td width="25%">
                                                ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                            </td>
                                            <td width="15%">
                                                <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                            </td>
                                            <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                ${commodityQuote.priceRate!"0"}
                                            </td>
                                            <td width="10%">
                                                ${commodityQuote.quoteTime?string('MM-dd')}
                                            </td>
                                        </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                <!-- 镍 -->
                <#elseif commodityCode == "10001004">
                    <div id="variety_three_box_top" style="margin-top: 0px; width: 100%;">
                        <div id="tab_price_four_0" class="variety_tab_first_selected" onmouseover="onMouseOverTab('tab_price_four_', 'content_price_four_', 0)" >镍报价</div>
                        <div id="clear"></div>
                    </div>
                    <div id="content_price_four_0">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                    <tr class="header">
                                        <th width="35%">品名</th>
                                        <th width="25%">价格区间</th>
                                        <th width="15%">均价</th>
                                        <th width="15%">涨跌</th>
                                        <th width="10%">日期</th>
                                    </tr>
                                    <#if nickelCommodityQuoteList?exists>
                                        <#list nickelCommodityQuoteList as commodityQuote>
                                        <tr>
                                            <td width="35%">
                                                <#if commodityQuote.quoteType == 1>
                                                    ${commodityQuote.commodityType.gbName!""}
                                                    &nbsp;
                                                    (${commodityQuote.quotationArea})
                                                </#if>
                                            </td>
                                            <td width="25%">
                                                ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                            </td>
                                            <td width="15%">
                                                <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                            </td>
                                            <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                ${commodityQuote.priceRate!"0"}
                                            </td>
                                            <td width="10%">
                                                ${commodityQuote.quoteTime?string('MM-dd')}
                                            </td>
                                        </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                <!-- 铝 -->
                <#elseif commodityCode == "10001001">
                    <div id="variety_three_box_top" style="margin-top: 0px; width: 100%;">
                        <div id="tab_price_five_0" class="variety_tab_first_selected" onmouseover="onMouseOverTab('tab_price_five_', 'content_price_five_', 0)" >铝现货</div>
                        <div id="tab_price_five_1" class="variety_tab_normal" onmouseover="onMouseOverTab('tab_price_five_', 'content_price_five_', 1)" >氧化铝</div>
                        <div id="tab_price_five_2" class="variety_tab_normal" onmouseover="onMouseOverTab('tab_price_five_', 'content_price_five_', 2)" >预焙阳极</div>
                        <div id="tab_price_five_3" class="variety_tab_normal" onmouseover="onMouseOverTab('tab_price_five_', 'content_price_five_', 3)" >辅料</div>
                        <div id="clear"></div>
                    </div>
                    <div id="content_price_five_0">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                    <tr class="header">
                                        <th width="35%">品名</th>
                                        <th width="25%">价格区间</th>
                                        <th width="15%">均价</th>
                                        <th width="15%">涨跌</th>
                                        <th width="10%">日期</th>
                                    </tr>
                                    <#if aluminiumOneCommodityQuoteList?exists>
                                        <#list aluminiumOneCommodityQuoteList as commodityQuote>
                                        <tr>
                                            <td width="35%">
                                                <#if commodityQuote.quoteType == 1>
                                                    <#if commodityQuote.commodityId == 8>
                                                        <#if commodityQuote.area == '4'>
                                                            华南现货成交${commodityQuote.commodityName}
                                                        </#if>
                                                        <#if commodityQuote.area == '5'>
                                                            华东现货成交${commodityQuote.commodityName}
                                                        </#if>
                                                    <#elseif commodityQuote.commodityId == 22>
                                                        <#if commodityQuote.area == '4'>
                                                            华南${commodityQuote.commodityName}
                                                        </#if>
                                                        <#if commodityQuote.area == '5'>
                                                            华东${commodityQuote.commodityName}
                                                        </#if>
                                                    <#elseif commodityQuote.commodityId == 55 || commodityQuote.commodityId == 56>
                                                        <#if commodityQuote.area == '4'>
                                                            华南 ${commodityQuote.grade}  ${commodityQuote.commodityName}
                                                        </#if>
                                                    <#else>
                                                        ${commodityQuote.quotationArea}
                                                    </#if>
                                                </#if>
                                            </td>
                                            <td width="25%">
                                                ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                            </td>
                                            <td width="15%">
                                                <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                            </td>
                                            <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                ${commodityQuote.priceRate!"0"}
                                            </td>
                                            <td width="10%">
                                                ${commodityQuote.quoteTime?string('MM-dd')}
                                            </td>
                                        </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                        <div style="margin-top: 50px; text-align: center;">
                            注：华南现货成交升贴水为华南实际成交价与南储华南报价之差
                            <br/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;华东现货成交升贴水为华东实际成交价与南储华东报价之差
                        </div>
                    </div>
                    <div id="content_price_five_1" style="display: none; overflow: auto; height: 235px;">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                    <tr class="header">
                                        <th width="35%">品名</th>
                                        <th width="25%">价格区间</th>
                                        <th width="15%">均价</th>
                                        <th width="15%">涨跌</th>
                                        <th width="10%">日期</th>
                                    </tr>
                                    <#if aluminiumTwoCommodityQuoteList?exists>
                                        <#list aluminiumTwoCommodityQuoteList as commodityQuote>
                                        <tr>
                                            <td width="35%">
                                                <#if commodityQuote.area == '1'>
                                                    <#if commodityQuote.quoteType == 9>
                                                        南储${commodityQuote.quotationType}
                                                    <#else>
                                                        ${commodityQuote.quotationType}
                                                    </#if>
                                                </#if>
                                            </td>
                                            <td width="25%">
                                                ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                                <#if commodityQuote.quoteType?exists && commodityQuote.quoteType == 7>
                                                    美元
                                                </#if>
                                            </td>
                                            <td width="15%">
                                                <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                            </td>
                                            <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                ${commodityQuote.priceRate!"0"}
                                            </td>
                                            <td width="10%">
                                                ${commodityQuote.quoteTime?string('MM-dd')}
                                            </td>
                                        </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="content_price_five_2" style="display: none;">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                    <tr class="header">
                                        <th width="35%">品名</th>
                                        <th width="40%">价格</th>
                                        <th width="15%">涨跌</th>
                                        <th width="10%">日期</th>
                                    </tr>
                                    <#if aluminiumThreeCommodityQuoteList?exists>
                                        <#list aluminiumThreeCommodityQuoteList as commodityQuote>
                                        <tr>
                                            <td width="35%">
                                                <#if commodityQuote.area == '1'>
                                                    ${commodityQuote.quotationType!""}
                                                </#if>
                                            </td>
                                            <td width="40%">
                                                ${commodityQuote.highPrice!"0"}
                                            </td>
                                            <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                ${commodityQuote.priceRate!"0"}
                                            </td>
                                            <td width="10%">
                                                ${commodityQuote.quoteTime?string('MM-dd')}
                                            </td>
                                        </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="content_price_five_3" style="display: none;">
                        <div class="scroll_table">
                            <table>
                                <tbody>
                                    <tr class="header">
                                        <th width="35%">品名</th>
                                        <th width="40%">价格</th>
                                        <th width="15%">涨跌</th>
                                        <th width="10%">日期</th>
                                    </tr>
                                    <#if aluminiumFourCommodityQuoteList?exists>
                                        <#list aluminiumFourCommodityQuoteList as commodityQuote>
                                        <tr>
                                            <td width="35%">
                                                <#if commodityQuote.quoteType == 1>
                                                    ${commodityQuote.commodityType.gbName!""}
                                                    &nbsp;
                                                    (${commodityQuote.quotationArea})
                                                </#if>
                                            </td>
                                            <td width="40%">
                                                ${commodityQuote.highPrice!"0"}
                                            </td>
                                            <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                                ${commodityQuote.priceRate!"0"}
                                            </td>
                                            <td width="10%">
                                                ${commodityQuote.quoteTime?string('MM-dd')}
                                            </td>
                                        </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                <!-- 锌 -->
                <#elseif commodityCode == "10001002">
                <div id="variety_three_box_top" style="margin-top: 0px; width: 100%;">
                    <div id="tab_price_six_0" class="variety_tab_first_selected" onmouseover="onMouseOverTab('tab_price_six_', 'content_price_six_', 0)" >南储华南</div>
                    <div id="tab_price_six_1" class="variety_tab_normal" onmouseover="onMouseOverTab('tab_price_six_', 'content_price_six_', 1)" >南储华东</div>
                    <div id="tab_price_six_2" class="variety_tab_normal" onmouseover="onMouseOverTab('tab_price_six_', 'content_price_six_', 2)" >锌精矿</div>
                    <div id="clear"></div>
                </div>
                <div id="content_price_six_0">
                    <div class="scroll_table">
                        <table>
                            <tbody>
                            <tr class="header">
                                <th width="35%">品名</th>
                                <th width="25%">价格区间</th>
                                <th width="15%">均价</th>
                                <th width="15%">涨跌</th>
                                <th width="10%">日期</th>
                            </tr>
                                <#if zincOneCommodityQuoteList?exists>
                                    <#list zincOneCommodityQuoteList as commodityQuote>
                                    <tr>
                                        <td width="35%">
                                            <#if commodityQuote.quoteType == 1>
                                                ${commodityQuote.commodityType.name!""}
                                            </#if>
                                            <#if commodityQuote.quoteType == 16>
                                                ${commodityQuote.commodityType.name!""}
                                                &nbsp;
                                                (${commodityQuote.quotationType})
                                            </#if>
                                        </td>
                                        <td width="25%">
                                        ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                        </td>
                                        <td width="15%">
                                        <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                        </td>
                                        <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                        ${commodityQuote.priceRate!"0"}
                                        </td>
                                        <td width="10%">
                                        ${commodityQuote.quoteTime?string('MM-dd')}
                                        </td>
                                    </tr>
                                    </#list>
                                </#if>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="content_price_six_1" style="display: none;">
                    <div class="scroll_table">
                        <table>
                            <tbody>
                            <tr class="header">
                                <th width="35%">品名</th>
                                <th width="25%">价格区间</th>
                                <th width="15%">均价</th>
                                <th width="15%">涨跌</th>
                                <th width="10%">日期</th>
                            </tr>
                                <#if zincTwoCommodityQuoteList?exists>
                                    <#list zincTwoCommodityQuoteList as commodityQuote>
                                    <tr>
                                        <td width="35%">
                                            <#if commodityQuote.quoteType == 1>
                                                ${commodityQuote.commodityType.name!""}
                                            </#if>
                                            <#if commodityQuote.quoteType == 17>
                                                ${commodityQuote.commodityType.name!""}
                                                &nbsp;
                                                (${commodityQuote.quotationType})
                                            </#if>
                                        </td>
                                        <td width="25%">
                                            ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                        </td>
                                        <td width="15%">
                                            <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                        </td>
                                        <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                            ${commodityQuote.priceRate!"0"}
                                        </td>
                                        <td width="10%">
                                            ${commodityQuote.quoteTime?string('MM-dd')}
                                        </td>
                                    </tr>
                                    </#list>
                                </#if>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="content_price_six_2" style="display: none;">
                    <div class="scroll_table">
                        <table>
                            <tbody>
                            <tr class="header">
                                <th width="35%">品名</th>
                                <th width="25%">价格区间</th>
                                <th width="15%">均价</th>
                                <th width="15%">涨跌</th>
                                <th width="10%">日期</th>
                            </tr>
                                <#if zincThreeCommodityQuoteList?exists>
                                    <#list zincThreeCommodityQuoteList as commodityQuote>
                                    <tr>
                                        <td width="35%">
                                            <#if commodityQuote.area == '1'>
                                                ${commodityQuote.quotationType}
                                            </#if>
                                        </td>
                                        <td width="25%">
                                        ${commodityQuote.lowPrice!"0"}-${commodityQuote.highPrice!"0"}
                                        </td>
                                        <td width="15%">
                                        <#if commodityQuote.lowPrice?exists && commodityQuote.highPrice?exists>${((commodityQuote.lowPrice!?eval + commodityQuote.highPrice!?eval) / 2)?string("#")}<#else>0</#if>
                                        </td>
                                        <td width="15%" <#if commodityQuote.priceRate?eval lt 0>class="red"<#else>class="green"</#if>>
                                        ${commodityQuote.priceRate!"0"}
                                        </td>
                                        <td width="10%">
                                        ${commodityQuote.quoteTime?string('MM-dd')}
                                        </td>
                                    </tr>
                                    </#list>
                                </#if>
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-top: 125px; text-align: center;">
                        注：国产锌精矿T/C单位为 元/金属吨， 进口锌精矿T/C单位为 美元/千吨
                    </div>
                </div>

                </#if>
            </#if>
        </div>
        <div id="variety_one_right">
            <div id="variety_one_chart">
                <div id="variety_one_chart_title">
                    <div id="variety_one_chart_title_left"><a href="${base}/price/history/area=1;category=${commodityName};startDate=${beginDate};endDate=${endDate}" target="_blank" style="color: #005ac0;" >${varietyName}价走势图</a></div>
                    <div id="clear"></div>
                </div>
                <div id="variety_one_chart_text">
                    <div id="commodityQuoteChart" style="width: 100%; height: 220px;"></div>
                </div>
            </div>
        </div>
        <div id="clear"></div>
    </div>
    
	<#if varietyCode == "10001000">
		<div id="mid_ad">
	        <div style = "position: relative; width: 1000px;height: 65px;background: #FFF; overflow: hidden;">
				<div style="position: absolute; width: 245px;height: 65px;left: 0px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.xxjhky.com/" target="_blank">
						<img src="${base}/images/version_2.0/02xinxingjihua.png" /> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 253px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.hy-cable.cn/" target="_blank">
						<img src="${base}/images/version_2.0/03hongyandianlan.png" /> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 506px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.fsxunlian.com/" target="_blank">
						<img src="${base}/images/version_2.0/04xunlianxinxi.png" /> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 760px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.gdjly.com/" target="_blank">
						<img src="${base}/images/version_2.0/05jinlianyu.png" /> 
					</a>
				</div>
			</div>
	    </div>
	<#else>			
	    <div id="mid_ad">
	        <div style = "position: relative; width: 1000px;height: 65px;background: #FFF; overflow: hidden;">
				<div style="position: absolute; width: 245px;height: 65px;left: 0px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.shdayemetal.com" target="_blank">
						<img src="${base}/images/version_2.0/04dayeyouse.gif" alt="大业有色"/> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 253px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.gdnmi.com.cn" target="_blank">
						<img src="${base}/images/version_2.0/04guangsheng_1.gif" alt="广晟有色"/> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 506px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.ghmcchina.com/index/index.jsp" target="_blank">
						<img src="${base}/images/version_2.0/05riye.gif" alt="日野"/> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 760px;top: 0px;background: #FFF;">
					<a href="#" target="_blank">
						<img src="${base}/images/version_2.0/02nanchuwuliu_240_65.png" alt="南储物流"/> 
					</a>
				</div>
			</div>
	    </div>
	</#if>

    <div id="variety_two">
        <div id="variety_two_left">
            <#import "/WEB-INF/template/cms/news_2.0.ftl" as importReport>
            <@importReport.cmsNewContentComponent foobarName = '${varietyName}报告' moreLink = '${base}/${varietyShortName}/report/1' cmsNewContentListName = 'reportList' sizeLimit = 6 openLink = '${base}/articles/' content_width = 245 content_hight = 32 primeTagId = 'variety_two_report' subTagId = 'variety_two_news' hideCategory = true />

            <#import "/WEB-INF/template/cms/news_2.0.ftl" as importEnterpriseActivity>
            <@importEnterpriseActivity.cmsNewContentComponent foobarName = '企业动态' moreLink = '${base}/${varietyShortName}/enterprise/1' cmsNewContentListName = 'enterpriseActivityList' sizeLimit = 6 openLink = '${base}/articles/' content_width = 245 content_hight = 32 primeTagId = 'variety_two_news' subTagId = 'variety_two_news' hideCategory = true />
        </div>
        <div id="variety_two_mid">
            <div id="variety_two_allnews">
                <div id="variety_two_allnews_title">
                    <div id="variety_two_allnews_title_left"><a href="${base}/${varietyShortName}/headlines/1" target="_blank" style="color: #005ac0;">要闻</a></div>
                    <div id="variety_two_allnews_title_right"></div>
                </div>
                <div id="variety_two_allnews_text">
                    <#import "/WEB-INF/template/cms/highLight_2.0.ftl" as importMacroAndIndustry>
                    <@importMacroAndIndustry.highLightComponent cmsNewContentListName = 'macroAndIndustryList' sizeLimit = 6 openLink = '${base}/articles/' listId = 'variety_two_allnews_list' titleId = 'variety_two_allnews_list_title' textId = 'variety_two_allnews_list_text' isMain = 0/>

                    <#import "/WEB-INF/template/cms/highLight_2.0.ftl" as importApplianceAndFuture>
                    <@importApplianceAndFuture.highLightComponent cmsNewContentListName = 'applianceAndFutureList' sizeLimit = 6 openLink = '${base}/articles/' listId = 'variety_two_allnews_list' titleId = 'variety_two_allnews_list_title' textId = 'variety_two_allnews_list_text' isMain = 0/>
                </div>
                <div id="clear"></div>
            </div>
        </div>
        
		
		<div id="variety_two_right">

<#if commodityCode == "10001000" || commodityCode == "10001001" || commodityCode == "10001002" >

			<#import "/WEB-INF/template/cms/news_2.0.ftl" as importProfitAndLostOfImportAndExport>
            <@importProfitAndLostOfImportAndExport.cmsNewContentComponent foobarName = '进出口盈亏' moreLink = '/data/jckyk' cmsNewContentListName = 'profitAndLostOfImportAndExportList' sizeLimit = 6 openLink = '${base}/articles/' content_width = 245 content_hight = 32 primeTagId = 'variety_two_futures' subTagId = 'variety_two_news'  hideCategory = true />

			<#import "/WEB-INF/template/cms/news_2.0.ftl" as importImportAndExport>
            <@importImportAndExport.cmsNewContentComponent foobarName = '进出口量' moreLink = '/data/jck' cmsNewContentListName = 'importAndExportList' sizeLimit = 6 openLink = '${base}/articles/' content_width = 245 content_hight = 32 primeTagId = 'variety_two_downstream' subTagId = 'variety_two_news'  hideCategory = true />

<#elseif  commodityCode == "10001003">
    <div id="variety_three_box" style="width:270px">
		 <div id="variety_three_box_in" style="width:270px">
			<div id="variety_three_box_top" style="width:270px">
					<div id="tab_group_one_0" class="variety_tab_first_selected" onmouseover="onMouseOverTab('tab_group_one_', 'content_group_one_', 0)" ><a href="${base}/data/output" target="_blank">产量</a></div>
					<div id="tab_group_one_1" class="variety_tab_normal" onmouseover="onMouseOverTab('tab_group_one_', 'content_group_one_', 1)" ><a href="${base}/data/consumption" target="_blank">消费</a></div>
					<div id="clear"></div>
			</div>
			<div id="content_group_one_0">
					<#import "/WEB-INF/template/cms/tabContent_2.0.ftl" as importProduction>
					<@importProduction.tabContentComponent cmsNewContentListName = 'productionList' sizeLimit = 3 openLink = '${base}/articles/' content_width = 176 content_hight = 32 hideCategory = true imgErrorPath = '${base}/images/version_2.0/data/dataProduction.jpg' />
			</div>
			<div id="content_group_one_1" style="display: none;">
					<#import "/WEB-INF/template/cms/tabContent_2.0.ftl" as importConsumption>
					<@importConsumption.tabContentComponent cmsNewContentListName = 'consumptionList' sizeLimit = 3 openLink = '${base}/articles/' content_width = 176 content_hight = 32 hideCategory = true imgErrorPath = '${base}/images/version_2.0/data/dataConsumption.jpg' />
			</div>
		</div>
		<div id="clear"></div>
	</div>	
	&nbsp;<br/>
			<#import "/WEB-INF/template/cms/news_2.0.ftl" as importImportAndExport>
            <@importImportAndExport.cmsNewContentComponent foobarName = '进出口量' moreLink = '/data/jck' cmsNewContentListName = 'importAndExportList' sizeLimit = 6 openLink = '${base}/articles/' content_width = 245 content_hight = 32 primeTagId = 'variety_two_futures' subTagId = 'variety_two_news'  hideCategory = true />

<#else>
			<#import "/WEB-INF/template/cms/news_2.0.ftl" as importDownStream>
            <@importDownStream.cmsNewContentComponent foobarName = '产量' moreLink = '/data/output' cmsNewContentListName = 'productionList' sizeLimit = 6 openLink = '${base}/articles/' content_width = 245 content_hight = 32 primeTagId = 'variety_two_futures' subTagId = 'variety_two_news'  hideCategory = true />
			
			<#import "/WEB-INF/template/cms/news_2.0.ftl" as importImportAndExport>
            <@importImportAndExport.cmsNewContentComponent foobarName = '进出口量' moreLink = '/data/jck' cmsNewContentListName = 'importAndExportList' sizeLimit = 6 openLink = '${base}/articles/' content_width = 245 content_hight = 32 primeTagId = 'variety_two_futures' subTagId = 'variety_two_news'  hideCategory = true />

</#if>       
       
        </div>
		
		
        <div id="clear"></div>
    </div>

	<#if varietyCode == "10001000">
		<div id="mid_ad">
	        <div style = "position: relative; width: 1000px;height: 65px;background: #FFF; overflow: hidden;">
				<div style="position: absolute; width: 245px;height: 65px;left: 0px;top: 0px;background: #FFF;">

						<img src="${base}/images/version_2.0/06hongyudianqi.png" /> 

				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 253px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.gdnmi.com.cn" target="_blank">
						<img src="${base}/images/version_2.0/04guangsheng_1.gif" alt="广晟有色"/> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 506px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.ghmcchina.com/index/index.jsp" target="_blank">
						<img src="${base}/images/version_2.0/05riye.gif" alt="日野"/> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 760px;top: 0px;background: #FFF;">
					<a href="#" target="_blank">
						<img src="${base}/images/version_2.0/02nanchuwuliu_240_65.png" alt="南储物流"/> 
					</a>
				</div>
			</div>
	    </div>
	<#else>
	    <div id="mid_ad">
	        		<div style = "position: relative; width: 1000px;height: 65px;background: #FFF; overflow: hidden;">
				<div style="position: absolute; width: 245px;height: 65px;left: 0px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.shdayemetal.com" target="_blank">
						<img src="${base}/images/version_2.0/04dayeyouse.gif" alt="大业有色"/> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 253px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.gdnmi.com.cn" target="_blank">
						<img src="${base}/images/version_2.0/04guangsheng_1.gif" alt="广晟有色"/> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 506px;top: 0px;background: #FFF;">
					<a rel="nofollow" href="http://www.ghmcchina.com/index/index.jsp" target="_blank">
						<img src="${base}/images/version_2.0/05riye.gif" alt="日野"/> 
					</a>
				</div>
				<div style="position: absolute; width: 245px;height: 65px;left: 760px;top: 0px;background: #FFF;">
					<a href="#" target="_blank">
						<img src="${base}/images/version_2.0/02nanchuwuliu_240_65.png" alt="南储物流"/> 
					</a>
				</div>
			</div>
	    </div>
	</#if>
	
<#if commodityCode == "10001000" || varietyCode == "10001002">
	<div id="variety_three">
        <div id="variety_three_left">
            <div id="variety_three_box">
                <div id="variety_three_box_in">
                    <div id="variety_three_box_top">
                        <div  class="variety_tab_first_selected" ><a href="${base}/data/output" target="_blank">产量</a></div>
                        <div id="clear"></div>
                    </div>
                    <div >
                        <#import "/WEB-INF/template/cms/tabContent_2.0.ftl" as importProduction>
                        <@importProduction.tabContentComponent cmsNewContentListName = 'productionList' sizeLimit = 3 openLink = '${base}/articles/' content_width = 290 content_hight = 32 hideCategory = true imgErrorPath = '${base}/images/version_2.0/data/dataProduction.jpg' />
                    </div>

                </div>
            </div>
        </div>
        <div id="variety_three_mid">
             <div id="variety_three_box">
                <div id="variety_three_box_in">
                    <div id="variety_three_box_top">
                        <div  class="variety_tab_first_selected"  ><a href="${base}/data/consumption" target="_blank">消费</a></div>
                        <div id="clear"></div>
                    </div>
                    <div >
                        <#import "/WEB-INF/template/cms/tabContent_2.0.ftl" as importConsumption>
                        <@importConsumption.tabContentComponent cmsNewContentListName = 'consumptionList' sizeLimit = 3 openLink = '${base}/articles/' content_width = 290 content_hight = 32 hideCategory = true imgErrorPath = '${base}/images/version_2.0/data/dataConsumption.jpg' />
                    </div>
                  
                </div>
            </div>
        </div>
        <div id="variety_three_right">
            <div id="variety_three_box">
                <div id="variety_three_box_in">	
					<div id="variety_three_box_top">
                        <div  class="variety_tab_first_selected" ><a href="${base}/data/downstream" target="_blank">${varietyName}下游应用</a></div>
                        <div id="clear"></div>
                    </div>
                    <div >
                        <#import "/WEB-INF/template/cms/tabContent_2.0.ftl" as importDownStream>
                        <@importDownStream.tabContentComponent cmsNewContentListName = 'downStreamList' sizeLimit = 3 openLink = '${base}/articles/' content_width = 290 content_hight = 32 hideCategory = true imgErrorPath = '${base}/images/version_2.0/data/dataShangHaiVsLondon.png' />
                    </div>
				</div>
			</div>
		</div>
		<div id="clear"></div>
    </div>

	
<#elseif commodityCode == "10001001">
    <div id="variety_three">
        <div id="variety_three_left">
            <div id="variety_three_box">
                <div id="variety_three_box_in">
                    <div id="variety_three_box_top">
                        <div id="tab_group_one_0" class="variety_tab_first_selected" onmouseover="onMouseOverTab('tab_group_one_', 'content_group_one_', 0)" ><a href="${base}/data/output" target="_blank">产量</a></div>
                        <div id="tab_group_one_1" class="variety_tab_normal" onmouseover="onMouseOverTab('tab_group_one_', 'content_group_one_', 1)" ><a href="${base}/data/consumption" target="_blank">消费</a></div>
                       
                        <div id="clear"></div>
                    </div>
                    <div id="content_group_one_0">
                        <#import "/WEB-INF/template/cms/tabContent_2.0.ftl" as importProduction>
                        <@importProduction.tabContentComponent cmsNewContentListName = 'productionList' sizeLimit = 3 openLink = '${base}/articles/' content_width = 290 content_hight = 32 hideCategory = true imgErrorPath = '${base}/images/version_2.0/data/dataProduction.jpg' />
                    </div>
                    <div id="content_group_one_1" style="display: none;">
                        <#import "/WEB-INF/template/cms/tabContent_2.0.ftl" as importConsumption>
                        <@importConsumption.tabContentComponent cmsNewContentListName = 'consumptionList' sizeLimit = 3 openLink = '${base}/articles/' content_width = 290 content_hight = 32 hideCategory = true imgErrorPath = '${base}/images/version_2.0/data/dataConsumption.jpg' />
                    </div>
                  
                </div>
            </div>
        </div>
        <div id="variety_three_mid">
            <div id="variety_three_box">
                 <div id="variety_three_box_in">
                    <div id="variety_three_box_top">
                       
                        <div  class="variety_tab_first_selected" ><a href="${base}/data/cost" target="_blank">成本</a></div>
                        <div id="clear"></div>
                    </div>
                   
                    <div >
                        <#import "/WEB-INF/template/cms/tabContent_2.0.ftl" as importCost>
                        <@importCost.tabContentComponent cmsNewContentListName = 'costList' sizeLimit = 3 openLink = '${base}/articles/' content_width = 290 content_hight = 32 hideCategory = true imgErrorPath = '${base}/images/version_2.0/data/dataCost.jpg' />
                    </div>
                </div>
            </div>
        </div>
        <div id="variety_three_right">
            <div id="variety_three_box">
                <div id="variety_three_box_in">	
					<div id="variety_three_box_top">
                        <div class="variety_tab_first_selected" ><a href="${base}/data/downstream" target="_blank">${varietyName}下游应用</a></div>
                        <div id="clear"></div>
                    </div>
                    <div >
                        <#import "/WEB-INF/template/cms/tabContent_2.0.ftl" as importDownStream>
                        <@importDownStream.tabContentComponent cmsNewContentListName = 'downStreamList' sizeLimit = 3 openLink = '${base}/articles/' content_width = 290 content_hight = 32 hideCategory = true imgErrorPath = '${base}/images/version_2.0/data/dataShangHaiVsLondon.png' />
                    </div>
				</div>
			</div>
		</div>
        <div id="clear"></div>
    </div>
</#if>

    <div id="variety_four" >
        <div id="variety_four_left">
            <div id="variety_four_left_box">
                <div id="variety_four_left_in">
                    <div id="variety_four_left_title">
                        <div id="variety_four_left_title_left"><a href="${base}/sell" target="_blank" style="color: #005ac0;">供求</a></div>
                        <div id="variety_four_left_title_right"></div>
                        <div id="clear"></div>
                    </div>
                    <div id="variety_four_left_text" class="tab_body" >
                        <table cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th width="10%">品种</th><th width="30%">标题</th><th width="10%">价格</th><th width="35%">公司</th><th width="25%">日期</th>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <div class="scroll_table">
                                        <table>
                                            <tbody>
                                                <#if supplyAndDemandList?exists>
                                                    <#list supplyAndDemandList as supply>
                                                    <tr>
                                                        <td width="10%" class="commType"><a herf="javascript:;" onclick="showType(${supply.requirement!0}, ${supply.comTypeId!0})">${supply.comTypeName!""}</a></td>
                                                        <td width="30%" class="commName"><a herf="javascript:;" onclick="showDetail(${supply.id!0})">
                                                            <#if supply.name?string?length gt 10 >
                                                            ${supply.name?substring(0,10)}......
                                                            <#else>
                                                            ${supply.name!""}
                                                            </#if>
                                                        </a></td>
                                                        <td width="10%">
                                                            <#if supply.commPrice?? && supply.commPrice != 0>
                                                                ￥ ${supply.commPrice!""}
                                                            <#else>
                                                                议价
                                                            </#if>
                                                        </td>
                                                        <td width="35%" class="commName">
                                                            <#if supply.supplierName??>
                                                                <#if supply.openflag?? && supply.openflag == 1>
                                                                    <a herf="javascript:;" onclick="showCompany(${supply.supplierId!0})">
                                                                    	<#if supply.supplierName?string?length gt 14>
                                                                    		${supply.supplierName?substring(0,14)}..
                                                                    	<#else>
                                                                    		${supply.supplierName!""}
                                                                    	</#if>
                                                                    </a>
                                                                <#else>
																	<#if supply.supplierName?string?length gt 14>
																		${supply.supplierName?substring(0,14)}..
																	<#else>
																		${supply.supplierName!""}
																	</#if>
                                                                </#if>
                                                            </#if>
                                                        </td>
                                                        <td width="25%" >
                                                            <#if supply.modifyDate??>
																${supply.modifyDate?string('yyyy-MM-dd')}
															</#if>
                                                        </td>
                                                    </tr>
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
        </div>
        <div id="variety_four_right">
            <div id="variety_four_right_box">
                <div id="variety_four_right_in">
                    <div id="variety_four_right_title">
                        <div id="variety_four_right_title_left"><a href="${base}/${varietyShortName}/recommend/1" style="color: #005ac0;" target="_blank">${varietyName}企推荐</a></div>
                        <div id="variety_four_right_title_right"></div>
                        <div id="clear"></div>
                    </div>
                    <div id="variety_four_right_text">
                        <#if recommEnterpriseList?exists>
                            <div id="news290_32">
                                <#list recommEnterpriseList as recommEnterprise>
                                    <#if recommEnterprise_index < 6>
                                        <div id="news290_32">
                                            <div style="width:10px; float:left; background:url(${base}/images/version_2.0/news_tag.png) no-repeat;">&nbsp;</div>
                                            <div id="news290_32_mid"><a href="${recommEnterprise.url!""}" target="_blank">${recommEnterprise.name!""}</a></div>
                                            <div id="news290_32_right">[${recommEnterprise.updateTime?string("MM-dd")}]</div>
                                            <div id="clear"></div>
                                        </div>
                                    </#if>
                                </#list>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
        <div id="clear"></div>
    </div>


    <#include "/WEB-INF/template/common/footer_2.0.ftl"/>

	</body>
</html>	

