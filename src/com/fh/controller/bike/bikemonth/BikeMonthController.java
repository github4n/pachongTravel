package com.fh.controller.bike.bikemonth;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.bike.bikemonth.BikeMonthManager;
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
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：总体分析
 * 创建人：
 * 创建时间：2018-07-04
 */
@Controller
@RequestMapping(value="/bikemonth")
public class BikeMonthController extends BaseController {
	
	String menuUrl = "bikemonth/list.do"; //菜单地址(权限用)
	@Resource(name="bikemonthService")
	private BikeMonthManager bikemonthService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{


		logBefore(logger, Jurisdiction.getUsername()+"新增BikeMonth");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("BIKEMONTH_ID", this.get32UUID());	//主键
		bikemonthService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除BikeMonth");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		bikemonthService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改BikeMonth");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		bikemonthService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表BikeMonth");
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
		//骑行时间段分布图
		List<PageData> varList_date=null;
		if(start_date !=null&&end_date!=null){
			 varList_date = bikemonthService.rideNumBydate(page);//查询开始和结束时间段数据
		}
		List<PageData> varList_all = bikemonthService.rideNumTotal(page);//查询全部数据
		JSONObject xJson = new JSONObject();  //骑行总次数

		if(varList_date!=null && varList_date.size()>0){

			PageData pgdt = (PageData)varList_date.get(0);
			if(pgdt !=null){
				DecimalFormat decimalFormat = new DecimalFormat("0.00");
				xJson.put("averageNumber", pgdt.get("averageNumber"));
				xJson.put("averageRidingTime", pgdt.get("averageRidingTime"));
				xJson.put("thisTime", pgdt.get("thisTime"));
				xJson.put("historicalAccumulation", pgdt.get("historicalAccumulation"));
			}

		}else{
			xJson.put("averageNumber", 0);
			xJson.put("averageRidingTime", 0);
			xJson.put("thisTime", 0);
			xJson.put("historicalAccumulation", 0);
		}

		if(varList_all!=null && varList_all.size()>0){
			PageData pgdt = (PageData)varList_all.get(0);
			if(pgdt !=null){
				xJson.put("totalNumber", pgdt.get("totalNumber")==null?0:pgdt.get("totalNumber"));
				xJson.put("averageNumber", pgdt.get("averageNumber"));
				xJson.put("maximumNumberDay", pgdt.get("maximumNumberDay"));
				xJson.put("totalRidingTime", pgdt.get("totalRidingTime"));
				xJson.put("averageRidingTime", pgdt.get("averageRidingTime"));
				xJson.put("maximumRidingTimeDay", pgdt.get("maximumRidingTimeDay"));
				xJson.put("averageEachRide", pgdt.get("averageEachRide"));
			}
		}else{
			xJson.put("totalNumber", 0);
			xJson.put("averageNumber", 0);
			xJson.put("maximumNumberDay", 0);
			xJson.put("totalRidingTime", 0);
			xJson.put("averageRidingTime", 0);
			xJson.put("maximumRidingTimeDay", 0);
			xJson.put("averageEachRide", 0);
		}


		pd.put("xJson", xJson);

		mv.setViewName("bike/bikemonth/bikemonth_list");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	@RequestMapping(value = "/getRidingTotalDuration")
	@ResponseBody
	public JSONObject getRidingTotalDuration(Page page, String startTime,String endTime,String type) throws Exception {

		PageData pd = new PageData();
		pd = this.getPageData();
		String start_date ="";
		String end_date = "";
		Calendar now = Calendar.getInstance();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDay = smf.format(now.getTime());
		JSONObject jt = new JSONObject();
        Map<String,Object> map= new HashMap<String,Object>();
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

		//List<PageData> varList = touragentService.tourAgentChart(page);
        List<PageData> rideNumBydateData = bikemonthService.rideNumBydate(page);//按时间查询
        List<PageData> rideNumTotalData = bikemonthService.rideNumTotal(page);//查询全部累计
        map.put("rideNumBydateData",rideNumBydateData);
        map.put("rideNumTotalData",rideNumTotalData);
        jt.put("data",map);
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
		mv.setViewName("bike/bikemonth/bikemonth_edit");
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
		pd = bikemonthService.findById(pd);	//根据ID读取
		mv.setViewName("bike/bikemonth/bikemonth_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除BikeMonth");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			bikemonthService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出BikeMonth到excel");
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
		dataMap.put("titles", titles);
		List<PageData> varOList = bikemonthService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).get("RIDENUM").toString());	//2
			vpd.put("var3", varOList.get(i).get("RIDETIME").toString());	//3
			vpd.put("var4", varOList.get(i).get("AVERIDETIME").toString());	//4
			vpd.put("var5", varOList.get(i).getString("RIDEMONTH"));	    //5
			vpd.put("var6", varOList.get(i).getString("DATE"));	    //6
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
