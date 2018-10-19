package com.fh.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class OtaUtil {
	
	/**
	 * 根据传入的参数类型，返回开始日期
	 * @param type (0:当日；1：昨日；2：当月；3：上月；4：当年；5：去年；6：历史
	 * @return
	 */
	public String getStartDateStr(String type){
		String startDate = "";
		
		if("0".equals(type)){
			startDate = this.getTodayStr();
		}else if("1".equals(type)){
			startDate = this.getYesterdayStr();
		}else if("2".equals(type)){
			startDate = this.getFirstDayofMonth();
		}else if("3".equals(type)){
			startDate = this.getFirstDayofLastMonth();
		}else if("4".equals(type)){
			startDate = this.getFirstDayofYear();
		}else if("5".equals(type)){
			startDate = this.getFirstDayofLastYear();
		}else if("6".equals(type)){
			startDate = this.getStartDate();
		}else{
			startDate = this.getStartDate();
		}
		
		return startDate;
	}
	
	public String getEndDateStr(String type){
		String endDate = "";
		
		if("0".equals(type)){
			endDate = this.getTodayStr();
		}else if("1".equals(type)){
			endDate = this.getYesterdayStr();
		}else if("2".equals(type)){
			endDate = this.getTodayStr();
		}else if("3".equals(type)){
			endDate = this.getFirstDayofMonth();
		}else if("4".equals(type)){
			endDate = this.getTodayStr();
		}else if("5".equals(type)){
			endDate = this.getFirstDayofYear();
		}else if("6".equals(type)){
			endDate = this.getTodayStr();
		}else{
			endDate = this.getTodayStr();
		}
		
		return endDate;
	}

	public String getStartDateS(String type){
		String startDate = "";

		if("1".equals(type)){
			startDate = this.getTodayStr();
		}else if("2".equals(type)){
			startDate = this.getOneWeek();
		}else if("3".equals(type)){
			startDate = this.getOneMonth();
		}


		return startDate;
	}
	public String getEndDateS(String type){
		String endDate = "";

		if("1".equals(type)){
			endDate = this.getTodayEnd();
		}else if("2".equals(type)){
			endDate = this.getTodayEnd();
		}else if("3".equals(type)){
			endDate = this.getTodayEnd();
		}
		return endDate;
	}

	public String getTodayStr(){
		Calendar now = Calendar.getInstance();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		return smf.format(now.getTime());
	}
	public String getTodayEnd(){
		Calendar now = Calendar.getInstance();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		return smf.format(now.getTime());
	}
	public String getOneWeek(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.add(Calendar.DATE, - 7);
		Date d = c.getTime();
		String day = format.format(d);
		return day;
	}
	public String getOneMonth(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.add(Calendar.MONTH, -1);
		Date m = c.getTime();
		String mon = format.format(m);
		return mon;
	}



	public String getYesterdayStr(){
		Calendar yesterday = Calendar.getInstance();
		yesterday.add(Calendar.DATE, -1);
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		
		return smf.format(yesterday.getTime());
	}
	
	public String getFirstDayofMonth(){
		Calendar firstDayofMonth = Calendar.getInstance();
		firstDayofMonth.set(Calendar.DAY_OF_MONTH, 1);
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		
		return smf.format(firstDayofMonth.getTime());
	}
	
	public String getFirstDayofLastMonth(){
		Calendar firstDayofLastMonth = Calendar.getInstance();
		firstDayofLastMonth.add(Calendar.MONTH, -1);
		firstDayofLastMonth.set(Calendar.DAY_OF_MONTH, 1);
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		
		return smf.format(firstDayofLastMonth.getTime());
	}
	
	public String getFirstDayofYear(){
		Calendar firstDayofYear = Calendar.getInstance();
		firstDayofYear.set(Calendar.DAY_OF_YEAR, 1);
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		
		return smf.format(firstDayofYear.getTime());
	}
	
	public String getFirstDayofLastYear(){
		Calendar firstDayofLastYear = Calendar.getInstance();
		firstDayofLastYear.add(Calendar.YEAR, -1);
		firstDayofLastYear.set(Calendar.DAY_OF_YEAR, 1);
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		
		return smf.format(firstDayofLastYear.getTime());
	}
	
	public String getStartDate(){
		Calendar startDate = Calendar.getInstance();
		startDate.add(Calendar.YEAR, -2);
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		
		return smf.format(startDate.getTime());
	}

	public static void main(String[] args) {
		OtaUtil util = new OtaUtil();
		
//		System.out.println("getTodayStr:"+util.getTodayStr());
//		System.out.println("getYesterdayStr"+util.getYesterdayStr());
//		System.out.println("getFirstDayofMonth"+util.getFirstDayofMonth());
//		System.out.println("getFirstDayofLastMonth"+util.getFirstDayofLastMonth());
//		System.out.println("getFirstDayofYear"+util.getFirstDayofYear());
//		System.out.println("getFirstDayofLastYear"+util.getFirstDayofLastYear());

		String type = "0";
		if("0".equals(type)){
			System.out.println("haha");
		}
	}

}
