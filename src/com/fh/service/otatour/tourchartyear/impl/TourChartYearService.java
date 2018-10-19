package com.fh.service.otatour.tourchartyear.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.otatour.tourchartyear.TourChartYearManager;

/** 
 * 说明： OTA客流量总览总量
 * 创建人：
 * 创建时间：2018-07-03
 * @version
 */
@Service("tourchartyearService")
public class TourChartYearService implements TourChartYearManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("TourChartYearMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("TourChartYearMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("TourChartYearMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TourChartYearMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TourChartYearMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TourChartYearMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("TourChartYearMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> tourRatioDay(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TourChartYearMapper.tourRatioDay", page);
	}

	@Override
	public List<PageData> tourRatioTotal(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TourChartYearMapper.tourRatioTotal", page);
	}
	
}

