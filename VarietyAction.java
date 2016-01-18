package com.nanchu2.variety.action;

import com.nanchu.base.util.Utils;
import com.nanchu.cms.entity.CmsNewContent;
import com.nanchu.cms.entity.CmsNewGategory;
import com.nanchu.commodity.entity.CommodityQuote;
import com.nanchu2.utils.VersionTwoBaseAction;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

import java.math.BigDecimal;
import java.util.*;

public class VarietyAction extends VersionTwoBaseAction {

    public static Map<String, String> Commodity_Map = new HashMap<String, String>();

    //铜
    protected List<CommodityQuote> copperCommodityQuoteList = new ArrayList<CommodityQuote>();
    //铜加工材
    protected List<CommodityQuote> copperProcessCommodityQuoteList = new ArrayList<CommodityQuote>();

    

	//铅
    protected List<CommodityQuote> leadCommodityQuoteList = new ArrayList<CommodityQuote>();

    //锡
    protected List<CommodityQuote> tinCommodityQuoteList = new ArrayList<CommodityQuote>();

    //镍
    protected List<CommodityQuote> nickelCommodityQuoteList = new ArrayList<CommodityQuote>();

    //铝
    protected List<CommodityQuote> aluminiumOneCommodityQuoteList = new ArrayList<CommodityQuote>();
    protected List<CommodityQuote> aluminiumTwoCommodityQuoteList = new ArrayList<CommodityQuote>();
    protected List<CommodityQuote> aluminiumThreeCommodityQuoteList = new ArrayList<CommodityQuote>();
    protected List<CommodityQuote> aluminiumFourCommodityQuoteList = new ArrayList<CommodityQuote>();

    //锌
    protected List<CommodityQuote> zincOneCommodityQuoteList = new ArrayList<CommodityQuote>();
    protected List<CommodityQuote> zincTwoCommodityQuoteList = new ArrayList<CommodityQuote>();
    protected List<CommodityQuote> zincThreeCommodityQuoteList = new ArrayList<CommodityQuote>();

    /**
     * 阴极铜 18_国产
     * 重熔用铝锭(Al99.7) 22_国产
     * 锌锭(Zn99.995) 24_国产
     * 锌锭(Zn99.99) 25_国产
     * 铅锭(Pb99.994) 29_国产
     * 锡锭(Sn99.90) 49_国产
     * 电解镍(Ni9996) 31_金川
     * 电解钴(Co99.98) 51_金川
     */
    static {
        Commodity_Map.put("10001000", "18_国产");
        Commodity_Map.put("10001001", "22_国产");
        Commodity_Map.put("10001002", "24_国产");
        //Commodity_Map.put("100010021001", "25_国产");
        Commodity_Map.put("10001003", "29_国产");
        Commodity_Map.put("10001011", "49_国产");
        Commodity_Map.put("10001004", "31_金川");
        Commodity_Map.put("10001012", "51_金川");
    }

    protected String varietyName = StringUtils.EMPTY;

    protected String varietyCode = StringUtils.EMPTY;

    protected String varietyId = StringUtils.EMPTY;

    protected String varietyShortName = StringUtils.EMPTY;

