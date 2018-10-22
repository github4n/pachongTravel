package com.fh.controller.otatour.tourchartmonth;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.otatour.tourchartday.TourChartDayManager;
import com.fh.service.otatour.tourchartmonth.TourChartMonthManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.express.Request;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：OTA客流量总览按月
 * 创建人：
 * 创建时间：2018-07-03
 */
@Controller
@RequestMapping(value="/tourchartmonth")
public class TourChartMonthController extends BaseController {

    String menuUrl = "tourchartmonth/list.do"; //菜单地址(权限用)
    @Resource(name = "tourchartmonthService")
    private TourChartMonthManager tourchartmonthService;
    @Resource(name = "tourchartdayService")
    private TourChartDayManager tourchartdayService;

    /**
     * 保存
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/save")
    public ModelAndView save() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "新增TourChartMonth");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("TOURCHARTMONTH_ID", this.get32UUID());    //主键
        tourchartmonthService.save(pd);
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 删除
     *
     * @param out
     * @throws Exception
     */
    @RequestMapping(value = "/delete")
    public void delete(PrintWriter out) throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "删除TourChartMonth");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
            return;
        } //校验权限
        PageData pd = new PageData();
        pd = this.getPageData();
        tourchartmonthService.delete(pd);
        out.write("success");
        out.close();
    }

    /**
     * 修改
     *
     * @param
     * @throws Exception
     */
    @RequestMapping(value = "/edit")
    public ModelAndView edit() throws Exception {
        logBefore(logger, Jurisdiction.getUsername() + "修改TourChartMonth");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        tourchartmonthService.edit(pd);
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 列表
     *
     * @param page
     * @throws Exception
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(Page page) throws Exception {

        logBefore(logger, Jurisdiction.getUsername() + "列表TourChartDay");
        //if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
        ModelAndView mv = this.getModelAndView();
        Calendar now = Calendar.getInstance();
        SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar seven = Calendar.getInstance();
        seven.add(Calendar.DATE, -6);
        String today_str = smf.format(now.getTime());
        String seven_str = smf.format(seven.getTime());
        PageData pd = new PageData();
        pd = this.getPageData();

        List<PageData> tourChart_result = null;
        String fDate = "";
        String lDate = "";
        String selectedVal = pd.getString("selectedVal");
        if (StringUtils.isEmpty(selectedVal)) {
            selectedVal = "1";
        }

        if (selectedVal.equals("1")) {
            pd.put("startDate", "2018-06-01");
            pd.put("endDate", "2018-06-30");
            page.setPd(pd);
            //7天数据查询
            tourChart_result = tourchartdayService.tourChartDay(page);//最近一个月数据

        }


        Iterator tourChart_itr = tourChart_result.iterator();
        List<String> xData = new ArrayList<String>();
        JSONObject yJson = new JSONObject();
        JSONObject xJson = new JSONObject();
        JSONObject zJson = new JSONObject();
        List<Object> yData = new ArrayList<Object>();
        List<Object> xxData = new ArrayList<Object>();
        List<Object> yyData = new ArrayList<Object>();
        Map<String, Object> map = new TreeMap<String, Object>();
        Map<String, Object> maps = new TreeMap<String, Object>();
        while (tourChart_itr.hasNext()) {
            PageData pgdt = (PageData) tourChart_itr.next();
            map.put(pgdt.get("date").toString(), pgdt.get("tournum"));
            maps.put(pgdt.get("date").toString(), pgdt.get("avgnum"));
        }
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            String str = entry.getKey().toString();
            String strVal = str.substring(5, str.length());
            xData.add(strVal);
            yData.add(entry.getValue());

        }
        for (Map.Entry<String, Object> entry : maps.entrySet()) {
            String str = entry.getKey().toString();
            String strVal = str.substring(5, str.length());
            xxData.add(strVal);
            yyData.add(entry.getValue());

        }
        xJson.put("xData", xData);
        yJson.put("yName", "入园人数");
        yJson.put("yData", yData);
        zJson.put("xName", "历史平均");
        zJson.put("yyData", yyData);
        pd.put("xJson", xJson);
        pd.put("yJson", yJson);
        pd.put("zJson", zJson);
        mv.setViewName("otatour/tourchartmonth/tourchartmonth_list");
        mv.addObject("pd", pd);
        mv.addObject("firstDate", fDate);
        mv.addObject("lastDate", lDate);
        mv.addObject("QX", Jurisdiction.getHC());    //按钮权限
        return mv;
    }



