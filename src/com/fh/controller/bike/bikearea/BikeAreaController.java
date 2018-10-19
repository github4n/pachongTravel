package com.fh.controller.bike.bikearea;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.bike.bikearea.BikeAreaManager;
import com.fh.util.Jurisdiction;
import com.fh.util.OtaUtil;
import com.fh.util.PageData;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：轨迹分析
 * 创建人：
 * 创建时间：2018-07-04
 */
@Controller
@RequestMapping(value="/bikearea")
public class BikeAreaController extends BaseController {
	
	String menuUrl = "bikearea/list.do"; //菜单地址(权限用)
	@Resource(name="bikeareaService")
	private BikeAreaManager bikeareaService;
	

	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表BikeArea");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
        List<String> xData = new ArrayList<String>();
        JSONObject yJson = new JSONObject();
        JSONObject xJson = new JSONObject();
        JSONObject zJson = new JSONObject();
        Set<Object> yData = new LinkedHashSet<Object>();
        Set<Object> zData = new LinkedHashSet<Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String start_date ="";
        String end_date = "";
        String startTime = pd.getString("startTime");
        String endTime = pd.getString("endTime");

        Calendar now = Calendar.getInstance();
        SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
        String currentDay = smf.format(now.getTime());
        String type = pd.getString("radio");
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

        List<PageData> rentParkData = bikeareaService.selectPentPark();
        Iterator rentPark  = rentParkData.iterator();
        while (rentPark.hasNext()){
            PageData pgdt = (PageData)rentPark.next();
            yData.add(pgdt.get("RentPark"));
           // map.put(pgdt.get("tmarea").toString(),pgdt.get("cyclingTimes"));
        }

        List<PageData> returnParkdata = bikeareaService.selectReturnPark();

        Iterator returnPark = returnParkdata.iterator();
        while (returnPark.hasNext()){
            PageData pgdt = (PageData)returnPark.next();
            zData.add( pgdt.get("ReturnPark"));
            // map.put(pgdt.get("tmarea").toString(),pgdt.get("cyclingTimes"));
        }
        Map<String,List<PageData>> listMap=new LinkedHashMap<String,List<PageData>>();
        int count = 0;

        if(start_date != null && start_date!="" && end_date !=null && end_date !=""){
            List<PageData> pageData = bikeareaService.selectListByDate(page);
            Iterator<PageData> iterator = pageData.iterator();
            while (iterator.hasNext()){
                PageData pgdt = (PageData)iterator.next();
                String key = pgdt.get("RentPark").toString();
                List<PageData> value = null;
                if (listMap.containsKey(key)) {
                    value = listMap.get(key);
                } else {
                    value = new ArrayList<>();
                }
                count+=1;
                value.add(pgdt);
                listMap.put(key,value);
            }
        }else{
            List<PageData>	localList = bikeareaService.localListPage();	//加载时显示列表
            Iterator<PageData> iterator = localList.iterator();
            while (iterator.hasNext()){
                PageData pgdt = (PageData)iterator.next();
                String key = pgdt.get("RentPark").toString();
                List<PageData> value = null;
                if (listMap.containsKey(key)) {
                    value = listMap.get(key);
                } else {
                    value = new ArrayList<>();
                }
                count+=1;
                value.add(pgdt);
                listMap.put(key,value);
            }
        }

        Iterator<Map.Entry<String, List<PageData>>> iterator1 = listMap.entrySet().iterator();
        Integer[][] date = new Integer[count][3];
        int index = 0;
        int x = 0;
        while (iterator1.hasNext()) {
            Map.Entry<String, List<PageData>> next = iterator1.next();
            String key = next.getKey();
            List<PageData> value = next.getValue();
            zData.add(key);
            int y = 0;
            for (PageData vo:value) {
               yData.add(vo.get("RentPark"));
               Integer[] arr = new Integer[3];
                arr[0] =x;
                arr[1] =y;
                Object obj = vo.get("cyclingTimes");
                if (StringUtils.isNumeric(obj+"")) {
                    arr[2] =Integer.parseInt(obj+"");
                } else {
                    arr[2] = 0;
                }
                y+=1;
                date[index] =arr;
                index+=1;
            }
            x+=1;
        }

        xJson.put("xData", date);
        yJson.put("yName", "骑行次数");
        yJson.put("yData", yData);
        zJson.put("zName", "累积次数");
        zJson.put("zData", zData);

