package com.fh.service.person.personlabel.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.person.personlabel.PersonLabelManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： customer
 * 创建人：
 * 创建时间：2018-08-07
 * @version
 */
@Service("personlabelService")
public class PersonLabelService implements PersonLabelManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<String> selectMobileList() throws Exception {
		return (List<String>) dao.findList("selectMobileList");

	}

	@Override
	public PageData highQualityMaleGroup(Page page) throws Exception {
		return (PageData) dao.findForObject("highQualityMaleGroup",page);
	}

	@Override
	public PageData highQualityFemaleGroup(Page page) throws Exception {
		return (PageData) dao.findForObject("highQualityFemaleGroup",page);
	}

	@Override
	public PageData parentChildTourGroup(Page page) throws Exception {
		return (PageData) dao.findForObject("parentChildTourGroup",page);
	}

	@Override
	public PageData middleAgedTouristsGroup(Page page) throws Exception {
		return (PageData) dao.findForObject("middleAgedTouristsGroup",page);
	}

	@Override
	public PageData elderlyTouristsGroup(Page page) throws Exception {
		return (PageData) dao.findForObject("elderlyTouristsGroup",page);
	}

	@Override
	public PageData poorTravelGroup(Page page) throws Exception {
		return (PageData) dao.findForObject("poorTravelGroup",page);
	}

	@Override
	public PageData workplaceWhiteGroup(Page page) throws Exception {
		return  (PageData) dao.findForObject("workplaceWhiteGroup",page);
	}

	@Override
	public PageData studentGroup(Page page) throws Exception {
		return  (PageData) dao.findForObject("studentGroup",page);
	}

	@Override
	public PageData houseWifeGroup(Page page) throws Exception {
		return (PageData) dao.findForObject("houseWifeGroup",page);
	}

	@Override
	public PageData highEndPopulationGroup(Page page) throws Exception {
		return (PageData) dao.findForObject("highEndPopulationGroup",page);
	}

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PersonLabelMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PersonLabelMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PersonLabelMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonLabelMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonLabelMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonLabelMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PersonLabelMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

