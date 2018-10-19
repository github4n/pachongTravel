package com.fh.service.person.persontrade;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/** 
 * 说明： 消费分析接口
 * 创建人：
 * 创建时间：2018-09-05
 * @version
 */
public interface PersonTradeManager{


	/**
	 * 消费停留时长
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData>  consumerIndexList(Page page)throws Exception;

	/**
	 * 消费指数
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> spendingTimeList(Page page)throws Exception;

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

