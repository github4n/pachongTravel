package com.fh.service.bike.bikemonth.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.bike.bikemonth.BikeMonthManager;

/** 
 * 说明： 总体分析
 * 创建人：
 * 创建时间：2018-07-04
 * @version
 */
@Service("bikemonthService")
public class BikeMonthService implements BikeMonthManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("BikeMonthMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("BikeMonthMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("BikeMonthMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BikeMonthMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BikeMonthMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BikeMonthMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BikeMonthMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> rideNumBydate(Page page) throws Exception {
		return (List<PageData>)dao.findForList("BikeMonthMapper.rideNumBydate", page);
	}

	@Override
	public List<PageData> rideNumTotal(Page page) throws Exception {
		return (List<PageData>)dao.findForList("BikeMonthMapper.rideNumTotal", page);
	}
	
}

