package com.fh.service.bike.bikeridetm;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/** 
 * 说明： 时间段接口
 * 创建人：
 * 创建时间：2018-07-04
 * @version
 */
public interface BikeRideTmManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> datalistPage(Page page)throws Exception;
	
	/**列表(全部)
	 * @throws Exception
	 */
	public List<PageData> listAll()throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

}

