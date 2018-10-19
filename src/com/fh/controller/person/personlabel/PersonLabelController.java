package com.fh.controller.person.personlabel;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.person.personlabel.PersonLabelManager;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：customer
 * 创建人：
 * 创建时间：2018-08-07
 */
@Controller
@RequestMapping(value="/personlabel")
public class PersonLabelController extends BaseController {
	
	String menuUrl = "personlabel/list.do"; //菜单地址(权限用)selectMobileList
	@Resource(name="personlabelService")
	private PersonLabelManager personlabelService;






	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增PersonLabel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PERSONLABEL_ID", this.get32UUID());	//主键
		personlabelService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除PersonLabel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		personlabelService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改PersonLabel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		personlabelService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonLabel");
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

        PageData highQualityMaleGroup = personlabelService.highQualityMaleGroup(page);
        PageData highQualityFemaleGroup = personlabelService.highQualityFemaleGroup(page);
        PageData parentChildTourGroup = personlabelService.parentChildTourGroup(page);
        PageData middleAgedTouristsGroup = personlabelService.middleAgedTouristsGroup(page);
        PageData elderlyTouristsGroup = personlabelService.elderlyTouristsGroup(page);
        PageData poorTravelGroup = personlabelService.poorTravelGroup(page);
        PageData workplaceWhiteGroup = personlabelService.workplaceWhiteGroup(page);
        PageData studentGroup = personlabelService.studentGroup(page);
        PageData houseWifeGroup = personlabelService.houseWifeGroup(page);
        PageData highEndPopulationGroup = personlabelService.highEndPopulationGroup(page);
        mv.addObject("hqmg", highQualityMaleGroup);
        mv.addObject("hqfg", highQualityFemaleGroup);
        mv.addObject("pctg", parentChildTourGroup);
        mv.addObject("matg", middleAgedTouristsGroup);
        mv.addObject("etg", elderlyTouristsGroup);
        mv.addObject("ptg", poorTravelGroup);
        mv.addObject("wwg", workplaceWhiteGroup);
        mv.addObject("sg", studentGroup);
        mv.addObject("hwg", houseWifeGroup);
        mv.addObject("hpg", highEndPopulationGroup);

		mv.setViewName("person/personlabel/personlabel_list");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}






	@RequestMapping(value = "/getSegmentation")
	@ResponseBody
	public JSONObject getSegmentation(Page page, String startTime, String endTime, String type) throws Exception {

		PageData pd = new PageData();
		pd = this.getPageData();
		String start_date = "";
		String end_date = "";
		Calendar now = Calendar.getInstance();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDay = smf.format(now.getTime());
		JSONObject jt = new JSONObject();
		Map<String,Object> map = new HashMap<String, Object>();
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

		PageData highQualityMaleGroup = personlabelService.highQualityMaleGroup(page);
		PageData highQualityFemaleGroup = personlabelService.highQualityFemaleGroup(page);
		PageData parentChildTourGroup = personlabelService.parentChildTourGroup(page);
		PageData middleAgedTouristsGroup = personlabelService.middleAgedTouristsGroup(page);
		PageData elderlyTouristsGroup = personlabelService.elderlyTouristsGroup(page);
		PageData poorTravelGroup = personlabelService.poorTravelGroup(page);
		PageData workplaceWhiteGroup = personlabelService.workplaceWhiteGroup(page);
		PageData studentGroup = personlabelService.studentGroup(page);
		PageData houseWifeGroup = personlabelService.houseWifeGroup(page);
		PageData highEndPopulationGroup = personlabelService.highEndPopulationGroup(page);
		map.put("highQualityMaleGroup",highQualityMaleGroup);
		map.put("highQualityFemaleGroup",highQualityFemaleGroup);
		map.put("parentChildTourGroup",parentChildTourGroup);
		map.put("middleAgedTouristsGroup",middleAgedTouristsGroup);
		map.put("elderlyTouristsGroup",elderlyTouristsGroup);
		map.put("poorTravelGroup",poorTravelGroup);
		map.put("workplaceWhiteGroup",workplaceWhiteGroup);
		map.put("studentGroup",studentGroup);
		map.put("houseWifeGroup",houseWifeGroup);
		map.put("highEndPopulationGroup",highEndPopulationGroup);
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
		mv.setViewName("person/personlabel/personlabel_edit");
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
		pd = personlabelService.findById(pd);	//根据ID读取
		mv.setViewName("person/personlabel/personlabel_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除PersonLabel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			personlabelService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出PersonLabel到excel");
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
		List<PageData> varOList = personlabelService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("USERNAME"));	    //2
			vpd.put("var3", varOList.get(i).get("USERNUM").toString());	//3
			vpd.put("var4", varOList.get(i).get("USERAGE").toString());	//4
			vpd.put("var5", varOList.get(i).getString("USERLABEL"));	    //5
			vpd.put("var6", varOList.get(i).getString("CREATEDATE"));	    //6
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
