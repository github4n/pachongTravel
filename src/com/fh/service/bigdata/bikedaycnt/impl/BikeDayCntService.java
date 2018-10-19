package com.fh.service.bigdata.bikedaycnt.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.bigdata.bikedaycnt.BikeDayCntManager;

/** 
 * 说明： 大数据可视化
 * 创建人：
 * 创建时间：2018-06-27
 * @version
 */
@Service("bikedaycntService")
public class BikeDayCntService implements BikeDayCntManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("BikeDayCntMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("BikeDayCntMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("BikeDayCntMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BikeDayCntMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BikeDayCntMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BikeDayCntMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BikeDayCntMapper.deleteAll", ArrayDATA_IDS);
	}
	
	public List<PageData> timecntChart(Page page) throws Exception{
		return (List<PageData>)dao.findForList("BikeDayCntMapper.timecntChart", page);
	}

	@Override
	public List<PageData> timecntChartDate(Page page) throws Exception {
		return (List<PageData>)dao.findForList("BikeDayCntMapper.timecntChartDate", page);
	}

	@Override
	public List<PageData> timecntChartCnt(Page page) throws Exception {
		return (List<PageData>)dao.findForList("BikeDayCntMapper.timecntChartCnt", page);
	}
	
}

