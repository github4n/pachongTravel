package com.fh.service.person.personactivity.impl;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.person.personactivity.PersonActivityManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/** 
 * 说明： person
 * 创建人：
 * 创建时间：2018-08-07
 * @version
 */
@Service("personactivityService")
public class PersonActivityService implements PersonActivityManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PersonActivityMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("PersonActivityMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PersonActivityMapper.edit", pd);
	}


	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonActivityMapper.datalistPage", page);
	}

	@Override
	public int listUserTotal(Page page) throws Exception {
        Object listUserTotal = dao.findForObject("listUserTotal", page);
        if(listUserTotal !=null){
            return (int) listUserTotal;
        }else{
            return 0;
        }

	}

	@Override
	public int listNewUser(Page page) throws Exception {
        Object listNewUser = dao.findForObject("listNewUser", page);
        if(listNewUser !=null){
            return (int) listNewUser;
        }else{
            return 0;
        }
	}

	@Override
	public List<PageData> listActivity(Page page) throws Exception {
		return (List<PageData>) dao.findForList("listActivity",page);
	}

	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PersonActivityMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PersonActivityMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("PersonActivityMapper.deleteAll", ArrayDATA_IDS);
	}


	
}

