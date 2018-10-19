package com.fh.controller.bigdata.bikedaycnt;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.fh.service.bigdata.bikedaycnt.BikeDayCntManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 说明：大数据可视化
 * 创建人：
 * 创建时间：2018-06-27
 */
@Controller
@RequestMapping(value="/bikedaycnt")
public class BikeDayCntController extends BaseController {
	
	String menuUrl = "bikedaycnt/list.do"; //菜单地址(权限用)
	@Resource(name="bikedaycntService")
	private BikeDayCntManager bikedaycntService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增BikeDayCnt");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("BIKEDAYCNT_ID", this.get32UUID());	//主键
		bikedaycntService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除BikeDayCnt");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		bikedaycntService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改BikeDayCnt");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		bikedaycntService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表BikeDayCnt");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		
		//页面查询条件
		PageData pd = new PageData();
		pd = this.getPageData();
		String startDate = pd.getString("startDate");
		String endDate = pd.getString("endDate");
		if(null != startDate && !"".equals(startDate)){
			pd.put("startDate", startDate.trim());
		}else{
			pd.put("startDate", "2017-10-01");
		}
		if(null != endDate && !"".equals(endDate)){
			pd.put("endDate", endDate.trim());
		}else{
			pd.put("endDate", "2017-10-30");
		}
		page.setPd(pd);
		
		
		//骑行时间段分布图
		List<PageData> result = bikedaycntService.timecntChart(page);
		Iterator itr = result.iterator();
		
		List<String> xData = new ArrayList<String>();
		
		JSONObject yJson = new JSONObject();
		JSONObject xJson = new JSONObject();
		JSONObject zJson = new JSONObject();
		List<Integer> yData = new ArrayList<Integer>();
		List<Double> zData = new ArrayList<Double>();
		while(itr.hasNext()){
			PageData pgdt = (PageData)itr.next();
			xData.add(pgdt.get("date").toString());
			yData.add((Integer) pgdt.get("ridenum"));
			if(null!=(Double)pgdt.get("ridetime")){
				double ridetmItem = (Double)pgdt.get("ridetime");
				zData.add((double)Math.round(ridetmItem*100)/100);
			}else{
				zData.add(0.00);
			}
		}
		
		xJson.put("xData", xData);
		yJson.put("name", "骑行次数");
		yJson.put("yData", yData);
		zJson.put("name","骑行时间");
		zJson.put("zData", zData);
		
		pd.put("xJson", xJson);	
		pd.put("yJson",yJson);
		pd.put("zJson",zJson);
		//骑行时长
		
		
		mv.setViewName("bigdata/bikedaycnt/bikedaycnt_list");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
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
		mv.setViewName("bigdata/bikedaycnt/bikedaycnt_edit");
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
		pd = bikedaycntService.findById(pd);	//根据ID读取
		mv.setViewName("bigdata/bikedaycnt/bikedaycnt_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除BikeDayCnt");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			bikedaycntService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出BikeDayCnt到excel");
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
		List<PageData> varOList = bikedaycntService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).get("RIDENUM").toString());	//2
			vpd.put("var3", varOList.get(i).get("RIDETIME").toString());	//3
			vpd.put("var4", varOList.get(i).get("AVERIDETM").toString());	//4
			vpd.put("var5", varOList.get(i).getString("DATE"));	    //5
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
