
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.dahantc.api.sms.json.JSONHttpClient;
import com.fh.util.jdbcDbCon;

public class PersonAlarm {
	private static final Logger LOG = Logger.getLogger(PersonAlarm.class);
	private static String account = "dh82501";// 用户名（必填）
	private static String password = "DgJX3zC3";// 密码（必填,明文）
//	private static String phone = "13636572522"; // 手机号码（必填,多条以英文逗号隔开）
	public static String sign = "【爬虫旅游】"; // 短信签名（必填）
	public static String subcode = ""; // 子号码（可选）
	public static String msgid = UUID.randomUUID().toString().replace("-", ""); // 短信id，查询短信状态报告时需要，（可选）
	public static String sendtime = ""; // 定时发送时间（可选）

    public void personAlarm(int personNum) throws Exception {
    	//根据传入的参数（实时在园人数）判断是否发送人流量报警信息
    	int num = personNum;
        Connection con = jdbcDbCon.conn();//获取连接
        String sql = "select phone, spotId from sys_alarm_person";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();//返回2维结果集ResultSet
        while (rs.next()) {
        	
            //String mobile = rs.getString("mobile");//获取第二个列的值 编号 name
            String phone = rs.getString("phone");//获取第三列的值 编号age
            int spotId = rs.getInt("spotId");
            System.out.println("phone:"+phone+",spotID:"+spotId);
            
            //判断是否达到报警阈值spotId
            this.sendAlarm(num, phone, spotId);
        }
    }
    
    public void sendAlarm(int personNum, String phone, int spotId){
    	//根据在园人数判断是否需要发送报警
    	if(personNum > spotId){
    		sendSmsAlarm(phone, personNum);
    	}
    }
    
    public void sendSmsAlarm(String telphone, int personNum){
    	String phone = telphone; // 手机号码（必填,多条以英文逗号隔开）
    	try {
			String content = "香草园在园人数达到预警值，请关注，目前在园人数为："+personNum;// 短信内容（必填）
			JSONHttpClient jsonHttpClient = new JSONHttpClient("http://www.dh3t.com");
			jsonHttpClient.setRetryCount(1);
			String sendhRes = jsonHttpClient.sendSms(account, password, phone, content, sign, subcode);
			LOG.info("提交单条普通短信响应：" + sendhRes);

		} catch (Exception e) {
			LOG.error("应用异常", e);
		}
    }
	
	public static void main(String[] args) {
		try {
			new PersonAlarm().personAlarm(16);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
