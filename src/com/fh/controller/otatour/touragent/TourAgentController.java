package com.fh.controller.otatour.touragent;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.otatour.touragent.TourAgentManager;
import com.fh.util.*;
import net.sf.json.JSONObject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：OTA客流量总览总量
 * 创建人：
 * 创建时间：2018-07-03
 */
@Controller
@RequestMapping(value="/touragent")
public class TourAgentController extends BaseController {
	
	String menuUrl = "touragent/list.do"; //菜单地址(权限用)
	@Resource(name="touragentService")
	private TourAgentManager touragentService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增TourAgent");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TOURAGENT_ID", this.get32UUID());	//主键
		touragentService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除TourAgent");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		touragentService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改TourAgent");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		touragentService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**查询渠道列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表TourAgent");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String start_date ="";
		String end_date = "";
        String startTime = pd.getString("startTime");
        String endTime = pd.getString("endTime");

        Calendar now = Calendar.getInstance();
        SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
        String currentDay = smf.format(now.getTime());
        String type = pd.getString("type");
		OtaUtil util = new OtaUtil();
		if(null != type && !"".equals(type)){
			//如果选择按钮，则返回固定的起始时间和结束时间
			end_date = util.getEndDateS(type);
			start_date = util.getStartDateS(type);
		}else if(null != startTime && !"".equals(startTime) && null != endTime && !"".equals(endTime)){
			//如果选择了日期选择框，则返回日期框中选择的起始时间和结束时间
			start_date = startTime;
			end_date = endTime;
		}else {
            start_date=currentDay;
            end_date=currentDay;
        }
		pd.put("endDate", end_date);
		pd.put("startDate", start_date);
		page.setPd(pd);
		
		//分销渠道分布图
		List<PageData> varList = touragentService.tourAgentChart(page);
		String[] arr = {"微信售票","分销平台","冰雕嘉年华","智慧屏","同程","驴妈妈","携程","美团","途牛","去哪儿"};
		
		JSONObject xJson = new JSONObject();
		JSONObject yJson = new JSONObject();
		JSONObject zJson = new JSONObject();
		
		List<String> xData = new ArrayList<String>();
		List<Object> yData = new ArrayList<Object>();
		List<JSONObject> zData = new ArrayList<JSONObject>();
		List<JSONObject> vList = new ArrayList<JSONObject>();
		
		Iterator itr_sum = varList.iterator();
		BigDecimal sum = new BigDecimal(0);
//		while(itr_sum.hasNext()){
//			PageData pgdt = (PageData)itr_sum.next();
//			if(pgdt.get("channelNum")!=null){
//
//				sum = sum.add((BigDecimal)pgdt.get("channelNum"));
//			}
//		}
		
		for(int i=0; i<arr.length; i++){
			String tmp = arr[i];
			String x_value = tmp;
			Integer y_value =0;
			Integer z_value=0;
			Iterator itr = varList.iterator();
			while(itr.hasNext()){
				PageData pgdt = (PageData)itr.next();
				if(tmp.equals(pgdt.get("name").toString())){
					if(pgdt.get("value")!=null){
						String channelNum = pgdt.get("value").toString();
						y_value = Integer.parseInt(channelNum);
						if(y_value!=0){
							z_value = y_value;
						}
					}
				}
			}
			xData.add(x_value);
			yData.add(y_value);
			JSONObject tmpJson = new JSONObject();
			tmpJson.put("name", x_value);
			tmpJson.put("value", z_value);
			zData.add(tmpJson);
			JSONObject mJson = new JSONObject();
			mJson.put("i", i+1);
			mJson.put("x", x_value);
			mJson.put("y", y_value);
			mJson.put("z", z_value);
			vList.add(mJson);
		}

		xJson.put("xData", xData);
		yJson.put("yName", "总订票量");
		yJson.put("yData", yData);
		zJson.put("zName", "占比");
		zJson.put("zData", zData);
		pd.put("xJson", xJson);	
		pd.put("yJson",yJson);
		pd.put("zJson", zJson);
		//骑行时长
		mv.setViewName("otatour/touragent/touragent_list");
		mv.addObject("pd", pd);
		mv.addObject("varList", vList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

    @RequestMapping(value = "/getThreeMonths")
    @ResponseBody
    public JSONObject getThreeMonths(Page page, String startTime,String endTime,String type) throws Exception {

        PageData pd = new PageData();
        pd = this.getPageData();
        String start_date ="";
        String end_date = "";
        Calendar now = Calendar.getInstance();
        SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
        String currentDay = smf.format(now.getTime());
        JSONObject jt = new JSONObject();

        OtaUtil util = new OtaUtil();
        if(null != type && !"".equals(type)){
            //如果选择按钮，则返回固定的起始时间和结束时间
            end_date = util.getEndDateS(type);
            start_date = util.getStartDateS(type);
        }else if(null != startTime && !"".equals(startTime) && null != endTime && !"".equals(endTime)){
            //如果选择了日期选择框，则返回日期框中选择的起始时间和结束时间
            start_date = startTime;
            end_date = endTime;
        }else {
            start_date=currentDay;
            end_date=currentDay;
        }
        pd.put("endDate", end_date);
        pd.put("startDate", start_date);
        page.setPd(pd);
        List<PageData> varList = touragentService.tourAgentChart(page);
        jt.put("data",varList);
        return jt;

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
		mv.setViewName("otatour/touragent/touragent_edit");
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
		pd = touragentService.findById(pd);	//根据ID读取
		mv.setViewName("otatour/touragent/touragent_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除TourAgent");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			touragentService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出TourAgent到excel");
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
		List<PageData> varOList = touragentService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("TICKNAME"));	    //2
			vpd.put("var3", varOList.get(i).get("TICKID").toString());	//3
			vpd.put("var4", varOList.get(i).getString("SPOTNAME"));	    //4
			vpd.put("var5", varOList.get(i).getString("SPOTID"));	    //5
			vpd.put("var6", varOList.get(i).getString("DATE"));	    //6
			vpd.put("var7", varOList.get(i).get("CNT").toString());	//7
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
