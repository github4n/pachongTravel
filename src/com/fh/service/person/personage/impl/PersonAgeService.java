package com.fh.service.person.personage.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.person.personage.PersonAgeManager;

/** 
 * 说明： age
 * 创建人：
 * 创建时间：2018-08-07
 * @version
 */
@Service("personageService")
public class PersonAgeService implements PersonAgeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PersonAgeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PersonAgeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PersonAgeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonAgeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonAgeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonAgeMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PersonAgeMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> ageChart(Page page) throws Exception {
		return (List<PageData>)dao.findForList("PersonAgeMapper.ageChart", page);
	}

	@Override
	public List<PageData> genderChart(Page page) throws Exception {
		return (List<PageData>)dao.findForList("PersonAgeMapper.genderChart", page);
	}

	@Override
	public List<PageData> ageGenderChart(Page page) throws Exception {
		return (List<PageData>)dao.findForList("PersonAgeMapper.ageGenderChart", page);
	}
	
}

