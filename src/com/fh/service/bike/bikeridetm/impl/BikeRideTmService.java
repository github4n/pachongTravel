package com.fh.service.bike.bikeridetm.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.bike.bikeridetm.BikeRideTmManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 时间段
 * 创建人：
 * 创建时间：2018-07-04
 * @version
 */
@Service("bikeridetmService")
public class BikeRideTmService implements BikeRideTmManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("BikeRideTmMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("BikeRideTmMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("BikeRideTmMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> datalistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BikeRideTmMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll()throws Exception{
		return (List<PageData>)dao.findList("BikeRideTmMapper.listAll");

	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BikeRideTmMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BikeRideTmMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

