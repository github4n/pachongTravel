package com.fh.service.system.otabuynum.impl;

import com.fh.dao.DaoSupport;
import com.fh.service.system.otabuynum.OTABuyNumManager;
import com.fh.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**类名称：AppuserService
 * @author FH Q313596790
 * 修改时间：2015年11月6日
 */
@Service("otaBuyNumService")
public class OTABuyNumService implements OTABuyNumManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	

	@Override
	public List<PageData> getOtaBumSum(String value) throws Exception {
		return (List<PageData>)dao.findForList("OTABuyNumMapper.getOtaBumSum", value);
	}
}

