package com.fh.controller.bike.bikeridetm;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.bike.bikeridetm.BikeRideTmManager;
import com.fh.util.*;
import net.sf.json.JSONObject;
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
 * 说明：时间段
 * 创建人：
 * 创建时间：2018-07-04
 */
@Controller
@RequestMapping(value="/bikeridetm")
public class BikeRideTmController extends BaseController {
	
	String menuUrl = "bikeridetm/list.do"; //菜单地址(权限用)
	@Resource(name="bikeridetmService")
	private BikeRideTmManager bikeridetmService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增BikeRideTm");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("BIKERIDETM_ID", this.get32UUID());	//主键
		bikeridetmService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除BikeRideTm");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		bikeridetmService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改BikeRideTm");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		bikeridetmService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表BikeRideTm");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();

        List<String> xData = new ArrayList<String>();
        JSONObject yJson = new JSONObject();
        JSONObject xJson = new JSONObject();
        JSONObject zJson = new JSONObject();
        List<Object> yData = new ArrayList<Object>();
        List<Long> zData = new ArrayList<Long>();
        Map<String,Object> map  =new TreeMap<String,Object>();

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


        if(start_date != null && start_date!="" && end_date !=null && end_date !=""){
            List<PageData>	varList = bikeridetmService.datalistPage(page);	//按时间开始和结束时间查询
            Iterator pageData_itr = varList.iterator();
            while (pageData_itr.hasNext()){
                PageData pgdt = (PageData)pageData_itr.next();
                zData.add((Long) pgdt.get("cyclingTimes"));
                map.put(pgdt.get("tmarea").toString(),pgdt.get("cyclingTimes"));
            }
        }else{
            List<PageData> pageData = bikeridetmService.listAll();//加载查询所有数据
            Iterator pageData_itr = pageData.iterator();
            while (pageData_itr.hasNext()){
                PageData pgdt = (PageData)pageData_itr.next();
                zData.add((Long) pgdt.get("cyclingTimes"));
                map.put(pgdt.get("tmarea").toString(),pgdt.get("cyclingTimes"));
            }
        }

        Map<String, Object> xymap= updateXList(map);//没有数据补时间段0
        for (Map.Entry<String, Object> entry : xymap.entrySet()){
            xData.add(entry.getKey());
            yData.add(entry.getValue());
        }

        xJson.put("xData", xData);
        yJson.put("yName", "骑行次数");
        yJson.put("yData", yData);
        zJson.put("zName", "累积次数");
        zJson.put("zData", zData);

        pd.put("xJson", xJson);
        pd.put("yJson",yJson);
        pd.put("zJson", zJson);

        mv.setViewName("bike/bikeridetm/bikeridetm_list");
		//mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}


	@RequestMapping(value = "/getRidingTimePeriod")
	@ResponseBody
	public JSONObject getRidingTimePeriod(Page page, String startTime,String endTime,String type) throws Exception {

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
		List<PageData> varList = bikeridetmService.datalistPage(page);
		jt.put("data", varList);
		return jt;


	}

    /*
    跟新list数据没有该时段将补上
 */
    public Map<String,Object>  updateXList(Map<String,Object> map){
        String arr [] = {"00","01","02","03","04","05","06","07","08","09","10","11","12",
                "13","14","15","16","17","18","19","20","21","22","23"};
        List<String> fixedDate=Arrays.asList(arr);
        Set<String> keySet = map.keySet();

        for (String fd:fixedDate){
            if(!CollectionUtils.contains(keySet.iterator(),fd)){
                map.put(fd,0L);
            }
        }


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
		mv.setViewName("bike/bikeridetm/bikeridetm_edit");
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
		pd = bikeridetmService.findById(pd);	//根据ID读取
		mv.setViewName("bike/bikeridetm/bikeridetm_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除BikeRideTm");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			bikeridetmService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出BikeRideTm到excel");
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
		//List<PageData> varOList = bikeridetmService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
//		for(int i=0;i<varOList.size();i++){
//			PageData vpd = new PageData();
//			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
//			vpd.put("var2", varOList.get(i).get("BIKEID").toString());	//2
//			vpd.put("var3", varOList.get(i).getString("PRICE"));	    //3
//			vpd.put("var4", varOList.get(i).getString("TOTALPAY"));	    //4
//			vpd.put("var5", varOList.get(i).getString("TMAREA"));	    //5
//			vpd.put("var6", varOList.get(i).getString("RIDEDATE"));	    //6
//			vpd.put("var7", varOList.get(i).getString("RIDETM"));	    //7
//			varList.add(vpd);
//		}
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