//		logBefore(logger, Jurisdiction.getUsername()+"列表TourChartMonth");
//		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
//            ModelAndView mv = this.getModelAndView();
//
//
//		Calendar now = Calendar.getInstance();
//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
//        SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
//        String today_str = smf.format(now.getTime());
//        Calendar c = Calendar.getInstance();
//        c.setTime(new Date());
//        c.add(Calendar.MONTH, -1);
//        Date m = c.getTime();
//        List<PageData> tourChart_result=null;
//		String seven_str = format.format(m);
//		PageData pd = new PageData();
//        String fDate = "";
//        String lDate = "";
//        String dayDate = pd.getString("dayDate");
//		pd = this.getPageData();
//        String selectedVal = pd.getString("selectedVal");
//        if (StringUtils.isEmpty(selectedVal)) {
//            selectedVal="1";
//        }
//        if (selectedVal.equals("1")) {
//
//
//            if (null != selectedVal && !"".equals(selectedVal)) {
//              //  pd.put("selDate", dayDate.trim());
//                pd.put("currentDate", "2018-06");
//                page.setPd(pd);
//                tourChart_result=tourchartmonthService.tourChartMonths(page);
//
//                pd.put("startDate", "2018-06-06");
//                pd.put("endDate", "2018-06-30");
//                fDate = tourchartdayService.tourNumDay(page);//fosrt时间
//                lDate = tourchartdayService.tourNumDayl(page);//last时间
//            }
//            if(null != dayDate && !"".equals(dayDate)){
//                pd.put("dayDate", dayDate.trim());
//                page.setPd(pd);
//                tourChart_result = tourchartdayService.tourChartByDay(page);
//            }
//
//        }else{
//            pd.put("currentDate",seven_str);
//            tourChart_result=tourchartmonthService.tourChartMonths(page);
//
//            pd.put("dayDate", today_str);
//            page.setPd(pd);
//            tourChart_result = tourchartdayService.tourChartByDay(page);
//        }
//
//
//		Iterator tourChart_itr = tourChart_result.iterator();
//        Map<String,Object> map  =new TreeMap<>();
//        Map<String,Object> maps  =new TreeMap<>();
//		List<String> xData = new ArrayList<String>();
//        List<Object> yData = new ArrayList<Object>();
//        List<String> xxData = new ArrayList<String>();
//        List<Object> yyData = new ArrayList<Object>();
//		JSONObject yJson = new JSONObject();
//		JSONObject xJson = new JSONObject();
//		JSONObject zJson = new JSONObject();
//
//		List<Long> zData = new ArrayList<Long>();
//		while(tourChart_itr.hasNext()){
//			PageData pgdt = (PageData)tourChart_itr.next();
//			map.put(pgdt.get("day").toString(),pgdt.get("tournum"));
//            maps.put(pgdt.get("day").toString(),pgdt.get("avgnum"));
//		}
//
//
//		Map<String, Object> xymap= updateXList(map);
//		for (Map.Entry<String, Object> entry : xymap.entrySet()){
//			xData.add(entry.getKey());
//			yData.add(entry.getValue());
//		}
//        Map<String, Object> xymaps= updateXList(maps);
//        for (Map.Entry<String, Object> entry : xymaps.entrySet()){
//            xxData.add(entry.getKey());
//            yyData.add(entry.getValue());
//        }
//		xJson.put("xData", xData);
//		yJson.put("yName", "入园人数");
//		yJson.put("yData", yData);
//		zJson.put("zName", "累积量");
//		zJson.put("yyData", yyData);
//		pd.put("xJson", xJson);
//		pd.put("yJson",yJson);
//		pd.put("zJson", zJson);
//		//骑行时长
//
//        mv.addObject("firstDate", fDate);
//        mv.addObject("lastDate", lDate);
//		mv.setViewName("otatour/tourchartmonth/tourchartmonth_list");
//		mv.addObject("pd", pd);
//		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
//		return mv;





	/*
	    跟新list数据没有该时段将补上
	 */
	public Map<String,Object>  updateXList(Map<String,Object> map){
		String arr [] = {"01","02","03","04","05","06","07","08","09","10","11","12",
				"13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"};
		List<String> fixedDate=Arrays.asList(arr);
		Set<String> keySet = map.keySet();
		for (String fd:fixedDate){
			if(!CollectionUtils.contains(keySet.iterator(),fd)){
				map.put(fd,0L);
			}
		}
//		fixedDate.forEach(s ->{
//			if(!CollectionUtils.contains(keySet.iterator(),s)){
//				map.put(s,0L);
//			}
//		});

//        map.forEach((s, o) -> {
//            System.out.println(s+" "+o);
//        });
		return map;
	}


	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("otatour/tourchartmonth/tourchartmonth_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = tourchartmonthService.findById(pd);	//根据ID读取
		mv.setViewName("otatour/tourchartmonth/tourchartmonth_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除TourChartMonth");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			tourchartmonthService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出TourChartMonth到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("备注1");	//1
		titles.add("备注2");	//2
		titles.add("备注3");	//3
		titles.add("备注4");	//4
		titles.add("备注5");	//5
		titles.add("备注6");	//6
		titles.add("备注7");	//7
		dataMap.put("titles", titles);
		List<PageData> varOList = tourchartmonthService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("SPOTNAME"));	    //2
			vpd.put("var3", varOList.get(i).get("SPOTID").toString());	//3
			vpd.put("var4", varOList.get(i).getString("DAY"));	    //4
			vpd.put("var5", varOList.get(i).getString("MONTH"));	    //5
			vpd.put("var6", varOList.get(i).get("TOURNUM").toString());	//6
			vpd.put("var7", varOList.get(i).get("TOTALNUM").toString());	//7
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
