package com.fh.service.person.personactivity;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/** 
 * 说明： person接口
 * 创建人：
 * 创建时间：2018-08-07
 * @version
 */
public interface PersonActivityManager{

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
	public List<PageData> list(Page page)throws Exception;


	/*
		查询用户总数
	 */
	public int listUserTotal(Page page)throws Exception;
	public int listNewUser(Page page)throws Exception;
	public List<PageData> listActivity(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
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

