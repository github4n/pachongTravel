package com.fh.service.bike.bikearea;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/** 
 * 说明： 轨迹分析接口
 * 创建人：
 * 创建时间：2018-07-04
 * @version
 */
public interface BikeAreaManager{


	
	/**加载列表
	 * @param
	 * @throws Exception
	 */
	public List<PageData> localListPage()throws Exception;

	/**
	 * 查询起点名称
	 * @return
	 * @throws Exception
	 */
	public List<PageData>selectPentPark() throws Exception;

	/**
	 * 查询返回停车名称
	 * @return
	 * @throws Exception
	 */
	public List<PageData>selectReturnPark() throws Exception;
	
	/**根据时间查询列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> selectListByDate(Page page)throws Exception;
	

	
}

