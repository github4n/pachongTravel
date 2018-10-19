import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class TestMobile {

	/* 测试手机号码是来自哪个城市的，利用拍拍网的API
     * @param mobileNumber 手机号码
     * @return
     * @throws MalformedURLException
     */
     public static String calcMobileCity(String mobileNumber) throws MalformedURLException{

    	 String jsonString = null;
         JSONArray array = null;
         JSONObject jsonObject = null;
         //获取拍拍网的API地址
         String urlString = "http://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel="+mobileNumber;
         StringBuffer sb = new StringBuffer();
         BufferedReader buffer;
         URL url = new URL(urlString);
         try{
        	 //获取URL地址中的页面内容
             InputStream in = url.openStream();
             // 解决乱码问题
             buffer = new BufferedReader(new InputStreamReader(in,"gb2312"));
             String line = null;
             //一行一行的读取数据
             while((line = buffer.readLine()) != null){
                 sb.append(line);
             }
             in.close();
             buffer.close();
             // System.out.println(sb.toString());
             jsonString = sb.toString();
            // 替换掉“getPhoneNumInfoExtCallback(，);<!--[if !IE]>|xGv00|6741027ad78d9b06f5642b25ebcb1536<![endif]-->”，让它能转换为JSONArray对象
             jsonString = jsonString.replace("getPhoneNumInfoExtCallback(", "[");
             jsonString = jsonString.replace(");<!--[if !IE]>|xGv00|6741027ad78d9b06f5642b25ebcb1536<![endif]-->", "]");
             // 把jsonString转化为json对象
             array = JSONArray.fromObject(jsonString); 
             // 获取JSONArray的JSONObject对象，便于读取array里的键值对
             jsonObject = array.getJSONObject(0);        
             
         }catch(Exception e){
             e.printStackTrace();
         }
         //从JSONObject对象中读取城市名称
         return jsonObject.getString("province");
    }
     
	public static void main(String[] args) {
		TestMobile t = new TestMobile();
		try {
			System.out.println(t.calcMobileCity("13046643776"));
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
