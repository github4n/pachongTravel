package com.fh.service.person.persontrade.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.person.persontrade.PersonTradeManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： 消费分析
 * 创建人：
 * 创建时间：2018-09-05
 * @version
 */
@Service("persontradeService")
public class PersonTradeService implements PersonTradeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<PageData> consumerIndexList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("consumerIndexList",page);
	}

	@Override
	public List<PageData> spendingTimeList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("spendingTimeList",page);
	}

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PersonTradeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PersonTradeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PersonTradeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonTradeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonTradeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonTradeMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PersonTradeMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

