import java.net.URI;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.fh.util.jdbcDbCon;

public class PersonCalculate {
	private static String REST_API = "http://106.15.108.60:8080/api/v1";
	
	 public static void main(String[] args) throws Exception {
		 final PersonCalculate cal = new PersonCalculate();
			TimerTask task = new TimerTask(){

				@Override
				public void run() {
					cal.taskCal();
				}
				
			};
			Timer timer = new Timer();
			long delay = 0;
			long intervalPeriod = 15 * 1000;
			timer.scheduleAtFixedRate(task, delay, intervalPeriod);
		 
	 }
	 
	 
	 public static void main2(String[] args) throws Exception {
		 PersonCalculate cal = new PersonCalculate();
		 cal.loginBean();
	 }
	 
	 public String getAuth() throws SQLException{
		 Connection con = jdbcDbCon.conn();//获取连接
	        String sql = "select name, value from sys_config where name='Authorization'";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        ResultSet rs = pstmt.executeQuery();//返回2维结果集ResultSet
	        String auth = "";
	        while (rs.next()) {

	            //String mobile = rs.getString("mobile");//获取第二个列的值 编号 name
	            String name = rs.getString("name");//获取第三列的值 编号age
	            String value = rs.getString("value");
	            
	            //判断是否达到报警阈值spotId
	            auth = value;
	        }
	        return auth;
	 }
	 
	 
	 public void taskCal(){
		 PersonCalculate cal = new PersonCalculate();
		 PersonAlarm alarm = new PersonAlarm();
		 
		 String begintime = cal.getBeginTime();
		 String endtime = cal.getNowTime();
		 int inParkNum;
		try {
			String auth = cal.getAuth();
			
			System.out.println(auth);
			
			inParkNum = cal.counting(auth, begintime, endtime);
			alarm.personAlarm(inParkNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 }
	 
	 public String getNowTime(){
		 Calendar now = Calendar.getInstance();
		 SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 return smf.format(now.getTime());
	 }
	 
	 public String getBeginTime(){
		 Calendar now = Calendar.getInstance();
		 SimpleDateFormat smf = new SimpleDateFormat("yyyy-MM-dd");
		 return smf.format(now.getTime()) + " 07:00:00";
	 }
	
	public String loginBean() throws Exception {
		  HttpClient httpClient = new DefaultHttpClient();
		  LoginBean entity = new LoginBean(0, "admin", "123456");
		  ObjectMapper mapper = new ObjectMapper();
		 
		  HttpPost request = new HttpPost(REST_API + "/login");
		  request.setHeader("Content-Type", "application/json");
		  request.setHeader("Accept", "application/json");
		  request.setHeader("Authorization", "app");
		  StringEntity requestJson = new StringEntity(mapper.writeValueAsString(entity), "utf-8");
		  requestJson.setContentType("application/json");
		  request.setEntity(requestJson);
		  HttpResponse response = httpClient.execute(request);
		  String json = EntityUtils.toString(response.getEntity());
		  JSONObject jsonObject = new JSONObject(json);
		  String auth = "Token "+jsonObject.getString("token");
		  return auth;
	}
	
	 public int counting(String auth, String begintime, String endtime) throws Exception {
		  HttpClient httpClient = new DefaultHttpClient();
		  String url = REST_API + "/ai/counting";
		  HttpGet request = new HttpGet();
		  request.setHeader("Content-Type", "application/json");
		  request.setHeader("Accept", "application/json");
		  request.setHeader("Authorization", auth);

		  Map<String, String> paramMap = new HashMap();
		  paramMap.put("domain", "1");
		//  paramMap.put("deviceid", "1100001000028");
		//  paramMap.put("devicename", "3");
		  paramMap.put("begintime", begintime);
		  paramMap.put("endtime", endtime);

		  List<NameValuePair> formparams = setHttpParams(paramMap);
		  String param = URLEncodedUtils.format(formparams, "UTF-8");
		  request.setURI(URI.create(url + "?" + param));
		  
		  HttpResponse response = httpClient.execute(request);
		  
		  String json = EntityUtils.toString(response.getEntity());
		  return getPersonInParkAll(json);
		  
		 }
	 
	 public void transJson(String jsonString){
		 List list = new ArrayList();
		 
		 try {
			JSONArray jsonArray = new JSONArray(jsonString);
			for(int i=0; i<jsonArray.length(); i++){
				list.add(jsonArray.getString(i));
			}
			
			System.out.println("解析结果是："+list);
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
	 }
//	 
//	 public void calPerson(String jsonString){
//		 List list = new ArrayList();
//		 int inPerson = 0;
//		 int outPerson = 0;
//		 try {
//			JSONArray jsonArray = new JSONArray(jsonString);
//			for(int i=0; i<jsonArray.length(); i++){
//				JSONObject jObject = jsonArray.getJSONObject(i);
//				int count = jObject.getInt("flownum");
//				String deviceId = jObject.getString("deviceid");
//				if(jObject.getInt("triggertype")==1){
//					//进门
//					if(deviceId.equals("1100001000019") || deviceId.equals("1100001000024") 
//							||deviceId.equals("1100001000028")|| deviceId.equals("1100001000030")
//							|| deviceId.equals("1100001000032")|| deviceId.equals("1100001000034")
//							|| deviceId.equals("1100001000036")|| deviceId.equals("1100001000038")){
//						
//						inPerson += count;
//					}
//				}else if(jObject.getInt("triggertype")==2){
//					//出门
//					if(deviceId.equals("1100001000040")){
//						
//						outPerson += count;
//					}
//				}
//				
//			}
//			System.out.println("进门人数为："+inPerson+",出门人数为："+outPerson+",在园人数为："+(inPerson-outPerson));
//			
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
//	 }
//	 
//	 
//	 public void calPersonAll(String jsonString){
//		 List list = new ArrayList();
//		 int inPerson = 0;
//		 int outPerson = 0;
//		 try {
//			JSONArray jsonArray = new JSONArray(jsonString);
//			for(int i=0; i<jsonArray.length(); i++){
//				JSONObject jObject = jsonArray.getJSONObject(i);
//				int count = jObject.getInt("flownum");
//				String deviceId = jObject.getString("deviceid");
//				if(jObject.getInt("triggertype")==1){
//					//进门
//					inPerson += count;
//				}else if(jObject.getInt("triggertype")==2){
//					//出门
//					outPerson += count;
//				}
//				
//			}
//			System.out.println("进门人数为："+inPerson+",出门人数为："+outPerson);
//			
//		} catch (JSONException e) {
//			e.printStackTrace();
//		}
//	 }
	 
	 public int getPersonInPark(String jsonString){
		 List list = new ArrayList();
		 int inPerson = 0;
		 int outPerson = 0;
		 int inParkPerson = 0;
		 try {
			JSONArray jsonArray = new JSONArray(jsonString);
			for(int i=0; i<jsonArray.length(); i++){
				JSONObject jObject = jsonArray.getJSONObject(i);
				int count = jObject.getInt("flownum");
				if(jObject.getInt("triggertype")==1){
					//进门
					inPerson += count;
				}else if(jObject.getInt("triggertype")==2){
					//出门
					outPerson += count;
				}
				
			}
			
			
			if(outPerson<inPerson){
				inParkPerson = inPerson - outPerson;
			}else{
				inParkPerson = 0;
			}
		
			System.out.println("进门人数为："+inPerson+",出门人数为："+outPerson);
			
		} catch (JSONException e) {
			e.printStackTrace();
		}
		 
		 return inParkPerson;
	 }
	 
	 public int getPersonInParkAll(String jsonString){
		 List list = new ArrayList();
		 int inPerson = 0;
		 int outPerson = 0;
		 int inParkPerson = 0;
		 try {
			JSONArray jsonArray = new JSONArray(jsonString);
			for(int i=0; i<jsonArray.length(); i++){
				JSONObject jObject = jsonArray.getJSONObject(i);
				int count = jObject.getInt("flownum");
				String deviceId = jObject.getString("deviceid");
				if(jObject.getInt("triggertype")==1){
					//进门
					if(deviceId.equals("1100001000019") || deviceId.equals("1100001000024") 
							||deviceId.equals("1100001000028")|| deviceId.equals("1100001000030")
							|| deviceId.equals("1100001000032")|| deviceId.equals("1100001000034")
							|| deviceId.equals("1100001000036")|| deviceId.equals("1100001000038")){
						
						inPerson += count;
					}
				}else if(jObject.getInt("triggertype")==2){
					//出门
					if(deviceId.equals("1100001000040")){
						
						outPerson += count;
					}
				}
			if(outPerson<inPerson){
				inParkPerson = inPerson - outPerson;
			}else{
				inParkPerson = 0;
			}
		}
			System.out.println("进门人数为："+inPerson+",出门人数为："+outPerson+",在园人数为："+inParkPerson);
			
			//写数据表sys_config
//			this.writeInPerson(inParkPerson);
			this.writePersonAll(inParkPerson, inPerson, outPerson);
			
			
		 }catch (JSONException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
		 return inParkPerson;
	 }
	 
	 public void writeInPerson(int inParkPerson) throws SQLException{
		 Connection con = jdbcDbCon.conn();//获取连接
	     String sql = "update sys_config set value = '"+inParkPerson+"' where name = 'jrkl'";
	     PreparedStatement pstmt = con.prepareStatement(sql);
	     boolean rs = pstmt.execute();
	 }
	 
	 public void writePersonAll(int inParkPerson, int ryzrs, int lyzrs) throws SQLException{
		 Connection con = jdbcDbCon.conn();//获取连接
	     String sql1 = "update sys_config set value = ? where name = ?";
	     PreparedStatement pstmt = con.prepareStatement(sql1);
	     pstmt.setInt(1, inParkPerson);
	     pstmt.setString(2, "jrkl");
	     pstmt.addBatch();
	     
	     pstmt.setInt(1, ryzrs);
	     pstmt.setString(2, "ryzrs");
	     pstmt.addBatch();
	     
	     pstmt.setInt(1, lyzrs);
	     pstmt.setString(2, "lyzrs");
	     pstmt.addBatch();
	     
	     int[] rs = pstmt.executeBatch();
	 }
	 
	 private List<NameValuePair> setHttpParams(Map<String, String> paramMap) {
	     List<NameValuePair> formparams = new ArrayList<NameValuePair>();
	     Set<Map.Entry<String, String>> set = paramMap.entrySet();
	     for (Map.Entry<String, String> entry : set) {
	         formparams.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
	     }
	     return formparams;
	 }
}
