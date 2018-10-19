package com.fh.controller.system.ota;

import com.fh.controller.base.BaseController;
import com.fh.entity.system.otaBuyNum;
import com.fh.service.system.otabuynum.OTABuyNumManager;
import com.fh.util.PageData;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value="/ota")
public class OTABuyNumController extends BaseController {
    @Resource(name="otaBuyNumService")
    private OTABuyNumManager otaBuyNumService;


    @RequestMapping(value="/otabuynumList")
    public ModelAndView otabuynumListPage() throws Exception{
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("system/otabuynum/otabuynumList");
        return mv;
    }

    @ResponseBody
    @RequestMapping(value="echarts")
    public List<PageData> otabuynumList (String regitertime) throws Exception{
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if(StringUtils.isBlank(regitertime)){
            regitertime=format.format(new Date());//如果没传日期就默认查询当天的数据
        }
        List<PageData> buyList = otaBuyNumService.getOtaBumSum(regitertime);//如果测试的话可以把regitertime换成"2018-04-18"
        return buyList;
    }
}
