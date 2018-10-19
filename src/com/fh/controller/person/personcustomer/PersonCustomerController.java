package com.fh.controller.person.personcustomer;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.OtaUtil;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.person.personcustomer.PersonCustomerManager;

/** 
 * 说明：customer
 * 创建人：
 * 创建时间：2018-08-07
 */
@Controller
@RequestMapping(value="/personcustomer")
public class PersonCustomerController extends BaseController {
	
	String menuUrl = "personcustomer/list.do"; //菜单地址(权限用)
	@Resource(name="personcustomerService")
	private PersonCustomerManager personcustomerService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增PersonCustomer");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PERSONCUSTOMER_ID", this.get32UUID());	//主键
		personcustomerService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除PersonCustomer");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		personcustomerService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改PersonCustomer");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		personcustomerService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonCustomer");
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
		
		//省份分布
		List<PageData> provList = personcustomerService.provChart(page);
		List<PageData> cityList = personcustomerService.cityChart(page);
		
		List cityName = new ArrayList();
		List cityCnt = new ArrayList();
		
		List<Long> provCnt = new ArrayList<Long>();
		List<String> provName = new ArrayList<String>();
		
		for(int i = 0; i < provList.size(); i++){
			PageData pgdt = (PageData)provList.get(i);
			String pname = "";
			if(!"".equals(pgdt.get("pname")) && pgdt.get("pname")!=null){
				
//				pname = "'"+(String) pgdt.get("pname")+"'";
				pname = (String) pgdt.get("pname");
			}else{
//				pname = "'"+"其他"+"'";
				pname = "其他";
			}
			long cnt = (Long)pgdt.get("cnt");
			provName.add(pname);
			provCnt.add(cnt);
		}
		
		for(int j = 0; j < cityList.size(); j++){
			PageData pgdt = (PageData)cityList.get(j);
			String cname = "";
			if(!"".equals(pgdt.get("cname")) && pgdt.get("cname")!=null){
				
//				cname = "'"+(String) pgdt.get("cname")+"'";
				cname = (String) pgdt.get("cname");
			}else{
				cname = "其他";
			}
			long cnt = (Long)pgdt.get("cnt");
			cityName.add(cname);
			cityCnt.add(cnt);
		}
		
		mv.setViewName("person/personcustomer/personcustomer_list");
		mv.addObject("pd", pd);
		mv.addObject("provName", provName);
		mv.addObject("provCnt", provCnt);
		mv.addObject("cityName",cityName);
		mv.addObject("cityCnt",cityCnt);
		
		mv.addObject("provList", provList);
		mv.addObject("cityList", cityList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}



	@RequestMapping(value = "/getSourceDistribution")
	@ResponseBody
	public JSONObject getSourceDistribution(Page page, String startTime,String endTime,String type) throws Exception {

		PageData pd = new PageData();
		pd = this.getPageData();
		String start_date = "";
		String end_date = "";
		Calendar now = Calendar.getInstance();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDay = smf.format(now.getTime());
		JSONObject jt = new JSONObject();

		OtaUtil util = new OtaUtil();
		if (null != type && !"".equals(type)) {
			//如果选择按钮，则返回固定的起始时间和结束时间
			end_date = util.getEndDateS(type);
			start_date = util.getStartDateS(type);
		} else if (null != startTime && !"".equals(startTime) && null != endTime && !"".equals(endTime)) {
			//如果选择了日期选择框，则返回日期框中选择的起始时间和结束时间
			start_date = startTime;
			end_date = endTime;
		} else {
			start_date = currentDay;
			end_date = currentDay;
		}
		pd.put("endDate", end_date);
		pd.put("startDate", start_date);
		page.setPd(pd);

		//省份分布
		List<PageData> provList = personcustomerService.provChart(page);
		List<PageData> cityList = personcustomerService.cityChart(page);
		List cityName = new ArrayList();
		List cityCnt = new ArrayList();
		List<Long> provCnt = new ArrayList<Long>();
		List<String> provName = new ArrayList<String>();
		Map<String,Object> map =new HashMap<String, Object>();
		for(int i = 0; i < provList.size(); i++){
			PageData pgdt = (PageData)provList.get(i);
			String pname = "";
			if(!"".equals(pgdt.get("pname")) && pgdt.get("pname")!=null){

				pname = (String) pgdt.get("pname");
			}else{
				pname = "其他";
			}
			long cnt = (Long)pgdt.get("cnt");
			provName.add(pname);
			provCnt.add(cnt);
		}

		for(int j = 0; j < cityList.size(); j++){
			PageData pgdt = (PageData)cityList.get(j);
			String cname = "";
			if(!"".equals(pgdt.get("cname")) && pgdt.get("cname")!=null){

				cname = (String) pgdt.get("cname");
			}else{
				cname = "其他";
			}
			long cnt = (Long)pgdt.get("cnt");
			cityName.add(cname);
			cityCnt.add(cnt);
		}

		map.put("provName",provName);
		map.put("provCnt",provCnt);
		map.put("cityName",cityName);
		map.put("cityCnt",cityCnt);
		map.put("provList",provList);
		map.put("cityList",cityList);
//		mv.setViewName("person/personcustomer/personcustomer_list");
//		mv.addObject("pd", pd);
//		mv.addObject("provName", provName);
//		mv.addObject("provCnt", provCnt);
//		mv.addObject("cityName",cityName);
//		mv.addObject("cityCnt",cityCnt);
//		mv.addObject("provList", provList);
//		mv.addObject("cityList", cityList);
		//List<PageData> varList = bikeridetmService.datalistPage(page);
		jt.put("data", map);
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
		mv.setViewName("person/personcustomer/personcustomer_edit");
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
		pd = personcustomerService.findById(pd);	//根据ID读取
		mv.setViewName("person/personcustomer/personcustomer_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除PersonCustomer");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			personcustomerService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出PersonCustomer到excel");
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
		dataMap.put("titles", titles);
		List<PageData> varOList = personcustomerService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("PROVNAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("PROVPNUM"));	    //3
			vpd.put("var4", varOList.get(i).getString("PROVPERCENT"));	    //4
			vpd.put("var5", varOList.get(i).getString("CREATEDATE"));	    //5
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
