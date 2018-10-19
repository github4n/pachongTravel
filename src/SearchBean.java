
public class SearchBean {
	private String begintime;
	private String deviceid;
	private String endtime;
	private int domain;
	private int channelid;
	private String devicename;
	public SearchBean(String deviceid) {
		super();
		this.deviceid = deviceid;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getDeviceid() {
		return deviceid;
	}
	public void setDeviceid(String deviceid) {
		this.deviceid = deviceid;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public int getDomain() {
		return domain;
	}
	public void setDomain(int domain) {
		this.domain = domain;
	}
	public int getChannelid() {
		return channelid;
	}
	public void setChannelid(int channelid) {
		this.channelid = channelid;
	}
	public String getDevicename() {
		return devicename;
	}
	public void setDevicename(String devicename) {
		this.devicename = devicename;
	}
	
	
}
