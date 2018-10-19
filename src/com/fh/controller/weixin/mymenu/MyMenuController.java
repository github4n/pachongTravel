package com.fh.controller.weixin.mymenu;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.weixin.MenuUtil;
import com.fh.service.weixin.key.KeyManager;
import com.fh.service.weixin.mymenu.MyMenuManager;

/** 
 * 说明：微信自定义菜单
 * 创建人：
 * 创建时间：2016-10-30
 */
@Controller
@RequestMapping(value="/mymenu")
public class MyMenuController extends BaseController {
	
	@Resource(name="mymenuService")
	private MyMenuManager mymenuService;
	@Resource(name="keyService")
	private KeyManager keyService;
	
	/**进入编辑菜单页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditMenu")
	public ModelAndView goEditMenu()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData>	varList = mymenuService.listAll(pd);
		mv.setViewName("weixin/mymenu/mymenu_edit");
		mv.addObject("pd", pd);
		mv.addObject("varList", varList);
		return mv;
	}	
	
	/**接收提交过来的菜单数据
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/setMyMenu")
	public ModelAndView getMyMenu() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		for(int n=1;n<4;n++){
			String no1m = pd.getString("M"+n); //接收一级菜单
			pd.put("TYPE", "");
			pd.put("CONTENT", "");
			pd.put("XID", "M"+n);
			if(!"".equals(no1m.trim())){
				pd.put("TITLE", no1m.replaceAll(",fh,", "").trim());
				mymenuService.edit(pd);
				for(int i=1;i<6;i++){
					String menu = pd.getString("M"+n+""+i);//接收二次菜单
					if(!isNull(menu)){
						String[] arraym = menu.split(",fh,");
						pd.put("TITLE", arraym[0]);
						pd.put("TYPE", arraym[1]);
						if(arraym.length > 2){
							pd.put("CONTENT", arraym[2]);
						}else{
							pd.put("CONTENT", "");
						}
						pd.put("XID", "M"+n+""+i);
						mymenuService.edit(pd);		//存入数据库
					}else{
						pd.put("TITLE", "");
						pd.put("TYPE", "");
						pd.put("CONTENT", "");
						pd.put("XID", "M"+n+""+i);
						mymenuService.edit(pd);		//存入数据库
					}
				}
			}else{
				pd.put("TITLE", "");
				mymenuService.edit(pd);				//存入数据库
			}
		}
		List<PageData>	varList = mymenuService.listAll(pd);
		PageData wxpd = new PageData();
		wxpd = keyService.findByWxId(pd);
		int status = MenuUtil.createMenu(MenuUtil.getMenu(varList), wxpd.getString("APPID"), wxpd.getString("APPSECRET"));//生成微信菜单
		pd.put("status", status);
		mv.setViewName("weixin/mymenu/mymenu_edit");
		mv.addObject("pd", pd);
		mv.addObject("varList", varList);
		return mv;
	}
	
	/**判断是不是没设置此菜单
	 * @param value
	 * @return
	 */
	public boolean isNull(String value){
		return "".equals(value.replaceAll(",fh,", "").trim());
	}
	
	//=========================以下废弃（代码生成器生成的）
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增MyMenu");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("MYMENU_ID", this.get32UUID());	//主键
		pd.put("WXUSERNAME", "");	//公众号
		pd.put("USERNAME", "");	//用户名
		pd.put("TITLE", "");	//菜单名称
		pd.put("TYPE", "");	//类型
		pd.put("CONTENT", "");	//指向
		pd.put("XID", "");	//XID
		mymenuService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除MyMenu");
		PageData pd = new PageData();
		pd = this.getPageData();
		mymenuService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改MyMenu");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mymenuService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表MyMenu");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = mymenuService.list(page);	//列出MyMenu列表
		mv.setViewName("weixin/mymenu/mymenu_list");
		mv.addObject("varList", varList);
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
		mv.setViewName("weixin/mymenu/mymenu_edit");
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
		pd = mymenuService.findById(pd);	//根据ID读取
		mv.setViewName("weixin/mymenu/mymenu_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除MyMenu");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			mymenuService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出MyMenu到excel");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("公众号");	//1
		titles.add("用户名");	//2
		titles.add("菜单名称");	//3
		titles.add("类型");	//4
		titles.add("指向");	//5
		titles.add("XID");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = mymenuService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("WXUSERNAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("USERNAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("TITLE"));	    //3
			vpd.put("var4", varOList.get(i).getString("TYPE"));	    //4
			vpd.put("var5", varOList.get(i).getString("CONTENT"));	    //5
			vpd.put("var6", varOList.get(i).getString("XID"));	    //6
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
