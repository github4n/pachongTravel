package com.fh.service.bike.bikearea.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.bike.bikearea.BikeAreaManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 轨迹分析
 * 创建人：
 * 创建时间：2018-07-04
 * @version
 */
@Service("bikeareaService")
public class BikeAreaService implements BikeAreaManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	

	
	/**列表
	 * @param
	 * @throws Exception
	 */
	@Override
	public List<PageData> localListPage()throws Exception{
		return (List<PageData>)dao.findList("BikeAreaMapper.localListPage");
	}


	@Override
	public List<PageData> selectPentPark() throws Exception {
		return (List<PageData>)dao.findList("BikeAreaMapper.selectPentPark");
	}

	@Override
	public List<PageData> selectReturnPark() throws Exception {
		return (List<PageData>)dao.findList("BikeAreaMapper.selectReturnPark");
	}

	@Override
	public List<PageData> selectListByDate(Page page) throws Exception {
		return (List<PageData>) dao.findForList("BikeAreaMapper.selectListByDate",page);
	}

	
}

