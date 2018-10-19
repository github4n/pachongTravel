package com.fh.service.otatour.tourchartmonth.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.otatour.tourchartmonth.TourChartMonthManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： OTA客流量总览按月
 * 创建人：
 * 创建时间：2018-07-03
 * @version
 */
@Service("tourchartmonthService")
public class TourChartMonthService implements TourChartMonthManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("TourChartMonthMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("TourChartMonthMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("TourChartMonthMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TourChartMonthMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TourChartMonthMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TourChartMonthMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("TourChartMonthMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> tourChartMonth(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TourChartMonthMapper.tourChartMonth", page);
	}

	@Override
	public List<PageData> tourNumMonth(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TourChartMonthMapper.tourNumMonth", page);
	}

	@Override
	public List<PageData> tourChartMonths(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TourChartMonthMapper.tourChartMonths", page);
	}

	@Override
	public List<PageData> threeMonthsList(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TourChartMonthMapper.threeMonthsList", page);
	}

}

