import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import net.sf.json.JSONObject;


public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/**
		Calendar now = Calendar.getInstance();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(smf.format(now.getTime()));
		Calendar seven = Calendar.getInstance();
		seven.add(Calendar.DATE, -7);
		System.out.println(smf.format(seven.getTime()));
		*/
		
		/**
		Calendar now = Calendar.getInstance();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM");
		System.out.println(smf.format(now.getTime()));
		Calendar seven = Calendar.getInstance();
		seven.add(Calendar.MONTH, -7);
		System.out.println(smf.format(seven.getTime()));
		*/
		/**
		Calendar now = Calendar.getInstance();
		SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		now.add(Calendar.YEAR, 0);
		now.set(Calendar.DAY_OF_YEAR, 1);
		String firstday=smf.format(now.getTime());
		System.out.println(firstday);
		*/
		
	}

}