        pd.put("xJson", xJson);
        pd.put("yJson",yJson);
        pd.put("zJson", zJson);

        mv.setViewName("bike/bikearea/bikearea_list");
		//mv.addObject("varList", localList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}






    @RequestMapping(value = "/getPickUpTheCar")
    @ResponseBody
    public JSONObject getPickUpTheCar(Page page, String startTime,String endTime,String radio) throws Exception {
        List<String> xData = new ArrayList<String>();
        JSONObject yJson = new JSONObject();
        JSONObject xJson = new JSONObject();
        JSONObject zJson = new JSONObject();
        Set<Object> yData = new LinkedHashSet<Object>();
        Set<Object> zData = new LinkedHashSet<Object>();
        PageData pd = new PageData();
        pd = this.getPageData();
        String start_date = "";
        String end_date = "";
        Calendar now = Calendar.getInstance();
        SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
        String currentDay = smf.format(now.getTime());
        JSONObject jt = new JSONObject();

        OtaUtil util = new OtaUtil();
        if (null != radio && !"".equals(radio)) {
            //如果选择按钮，则返回固定的起始时间和结束时间
            end_date = util.getEndDateS(radio);
            start_date = util.getStartDateS(radio);
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

        List<PageData> rentParkData = bikeareaService.selectPentPark();
        Iterator rentPark  = rentParkData.iterator();
        while (rentPark.hasNext()){
            PageData pgdt = (PageData)rentPark.next();
            yData.add(pgdt.get("RentPark"));
            // map.put(pgdt.get("tmarea").toString(),pgdt.get("cyclingTimes"));
        }

        List<PageData> returnParkdata = bikeareaService.selectReturnPark();

        Iterator returnPark = returnParkdata.iterator();
        while (returnPark.hasNext()){
            PageData pgdt = (PageData)returnPark.next();
            zData.add( pgdt.get("ReturnPark"));
            // map.put(pgdt.get("tmarea").toString(),pgdt.get("cyclingTimes"));
        }
        Map<String,List<PageData>> listMap=new LinkedHashMap<String,List<PageData>>();
        int count = 0;

        if(start_date != null && start_date!="" && end_date !=null && end_date !=""){
            List<PageData> pageData = bikeareaService.selectListByDate(page);
            Iterator<PageData> iterator = pageData.iterator();
            while (iterator.hasNext()){
                PageData pgdt = (PageData)iterator.next();
                String key = pgdt.get("RentPark").toString();
                List<PageData> value = null;
                if (listMap.containsKey(key)) {
                    value = listMap.get(key);
                } else {
                    value = new ArrayList<>();
                }
                count+=1;
                value.add(pgdt);
                listMap.put(key,value);
            }
        }else{
            List<PageData>	localList = bikeareaService.localListPage();	//加载时显示列表
            Iterator<PageData> iterator = localList.iterator();
            while (iterator.hasNext()){
                PageData pgdt = (PageData)iterator.next();
                String key = pgdt.get("RentPark").toString();
                List<PageData> value = null;
                if (listMap.containsKey(key)) {
                    value = listMap.get(key);
                } else {
                    value = new ArrayList<>();
                }
                count+=1;
                value.add(pgdt);
                listMap.put(key,value);
            }
        }

        Iterator<Map.Entry<String, List<PageData>>> iterator1 = listMap.entrySet().iterator();
        Integer[][] date = new Integer[count][3];
        int index = 0;
        int x = 0;
        while (iterator1.hasNext()) {
            Map.Entry<String, List<PageData>> next = iterator1.next();
            String key = next.getKey();
            List<PageData> value = next.getValue();
            zData.add(key);
            int y = 0;
            for (PageData vo:value) {
                yData.add(vo.get("RentPark"));
                Integer[] arr = new Integer[3];
                arr[0] =x;
                arr[1] =y;
                Object obj = vo.get("cyclingTimes");
                if (StringUtils.isNumeric(obj+"")) {
                    arr[2] =Integer.parseInt(obj+"");
                } else {
                    arr[2] = 0;
                }
                y+=1;
                date[index] =arr;
                index+=1;
            }
            x+=1;
        }

        xJson.put("xData", date);
        yJson.put("yName", "骑行次数");
        yJson.put("yData", yData);
        zJson.put("zName", "累积次数");
        zJson.put("zData", zData);

        pd.put("xJson", xJson);
        pd.put("yJson",yJson);
        pd.put("zJson", zJson);


        jt.put("data", pd);
        return jt;

    }


}
