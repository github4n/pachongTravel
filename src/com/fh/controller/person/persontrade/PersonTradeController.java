package com.fh.controller.person.persontrade;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.person.persontrade.PersonTradeManager;
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
 * 说明：消费分析
 * 创建人：
 * 创建时间：2018-09-05
 */
@Controller
@RequestMapping(value="/persontrade")
public class PersonTradeController extends BaseController {
	
	String menuUrl = "persontrade/list.do"; //菜单地址(权限用)
	@Resource(name="persontradeService")
	private PersonTradeManager persontradeService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增PersonTrade");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PERSONTRADE_ID", this.get32UUID());	//主键
		persontradeService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除PersonTrade");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		persontradeService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改PersonTrade");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		persontradeService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonTrade");
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

        List<PageData> spendingTimeList = persontradeService.spendingTimeList(page);//查询app应用停留时长
        List<PageData> consumerIndexList = persontradeService.consumerIndexList(page);//查询消费指数
        Iterator<PageData> stl = spendingTimeList.iterator();
        Iterator<PageData> cil = consumerIndexList.iterator();

        JSONObject nJson = new JSONObject();
        JSONObject sJson = new JSONObject();
        List<String> sData = new ArrayList<String>();
        List<Integer> nData = new ArrayList<Integer>();

        JSONObject nnJson = new JSONObject();
        JSONObject ssJson = new JSONObject();
        List<String> ssData = new ArrayList<String>();
        List<Integer> nnData = new ArrayList<Integer>();
        while (stl.hasNext()){
            PageData next = stl.next();
            if(next!=null){
                sData.add(next.get("spendingTimeName").toString());
                nData.add(Integer.parseInt( next.get("spendingTimeNumberSum").toString()) );
            }
        }

        while (cil.hasNext()){
            PageData next = cil.next();
            if(next!=null){
                    ssData.add(next.get("consumerIndex").toString());
                    nnData.add(Integer.parseInt( next.get("consumerIndexSum").toString()) );


            }
        }
        sJson.put("sData", sData);
        nJson.put("nData", nData);
        ssJson.put("ssData", ssData);
        nnJson.put("nnData", nnData);
        pd.put("sJson", sJson);
        pd.put("nJson", nJson);
        pd.put("ssJson", ssJson);
        pd.put("nnJson", nnJson);


        mv.setViewName("person/persontrade/persontrade_list");
//		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}




	@RequestMapping(value = "/getConsumption")
	@ResponseBody
	public JSONObject getConsumption(Page page, String startTime,String endTime,String type) throws Exception {

		PageData pd = new PageData();
		pd = this.getPageData();
		String start_date = "";
		String end_date = "";
		Calendar now = Calendar.getInstance();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		String currentDay = smf.format(now.getTime());
		JSONObject jt = new JSONObject();
		Map<String,Object> map =new HashMap<String,Object>();
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
		List<PageData> spendingTimeList = persontradeService.spendingTimeList(page);//查询app应用停留时长
		List<PageData> consumerIndexList = persontradeService.consumerIndexList(page);//查询消费指数
		map.put("spendingTimeList",spendingTimeList);
		map.put("consumerIndexList",consumerIndexList);
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
		mv.setViewName("person/persontrade/persontrade_edit");
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
		pd = persontradeService.findById(pd);	//根据ID读取
		mv.setViewName("person/persontrade/persontrade_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除PersonTrade");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			persontradeService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出PersonTrade到excel");
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
		titles.add("备注8");	//8
		titles.add("备注9");	//9
		titles.add("备注10");	//10
		titles.add("备注11");	//11
		titles.add("备注12");	//12
		titles.add("备注13");	//13
		titles.add("备注14");	//14
		titles.add("备注15");	//15
		titles.add("备注16");	//16
		titles.add("备注17");	//17
		dataMap.put("titles", titles);
		List<PageData> varOList = persontradeService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).get("MOBILE").toString());	//2
			vpd.put("var3", varOList.get(i).getString("AGE"));	    //3
			vpd.put("var4", varOList.get(i).getString("GENDER"));	    //4
			vpd.put("var5", varOList.get(i).getString("PROVINCENAME"));	    //5
			vpd.put("var6", varOList.get(i).getString("CITYNAME"));	    //6
			vpd.put("var7", varOList.get(i).getString("MARRYSTATUS"));	    //7
			vpd.put("var8", varOList.get(i).getString("LSHAVEKIDS"));	    //8
			vpd.put("var9", varOList.get(i).get("T_ORDERNUM_TOTAL").toString());	//9
			vpd.put("var10", varOList.get(i).get("T_ORDERNUM_1M").toString());	//10
			vpd.put("var11", varOList.get(i).get("T_ORDERNUM_3M").toString());	//11
			vpd.put("var12", varOList.get(i).getString("T_ORDERNUM_FIRST"));	    //12
			vpd.put("var13", varOList.get(i).getString("T_ORDERNUM_LAST"));	    //13
			vpd.put("var14", varOList.get(i).get("T_TICKETNUM_TOTAL").toString());	//14
			vpd.put("var15", varOList.get(i).getString("T_TICKETNUM_AVG"));	    //15
			vpd.put("var16", varOList.get(i).getString("T_AMOUNT_TOTAL"));	    //16
			vpd.put("var17", varOList.get(i).getString("T_AMOUNT_AVG"));	    //17
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
