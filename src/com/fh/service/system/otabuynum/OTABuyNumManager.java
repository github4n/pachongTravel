package com.fh.service.system.otabuynum;

import com.fh.util.PageData;

import java.util.List;

public interface OTABuyNumManager {

    /**获取每天各大平台的售票总数
     * @param value
     * @return
     * @throws Exception
     */

    public List<PageData> getOtaBumSum(String value)throws Exception;
}
