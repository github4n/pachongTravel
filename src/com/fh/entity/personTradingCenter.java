package com.fh.entity;

/**
 * @Description 数据交易实体类
 * @Author liuzhi
 * @Date2018/9/11 16:31
 **/

public class personTradingCenter {

    private int id;
    private String mobile;
    private String xid;
    private String age;
    private String gender;
    private String area;
    private String  culturalLevel;
    private String maritalStatus;
    private String isChild;
    private String assetIndex;
    private String consumerIndex;
    private String  tourismCharacteristics;
    private String typeAccessDurationName ;
    private String typeAccessDurationType;
    private int typeAccessDuration;


    public personTradingCenter(int id, String mobile, String xid, String age, String gender, String area, String culturalLevel, String maritalStatus, String isChild, String assetIndex, String consumerIndex, String tourismCharacteristics, String typeAccessDurationName, String typeAccessDurationType, int typeAccessDuration) {
        this.id = id;
        this.mobile = mobile;
        this.xid = xid;
        this.age = age;
        this.gender = gender;
        this.area = area;
        this.culturalLevel = culturalLevel;
        this.maritalStatus = maritalStatus;
        this.isChild = isChild;
        this.assetIndex = assetIndex;
        this.consumerIndex = consumerIndex;
        this.tourismCharacteristics = tourismCharacteristics;
        this.typeAccessDurationName = typeAccessDurationName;
        this.typeAccessDurationType = typeAccessDurationType;
        this.typeAccessDuration = typeAccessDuration;
    }

    public personTradingCenter() {
        this.xid = xid;
        this.gender = gender;
        this.age = age;
        this.isChild = isChild;
        this.maritalStatus = maritalStatus;

    }

    public personTradingCenter(String xid) {
        this.xid = this.xid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getXid() {
        return xid;
    }

    public void setXid(String xid) {
        this.xid = xid;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCulturalLevel() {
        return culturalLevel;
    }

    public void setCulturalLevel(String culturalLevel) {
        this.culturalLevel = culturalLevel;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getIsChild() {
        return isChild;
    }

    public void setIsChild(String isChild) {
        this.isChild = isChild;
    }

    public String getAssetIndex() {
        return assetIndex;
    }

    public void setAssetIndex(String assetIndex) {
        this.assetIndex = assetIndex;
    }

    public String getConsumerIndex() {
        return consumerIndex;
    }

    public void setConsumerIndex(String consumerIndex) {
        this.consumerIndex = consumerIndex;
    }

    public String getTourismCharacteristics() {
        return tourismCharacteristics;
    }

    public void setTourismCharacteristics(String tourismCharacteristics) {
        this.tourismCharacteristics = tourismCharacteristics;
    }

    public String getTypeAccessDurationName() {
        return typeAccessDurationName;
    }

    public void setTypeAccessDurationName(String typeAccessDurationName) {
        this.typeAccessDurationName = typeAccessDurationName;
    }

    public String getTypeAccessDurationType() {
        return typeAccessDurationType;
    }

    public void setTypeAccessDurationType(String typeAccessDurationType) {
        this.typeAccessDurationType = typeAccessDurationType;
    }

    public int getTypeAccessDuration() {
        return typeAccessDuration;
    }

    public void setTypeAccessDuration(int typeAccessDuration) {
        this.typeAccessDuration = typeAccessDuration;
    }


}