    public String varietyHomePage() {

        initCommodityTypeMap();

        String code = ObjectUtils.toString(getRequest().getParameter("code"));

        Map paramMap = new HashMap();

        if (StringUtils.isNotEmpty(code)) {

            varietyCode = code;

            varietyShortName = commodityCategoryCodeShortNameMap.get(code);

            varietyId = codeWithCommodityTypeMap.get(code).getId().toString();

            paramMap.put("code2", new String[] {code});
        }
        paramMap.put("row", 6);
        //文章
        List<CmsNewContent> list = this.getCmsNewContentService().getPicCmsNewContentList(paramMap);

        //走势图链接参数
        Date current = new Date();
        Date beforeThreeMonthDate = DateUtils.addMonths(current, -3);
        getRequest().setAttribute("beginDate", DateFormatUtils.format(beforeThreeMonthDate, "yyyy-MM-dd"));
        getRequest().setAttribute("endDate", DateFormatUtils.format(current, "yyyy-MM-dd"));
        getRequest().setAttribute("commodityName", StringUtils.split(Commodity_Map.get(code), "_")[0]);
        getRequest().setAttribute("commodityCode", code);

        //供求
        paramMap.clear();
        paramMap.put("commstatus", 1);
        paramMap.put("comType", 1);
        paramMap.put("start", 0);
        paramMap.put("endSize", 7);
        supplyAndDemandList = this.getCommodityService().getSplitCommodityList2(paramMap);

        //报价
        paramMap.clear();
        paramMap.put("status", 1);//已发布
        paramMap.put("searchToday", true);
        commodityQuoteList = getCommodityQuoteService().getCommodityQuoteList(paramMap);
        //自定义排序
        Collections.sort(commodityQuoteList, new ComparatorQuotation());

        if (CollectionUtils.isNotEmpty(commodityQuoteList)) {

            for (CommodityQuote commodityQuote : commodityQuoteList) {

                if (commodityQuote != null) {

                    commodityQuote.setCommodityType(idWithCommodityTypeMap.get(commodityQuote.getCommodityId()));
                }
            }

            //铜
            if ("10001000".equals(code)) {

                //1#电解铜 100010001000
                String specifiedCode = "100010001000";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, copperCommodityQuoteList, specifiedCode, 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, copperCommodityQuoteList, specifiedCode, 5, 1);
                //升贴水 100010001002
                specifiedCode = "100010001002";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, copperCommodityQuoteList, specifiedCode, 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, copperCommodityQuoteList, specifiedCode, 5, 1);
                
                //铜加工材
                //8mm无氧铜杆加工费
                specifiedCode = "100010001020";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, copperProcessCommodityQuoteList, specifiedCode, 4, 1);
                //3mm无氧铜杆加工费
                specifiedCode = "100010001021";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, copperProcessCommodityQuoteList, specifiedCode, 4, 1);
                //8mm无氧铜杆
                specifiedCode = "100010001022";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, copperProcessCommodityQuoteList, specifiedCode, 4, 1);
                //3mm无氧铜杆
                specifiedCode = "100010001023";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, copperProcessCommodityQuoteList, specifiedCode, 4, 1);
                
            } else if ("10001001".equals(code)) { //铝

                String specifiedCode = "";

                //A00铝 南储华南 100010011000
                specifiedCode = "100010011000";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumOneCommodityQuoteList, specifiedCode, 4, 1);
                //铝棒Φ120 100010011012
                specifiedCode = "100010011012";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumOneCommodityQuoteList, specifiedCode, 4, 1);
                //铝棒Φ178 100010011013
                specifiedCode = "100010011013";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumOneCommodityQuoteList, specifiedCode, 4, 1);
                //A00铝 南储华东 100010011000
                specifiedCode = "100010011000";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumOneCommodityQuoteList, specifiedCode, 5, 1);
                //升贴水 100010011011
                specifiedCode = "100010011011";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumOneCommodityQuoteList, specifiedCode, 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumOneCommodityQuoteList, specifiedCode, 5, 1);

                //氧化铝 100010011007
                specifiedCode = "100010011007";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumTwoCommodityQuoteList, specifiedCode, 1, 20);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumTwoCommodityQuoteList, specifiedCode, 1, 21);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumTwoCommodityQuoteList, specifiedCode, 1, 22);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumTwoCommodityQuoteList, specifiedCode, 1, 23);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumTwoCommodityQuoteList, specifiedCode, 1, 5);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumTwoCommodityQuoteList, specifiedCode, 1, 6);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumTwoCommodityQuoteList, specifiedCode, 1, 7);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumTwoCommodityQuoteList, specifiedCode, 1, 8);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumTwoCommodityQuoteList, specifiedCode, 1, 9);

                //预焙阳极 100010011008
                specifiedCode = "100010011008";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumThreeCommodityQuoteList, specifiedCode, 1, 10);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumThreeCommodityQuoteList, specifiedCode, 1, 11);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumThreeCommodityQuoteList, specifiedCode, 1, 12);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumThreeCommodityQuoteList, specifiedCode, 1, 13);

                //辅料
                //氟化铝 100010011009
                specifiedCode = "100010011009";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumFourCommodityQuoteList, specifiedCode, 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumFourCommodityQuoteList, specifiedCode, 5, 1);
                //冰晶石 100010011010
                specifiedCode = "100010011010";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumFourCommodityQuoteList, specifiedCode, 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, aluminiumFourCommodityQuoteList, specifiedCode, 5, 1);
                
                


            } else if ("10001002".equals(code)) {//锌

                //0#锌锭 100010021000
                //1#锌锭 100010021001

                //南储华南报价
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, zincOneCommodityQuoteList, "100010021000", 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, zincOneCommodityQuoteList, "100010021001", 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, zincOneCommodityQuoteList, "100010021000", 4, 16);

                //南储华东报价
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, zincTwoCommodityQuoteList, "100010021000", 5, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, zincTwoCommodityQuoteList, "100010021001", 5, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, zincTwoCommodityQuoteList, "100010021000", 5, 17);

                //锌精矿 100010021003
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, zincThreeCommodityQuoteList, "100010021003", 1, 18);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, zincThreeCommodityQuoteList, "100010021003", 1, 19);


            } else if ("10001003".equals(code)) {//铅

                //1#铅 100010031001
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, leadCommodityQuoteList, "100010031001", 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, leadCommodityQuoteList, "100010031001", 5, 1);

                //铅精矿 100010031003
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, leadCommodityQuoteList, "100010031003", 1, 14);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, leadCommodityQuoteList, "100010031003", 1, 15);

            } else if ("10001011".equals(code)) {//锡

                String specifiedCode = "";

                //1#锡 100010111000
                specifiedCode = "100010111000";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, tinCommodityQuoteList, specifiedCode, 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, tinCommodityQuoteList, specifiedCode, 5, 1);

            } else if ("10001004".equals(code)) {//镍

                String specifiedCode = "";

                //1#电解镍 100010041000
                specifiedCode = "100010041000";
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, nickelCommodityQuoteList, specifiedCode, 4, 1);
                queryFirstCommodityQuoteAndAppendToTargetList(commodityQuoteList, nickelCommodityQuoteList, specifiedCode, 5, 1);
            }
        }

        paramMap.clear();
        paramMap.put("status", 2); //取上架企业
        paramMap.put("start", 0);
        paramMap.put("endSize", 7);
        paramMap.put("commType", code);
        recommEnterpriseList = this.getRecommEnterpriseService().getSplitEnterpriseList(paramMap);

        if (CollectionUtils.isEmpty(list)) {

            return SUCCESS;
        }

        varietyName = ObjectUtils.toString(list.get(0).getGateName2());

        //点评
        commentList = filterCmsNewContent(list, true, populateCmsNewCategoryLeavesArray("200010001000"));

        //报告
        reportList = filterCmsNewContent(list, true, populateCmsNewCategoryLeavesArray("20001004"));

        //要闻
        //从页面去除
        highLightList = filterCmsNewContent(list, true, null);

        //期货
        futureList = filterCmsNewContent(list, true, "200010051004");

        //企业动态
        enterpriseActivityList =filterCmsNewContent(list, true, "200010061003");

        //下游
        downStreamList = filterCmsNewContent(list, true, "200010051005");

        //产量
        productionList = filterCmsNewContent(list, true, "200010051000");

        //消费
        consumptionList = filterCmsNewContent(list, true, "200010051001");

        //成本
        costList = filterCmsNewContent(list, true, "200010051002");

        //进出口
        importAndExportList = filterCmsNewContent(list, true, "200010051006");

        //进出口盈亏
        profitAndLostOfImportAndExportList = filterCmsNewContent(list, true, "200010051008");

        //国内库存
        homeStockList = filterCmsNewContent(list, true, "2000100510031000");

        //国外库存
        abroadStockList = filterCmsNewContent(list, true, "2000100510031001");

        //宏观与产业
        macroAndIndustryList = filterCmsNewContent(list, true, "2000100210001000", "2000100210001001", "2000100210011000", "2000100210011001", "2000100010011000");

        //应用和期货
        applianceAndFutureList = filterCmsNewContent(list, true, ArrayUtils.addAll(populateCmsNewCategoryLeavesArray("20001003"), populateCmsNewCategoryLeavesArray("20001001")));

        //沪伦比
        shangHaiVsLondonList = filterCmsNewContent(list, true, "200010051007");

        return SUCCESS;
    }

    public String ajaxVarietyChartsData() {

        String code = ObjectUtils.toString(getRequest().getParameter("code"));

        Map paramMap = new HashMap();

        String id_area = null;

        if (StringUtils.isNotEmpty(code)) {

            id_area = Commodity_Map.get(code);
        }

        if (StringUtils.isEmpty(id_area)) {

            return SUCCESS;
        }

        String[] comType = id_area.split("_");

        paramMap.put("commodityId", NumberUtils.toInt(ObjectUtils.toString(comType[0])));
        paramMap.put("productArea", comType[1]);

        Date current = new Date();
        Date beforeThreeMonthDate = DateUtils.addMonths(current, -3);        
        
        paramMap.put("beginDate", populateDateToyyyyMMdd0000(beforeThreeMonthDate));
        paramMap.put("orderFlag", "yes");
        
        List<CommodityQuote> CommodityQuoteList = getCommodityQuoteService().getCommodityQuoteList(paramMap);
        
        
        //CommodityQuoteList = populateChartsDataList(CommodityQuoteList);
        JSONObject jsonObject = new JSONObject();
        JSONArray mainAxisJSONArray = new JSONArray();
        if (CollectionUtils.isNotEmpty(CommodityQuoteList)) {

            for (CommodityQuote commodityQuote : CommodityQuoteList) {

                if (commodityQuote == null || (StringUtils.isBlank(commodityQuote.getLowPrice()) && StringUtils.isBlank(commodityQuote.getHighPrice()) )) {

                	continue;
                }

                JSONArray jsonArray = new JSONArray();

                jsonArray.add(commodityQuote.getQuoteTime().getTime());
                jsonArray.add(new BigDecimal(NumberUtils.toDouble(commodityQuote.getLowPrice(), 0.0)).add(new BigDecimal(NumberUtils.toDouble(commodityQuote.getHighPrice(), 0.0))).divide(new BigDecimal(2)).setScale(2, BigDecimal.ROUND_HALF_UP));

                mainAxisJSONArray.add(jsonArray);
            }
        }

        jsonObject.put("mainAxis", mainAxisJSONArray);

        return Utils.ajaxJson(jsonObject);
    }

    protected Date populateDateToyyyyMMdd0000(Date date) {

        DateUtils.setHours(date, 0);
        DateUtils.setMinutes(date, 0);
        DateUtils.setSeconds(date, 0);

        return date;
    }

    protected List<CommodityQuote> populateChartsDataList(List<CommodityQuote> commodityQuoteList, Integer... interval) {

        if (CollectionUtils.isEmpty(commodityQuoteList)) {

            return null;
        }

        List<CommodityQuote> returnCommodityQuoteList = new ArrayList<CommodityQuote>();

        if (interval == null || interval.length == 0) {

            interval = new Integer[] { 1 };
        }

        for (int i = 0; i < commodityQuoteList.size(); i ++ ) {

            if (commodityQuoteList.get(i) == null || commodityQuoteList.get(i).getQuoteTime() == null || commodityQuoteList.get(i).getLowPrice() == null || commodityQuoteList.get(i).getHighPrice() == null) {

                continue;
            }

            if (i == 0 || (i == commodityQuoteList.size() - 1) || i % interval[0] == 0) {

                returnCommodityQuoteList.add(commodityQuoteList.get(i));

            }

        }

        if (returnCommodityQuoteList.size() > 15) {

            returnCommodityQuoteList = populateChartsDataList(returnCommodityQuoteList, interval[0] + 1);
        }

        return returnCommodityQuoteList;
    }

    protected String[] populateCmsNewCategoryLeavesArray(String parentCategoryCode) {

        if (StringUtils.isBlank(parentCategoryCode)) {
            return null;
        }

        Map paramMap = new HashMap();
        paramMap.put("start", 0);
        paramMap.put("endSize", Integer.MAX_VALUE);
        paramMap.put("code", parentCategoryCode);

        List<CmsNewGategory> cmsNewCategoryLeavesList = getCmsNewGategoryService().getCmsNewCategoryLeavesList(paramMap);

        if (CollectionUtils.isEmpty(cmsNewCategoryLeavesList)) {
            return null;
        }

        List<String> codeList =  new ArrayList<String>();


        for (CmsNewGategory cmsNewGategory : cmsNewCategoryLeavesList) {
            codeList.add(cmsNewGategory.getCode());
        }

        String[] codeArray = new String[codeList.size()];
        codeList.toArray(codeArray);

        return codeArray;
    }

    public String getVarietyName() {
        return varietyName;
    }

    public void setVarietyName(String varietyName) {
        this.varietyName = varietyName;
    }

    public String getVarietyCode() {
        return varietyCode;
    }

    public void setVarietyCode(String varietyCode) {
        this.varietyCode = varietyCode;
    }

    public List<CommodityQuote> getCopperCommodityQuoteList() {
        return copperCommodityQuoteList;
    }

    public String getVarietyId() {
        return varietyId;
    }
    
    public List<CommodityQuote> getCopperProcessCommodityQuoteList() {
		return copperProcessCommodityQuoteList;
	}

	public void setCopperProcessCommodityQuoteList(List<CommodityQuote> copperProcessCommodityQuoteList) {
		this.copperProcessCommodityQuoteList = copperProcessCommodityQuoteList;
	}

    public void setVarietyId(String varietyId) {
        this.varietyId = varietyId;
    }

    public void setCopperCommodityQuoteList(List<CommodityQuote> copperCommodityQuoteList) {
        this.copperCommodityQuoteList = copperCommodityQuoteList;
    }

    public List<CommodityQuote> getLeadCommodityQuoteList() {
        return leadCommodityQuoteList;
    }

    public void setLeadCommodityQuoteList(List<CommodityQuote> leadCommodityQuoteList) {
        this.leadCommodityQuoteList = leadCommodityQuoteList;
    }

    public List<CommodityQuote> getTinCommodityQuoteList() {
        return tinCommodityQuoteList;
    }

    public void setTinCommodityQuoteList(List<CommodityQuote> tinCommodityQuoteList) {
        this.tinCommodityQuoteList = tinCommodityQuoteList;
    }

    public List<CommodityQuote> getNickelCommodityQuoteList() {
        return nickelCommodityQuoteList;
    }

    public void setNickelCommodityQuoteList(List<CommodityQuote> nickelCommodityQuoteList) {
        this.nickelCommodityQuoteList = nickelCommodityQuoteList;
    }

    public List<CommodityQuote> getAluminiumOneCommodityQuoteList() {
        return aluminiumOneCommodityQuoteList;
    }

    public void setAluminiumOneCommodityQuoteList(List<CommodityQuote> aluminiumOneCommodityQuoteList) {
        this.aluminiumOneCommodityQuoteList = aluminiumOneCommodityQuoteList;
    }

    public List<CommodityQuote> getAluminiumTwoCommodityQuoteList() {
        return aluminiumTwoCommodityQuoteList;
    }

    public void setAluminiumTwoCommodityQuoteList(List<CommodityQuote> aluminiumTwoCommodityQuoteList) {
        this.aluminiumTwoCommodityQuoteList = aluminiumTwoCommodityQuoteList;
    }

    public List<CommodityQuote> getAluminiumThreeCommodityQuoteList() {
        return aluminiumThreeCommodityQuoteList;
    }

    public void setAluminiumThreeCommodityQuoteList(List<CommodityQuote> aluminiumThreeCommodityQuoteList) {
        this.aluminiumThreeCommodityQuoteList = aluminiumThreeCommodityQuoteList;
    }

    public List<CommodityQuote> getAluminiumFourCommodityQuoteList() {
        return aluminiumFourCommodityQuoteList;
    }

    public void setAluminiumFourCommodityQuoteList(List<CommodityQuote> aluminiumFourCommodityQuoteList) {
        this.aluminiumFourCommodityQuoteList = aluminiumFourCommodityQuoteList;
    }

    public List<CommodityQuote> getZincOneCommodityQuoteList() {
        return zincOneCommodityQuoteList;
    }

    public void setZincOneCommodityQuoteList(List<CommodityQuote> zincOneCommodityQuoteList) {
        this.zincOneCommodityQuoteList = zincOneCommodityQuoteList;
    }

    public List<CommodityQuote> getZincTwoCommodityQuoteList() {
        return zincTwoCommodityQuoteList;
    }

    public void setZincTwoCommodityQuoteList(List<CommodityQuote> zincTwoCommodityQuoteList) {
        this.zincTwoCommodityQuoteList = zincTwoCommodityQuoteList;
    }

    public List<CommodityQuote> getZincThreeCommodityQuoteList() {
        return zincThreeCommodityQuoteList;
    }

    public void setZincThreeCommodityQuoteList(List<CommodityQuote> zincThreeCommodityQuoteList) {
        this.zincThreeCommodityQuoteList = zincThreeCommodityQuoteList;
    }

    public String getVarietyShortName() {
        return varietyShortName;
    }

    public void setVarietyShortName(String varietyShortName) {
        this.varietyShortName = varietyShortName;
    }
}
