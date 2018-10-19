package com.fh.service.otatour.tourchartday.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.otatour.tourchartday.TourChartDayManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： OTA客流量总览按天
 * 创建人：
 * 创建时间：2018-07-03
 * @version
 */
@Service("tourchartdayService")
public class TourChartDayService implements TourChartDayManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("TourChartDayMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("TourChartDayMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("TourChartDayMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TourChartDayMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TourChartDayMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TourChartDayMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("TourChartDayMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> tourChartDay(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TourChartDayMapper.tourChartDay", page);
	}

	@Override
	public String tourNumDay(Page page) throws Exception {
        Object forObject = dao.findForObject("TourChartDayMapper.tourNumDay", page);
        if(forObject!=null){
            return  forObject.toString();
        }
        return "";
	}

	@Override
	public String tourNumDayl(Page page) throws Exception {
        Object forObject = dao.findForObject("TourChartDayMapper.tourNumDayl", page);
        if(forObject!=null){
            return  forObject.toString();
        }
        return "";

	}

	@Override
	public List<PageData> tourChartByDay(Page page) throws Exception {
		return (List<PageData>)dao.findForList("TourChartDayMapper.tourChartByDay", page);
	}

}

