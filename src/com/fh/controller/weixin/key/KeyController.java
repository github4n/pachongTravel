package com.fh.controller.weixin.key;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.weixin.key.KeyManager;
import com.fh.service.weixin.mymenu.MyMenuManager;

/** 
 * 说明：公众平台Key信息
 * 创建人：
 * 创建时间：2016-10-30
 */
@Controller
@RequestMapping(value="/key")
public class KeyController extends BaseController {
	
	String menuUrl = "key/list.do"; //菜单地址(权限用)
	@Resource(name="keyService")
	private KeyManager keyService;
	@Resource(name="mymenuService")
	private MyMenuManager mymenuService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Key");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("KEY_ID", this.get32UUID());	//主键
		pd.put("ACCESS_TOKEN", "");	//access_token
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		keyService.save(pd);
		
		pd.put("TITLE", "");	//菜单名称
		pd.put("TYPE", "");		//类型
		pd.put("CONTENT", "");	//指向
		int m=1;
		for(int i=1;i<19;i++){
			pd.put("MYMENU_ID", this.get32UUID());	//主键
			if(i<4){
				pd.put("XID", "M"+m);		//XID
				m++;
			}
			if(i==4 || i == 9 || i == 14)m=1;
			if(i>3 && i < 9){
				pd.put("XID", "M1"+m);		//XID
				m++;
			}
			if(i>8 && i < 14){
				pd.put("XID", "M2"+m);		//XID
				m++;
			}
			if(i>13 && i < 19){
				pd.put("XID", "M3"+m);		//XID
				m++;
			}
			mymenuService.save(pd);
		}
		
		
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Key");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = keyService.findById(pd);
		keyService.delete(pd);		//删除主
		mymenuService.delete(pd);	//删除菜单
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Key");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		keyService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Key");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = keyService.list(page);	//列出Key列表
		mv.setViewName("weixin/key/key_list");
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
		mv.setViewName("weixin/key/key_edit");
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
		pd = keyService.findById(pd);	//根据ID读取
		mv.setViewName("weixin/key/key_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
