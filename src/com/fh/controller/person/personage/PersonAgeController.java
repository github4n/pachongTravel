package com.fh.controller.person.personage;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.person.personage.PersonAgeManager;
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
 * 说明：age
 * 创建人：
 * 创建时间：2018-08-07
 */
@Controller
@RequestMapping(value="/personage")
public class PersonAgeController extends BaseController {
	
	String menuUrl = "personage/list.do"; //菜单地址(权限用)
	@Resource(name="personageService")
	private PersonAgeManager personageService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增PersonAge");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PERSONAGE_ID", this.get32UUID());	//主键
		personageService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除PersonAge");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		personageService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改PersonAge");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		personageService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonAge");
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
		
		//游客性别分布
		List<PageData> genderList = personageService.genderChart(page);
		Long maleNum = 0L;
		Long femaleNum = 0L;
		
		for(int i = 0; i < genderList.size(); i++){
			PageData pgdt = (PageData)genderList.get(i);
			String gender = "";
			if(!"".equals(pgdt.get("gender")) && pgdt.get("gender")!=null){
				
				gender = (String) pgdt.get("gender");
				if("男".equals(gender)){
					maleNum = (Long)pgdt.get("cnt");
				}else if("女".equals(gender)){
					femaleNum = (Long)pgdt.get("cnt");
				}
			}
		}
		
		//游客年龄段分布
		List<PageData> ageList = personageService.ageChart(page);
		List<Long> ageCnt = new ArrayList<Long>();
		List<String> ageName = new ArrayList<String>();
		
		for(int i = 0; i < ageList.size(); i++){
			PageData pgdt = (PageData)ageList.get(i);

			if(!"".equals(pgdt.get("age")) && !pgdt.get("age").equals("null")){
				
				String pname = "'"+(String) pgdt.get("age")+"'";
                long cnt = (Long)pgdt.get("cnt");
                ageName.add(pname);
                ageCnt.add(cnt);
			}
//			else{
//				pname = "'"+"其他"+"'";
//			}

		}
		

        //游客年龄性别交叉分布
        ArrayList<String> labelList = new ArrayList<String>(Arrays.asList("24岁以下","25-30岁","31-35岁","36-40岁","41岁以上"));
        List<PageData> ageGenderList = personageService.ageGenderChart(page);
        List<Long> maleList = new ArrayList<Long>();
        List<Long> femaleList = new ArrayList<Long>();
        List<String> nameList = new ArrayList<String>();

        for(int i=0; i<labelList.size(); i++){
            String ageLabel = labelList.get(i);
            String pname = "'"+ageLabel+"'";
            nameList.add(pname);
            long maleCnt = 0L;
            long femaleCnt = 0L;
            for(int j=0; j<ageGenderList.size(); j++){
                PageData pgdt = (PageData)ageGenderList.get(j);

                if(!"".equals(pgdt.get("age")) && pgdt.get("age")!=null){
                    String gender = (String) pgdt.get("gender");
                    long cnt = 0L;
                    if(!"".equals(pgdt.get("cnt")) && pgdt.get("cnt")!=null){
                        cnt = (Long)pgdt.get("cnt");
                    }

                    if(ageLabel.equals(pgdt.get("age"))){
                        if(gender.equals("男")){
                            maleCnt = cnt;
                        }else if(gender.equals("女")){
                            femaleCnt = cnt;
                        }
                    }

                }
            }
            maleList.add(maleCnt);
                femaleList.add(femaleCnt);

        }

		mv.setViewName("person/personage/personage_list");
		mv.addObject("maleNum", maleNum);
		mv.addObject("femaleNum", femaleNum);
		mv.addObject("ageName", ageName);
		mv.addObject("ageCnt", ageCnt);
		
		mv.addObject("nameList", nameList);
		mv.addObject("maleList", maleList);
		mv.addObject("femaleList", femaleList);
		
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	@RequestMapping(value = "/getAgeAndGender")
	@ResponseBody
	public JSONObject getAgeAndGender(Page page, String startTime, String endTime, String type) throws Exception {

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

		List<PageData> genderList = personageService.genderChart(page);
		Long maleNum = 0L;
		Long femaleNum = 0L;

		for(int i = 0; i < genderList.size(); i++){
			PageData pgdt = (PageData)genderList.get(i);
			String gender = "";
			if(!"".equals(pgdt.get("gender")) && pgdt.get("gender")!=null){

				gender = (String) pgdt.get("gender");
				if("男".equals(gender)){
					maleNum = (Long)pgdt.get("cnt");
				}else if("女".equals(gender)){
					femaleNum = (Long)pgdt.get("cnt");
				}
			}
		}

		//游客年龄段分布
		List<PageData> ageList = personageService.ageChart(page);
		List<Long> ageCnt = new ArrayList<Long>();
		List<String> ageName = new ArrayList<String>();

		for(int i = 0; i < ageList.size(); i++){
			PageData pgdt = (PageData)ageList.get(i);

			if(!"".equals(pgdt.get("age")) && !pgdt.get("age").equals("null")){

//				String pname = "'"+(String) pgdt.get("age")+"'";
				String pname = (String) pgdt.get("age");
				long cnt = (Long)pgdt.get("cnt");
				ageName.add(pname);
				ageCnt.add(cnt);
			}

		}

		//游客年龄性别交叉分布
		ArrayList<String> labelList = new ArrayList<String>(Arrays.asList("24岁以下","25-30岁","31-35岁","36-40岁","41岁以上"));
		List<PageData> ageGenderList = personageService.ageGenderChart(page);
		List<Long> maleList = new ArrayList<Long>();
		List<Long> femaleList = new ArrayList<Long>();
		List<String> nameList = new ArrayList<String>();

		for(int i=0; i<labelList.size(); i++){
			String ageLabel = labelList.get(i);
//			String pname = "'"+ageLabel+"'";
			String pname = ageLabel;
			nameList.add(pname);
			long maleCnt = 0L;
			long femaleCnt = 0L;
			for(int j=0; j<ageGenderList.size(); j++){
				PageData pgdt = (PageData)ageGenderList.get(j);

				if(!"".equals(pgdt.get("age")) && pgdt.get("age")!=null){
					String gender = (String) pgdt.get("gender");
					long cnt = 0L;
					if(!"".equals(pgdt.get("cnt")) && pgdt.get("cnt")!=null){
						cnt = (Long)pgdt.get("cnt");
					}

					if(ageLabel.equals(pgdt.get("age"))){
						if(gender.equals("男")){
							maleCnt = cnt;
						}else if(gender.equals("女")){
							femaleCnt = cnt;
						}
					}

				}
			}
			maleList.add(maleCnt);
			femaleList.add(femaleCnt);

		}

		map.put("maleNum",maleNum);
		map.put("femaleNum",femaleNum);
		map.put("ageName",ageName);
		map.put("ageCnt",ageCnt);
		map.put("nameList",nameList);
		map.put("maleList",maleList);
		map.put("femaleList",femaleList);

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
		mv.setViewName("person/personage/personage_edit");
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
		pd = personageService.findById(pd);	//根据ID读取
		mv.setViewName("person/personage/personage_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除PersonAge");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			personageService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出PersonAge到excel");
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
		dataMap.put("titles", titles);
		List<PageData> varOList = personageService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("PROVNAME"));	    //2
			vpd.put("var3", varOList.get(i).get("PROVPEPNUM").toString());	//3
			vpd.put("var4", varOList.get(i).get("PROVAGEPERCE").toString());	//4
			vpd.put("var5", varOList.get(i).getString("PROVAGE"));	    //5
			vpd.put("var6", varOList.get(i).getString("PROVMALE"));	    //6
			vpd.put("var7", varOList.get(i).getString("PROVFEMAL"));	    //7
			vpd.put("var8", varOList.get(i).getString("CREATEDATE"));	    //8
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
