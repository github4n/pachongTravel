package com.fh.service.person.personlabel;

import com.fh.entity.Page;
import com.fh.util.PageData;

import java.util.List;

/** 
 * 说明： customer接口
 * 创建人：
 * 创建时间：2018-08-07
 * @version
 */
public interface PersonLabelManager{



	public List<String> selectMobileList() throws Exception;



	/**
	 * 优质男性游客类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData highQualityMaleGroup(Page page)throws Exception;


	/**
	 * 优质女性游客类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData highQualityFemaleGroup(Page page)throws Exception;

	/**
	 * 亲子游类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData parentChildTourGroup(Page page)throws Exception;
	/**
	 * 中年游客类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData middleAgedTouristsGroup(Page page)throws Exception;
	/**
	 * 老年游客类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData elderlyTouristsGroup(Page page)throws Exception;
	/**
	 * 穷游类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData poorTravelGroup(Page page)throws Exception;
	/**
	 * 职场小白类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData workplaceWhiteGroup(Page page)throws Exception;
	/**
	 *  学生类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData studentGroup(Page page)throws Exception;
	/**
	 *  家庭主妇类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData houseWifeGroup(Page page)throws Exception;

	/**
	 *  高端类群
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public PageData highEndPopulationGroup(Page page)throws Exception;



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

