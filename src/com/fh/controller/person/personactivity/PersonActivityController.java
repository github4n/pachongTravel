package com.fh.controller.person.personactivity;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.person.personactivity.PersonActivityManager;
import com.fh.util.Jurisdiction;
import com.fh.util.OtaUtil;
import com.fh.util.PageData;
import net.sf.json.JSONObject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：person
 * 创建人：
 * 创建时间：2018-08-07
 */
@Controller
@RequestMapping(value="/personactivity")
public class PersonActivityController extends BaseController {
	
	String menuUrl = "personactivity/list.do"; //菜单地址(权限用)
	@Resource(name="personactivityService")
	private PersonActivityManager personactivityService;
	


	

	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonActivity");
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


        int  userTotal = personactivityService.listUserTotal(page);
        int  newUser = personactivityService.listNewUser(page);
        List<PageData> listActivity = personactivityService.listActivity(page);
        List<Object> listp=new ArrayList<Object>();
        JSONObject xJson = new JSONObject();
        JSONObject yJson = new JSONObject();
        List<Long> xData = new ArrayList<Long>();
        List<Double> yData = new ArrayList<Double>();
        List<Object> pData = new ArrayList<Object>();
        Iterator<PageData> dataIterator = listActivity.iterator();
        double ordertotalSum=0;
        long ototalSum=0;
        long frequency= 0;
        double pe= 0;
        long fy= 0;
        double ptage=0;
        while (dataIterator.hasNext()){
            PageData pgdt = dataIterator.next();
            xData.add((Long) pgdt.get("frequency"));
            yData.add((Double) pgdt.get("percentage"));
            Long ordertotal = (Long) pgdt.get("ordertotal");
            fy =(long)  pgdt.get("frequency");
            ototalSum=ototalSum+fy;
            if(ordertotal <= 4 ){

                BigDecimal b   =   new   BigDecimal((Double) pgdt.get("percentage"));
                double   f1   =   b.setScale(1,   BigDecimal.ROUND_HALF_UP).doubleValue();
                pgdt.put("percentage",f1);
                listp.add(pgdt);
            }else if(ordertotal>= 5){
                  frequency =(long)  pgdt.get("frequency");
                  ordertotalSum=ordertotalSum+frequency;
                pe =(double)  pgdt.get("percentage");
                ptage=ptage+pe;
            }
        }

        xJson.put("xData",xData);
        yJson.put("yData",yData);
        pd.put("xJson",xJson);
        pd.put("yJson",yJson);
        mv.setViewName("person/personactivity/personactivity_list");
		//mv.addObject("varList", varList);
       // pd.put("listUserTotal",listUserTotal);
       // pd.put("listNewUser",listNewUser);
        //pd.put()
        mv.addObject("userTotal", userTotal);
        mv.addObject("newUser", newUser);
        mv.addObject("ordertotalSum",ordertotalSum);
        mv.addObject("ototalSum",ototalSum);
        if(ordertotalSum!=0){
            double tal = ptage / ordertotalSum;
            BigDecimal bb   =   new   BigDecimal(tal);
            double   total   =   bb.setScale(1,   BigDecimal.ROUND_HALF_UP).doubleValue();
            mv.addObject("ptage",total);
        }else{
            mv.addObject("ptage",0);
        }
        mv.addObject("listp",listp);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}


    @RequestMapping(value = "/getActivity")
    @ResponseBody
    public JSONObject getActivity(Page page, String startTime,String endTime,String type) throws Exception {

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
        Map<String,Object> map = new HashMap<String,Object>();

        int  userTotal = personactivityService.listUserTotal(page);
        int  newUser = personactivityService.listNewUser(page);
        List<PageData> listActivity = personactivityService.listActivity(page);
        List<Object> listp=new ArrayList<Object>();
        JSONObject xJson = new JSONObject();
        JSONObject yJson = new JSONObject();
        List<Long> xData = new ArrayList<Long>();
        List<Double> yData = new ArrayList<Double>();
        List<Object> pData = new ArrayList<Object>();
        Iterator<PageData> dataIterator = listActivity.iterator();
        double ordertotalSum=0;
        long ototalSum=0;
        long frequency= 0;
        double pe= 0;
        long fy= 0;
        double ptage=0;
        while (dataIterator.hasNext()){
            PageData pgdt = dataIterator.next();
            xData.add((Long) pgdt.get("frequency"));
            yData.add((Double) pgdt.get("percentage"));
            Long ordertotal = (Long) pgdt.get("ordertotal");
            fy =(long)  pgdt.get("frequency");
            ototalSum=ototalSum+fy;
            if(ordertotal <= 4 ){

                BigDecimal b   =   new   BigDecimal((Double) pgdt.get("percentage"));
                double   f1   =   b.setScale(1,   BigDecimal.ROUND_HALF_UP).doubleValue();
                pgdt.put("percentage",f1);
                listp.add(pgdt);
            }else if(ordertotal>= 5){
                frequency =(long)  pgdt.get("frequency");
                ordertotalSum=ordertotalSum+frequency;
                pe =(double)  pgdt.get("percentage");
                ptage=ptage+pe;
            }
        }

        xJson.put("xData",xData);
        yJson.put("yData",yData);
        pd.put("xJson",xJson);
        pd.put("yJson",yJson);

        if(ordertotalSum!=0){
            double tal = ptage / ordertotalSum;
            BigDecimal bb   =   new   BigDecimal(tal);
            double   total   =   bb.setScale(1,   BigDecimal.ROUND_HALF_UP).doubleValue();
            pd.put("ptage",total);
        }else{
            pd.put("ptage",0);
        }
        pd.put("userTotal",userTotal);
        pd.put("newUser",newUser);
        pd.put("ordertotalSum",ordertotalSum);
        pd.put("ototalSum",ototalSum);
        pd.put("listp",listp);

        jt.put("data", pd);
        return jt;


    }

	

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
