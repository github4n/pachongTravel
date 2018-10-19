package com.fh.util;

import com.fh.entity.personTradingCenter;
import com.fh.entity.spendingTime;
import org.apache.commons.lang.StringUtils;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description 交易中心数据解析
 * @Author
 * @Date2018/9/10 15:17
 **/

public class TradingCenterDataAnalysisUtil {

    //0000161_JON20180831000000727_ID010105_20180905175500_0000.SOURCE
    private static final String FILE_IN = "E:/0000161_JON20180831000000727_ID010105_20180905175500_0000.SOURCE";
    public static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    private static final CallableStatement cs = null;

    public static void main(String[] args) throws Exception {

//        String filePath = "E:/0000161_JON20180831000000718_ID010105_20180910103100_0000.SOURCE";
        String tempString="|@|上海市|@|综合电商\u000B手机淘宝\u0001982|@|null|@|中";

        List<String> strings = fTM();
        List<String> strings2 = fTM2();
        List<personTradingCenter> personTradingCenters = selectListSql();
        personTradingCenter ptc =null;
        spendingTime st=null;

//        for (String p : strings){
//            System.out.println(p);
//        }

        //1   AAABAQAAAAVsNdPLS6VHHv3eetSFb83ZmaPnNFM/gVrlwjmHZ01iwoFu2FE=  酷我音乐19
        //2   AAABAQAAAAVsNdPLS6VHHv3eetSFb83ZmaPnNFM/gVrlwjmHZ01iwoFu2FE= 墨迹天气58
        // |@|在线音乐19天气服务58



  //      解析一类标签
//        for (personTradingCenter p : personTradingCenters){//获取数据库的xid
//            System.out.println("p.getXid()"+p.getXid());
//            for (String ss:strings){//获取txt的xid
//                String[] split = ss.split("\\|");
//                for (int i=0;i<split.length;i++){
//                    if(split[0].equals(p.getXid())){
//                        ptc= new personTradingCenter();
//                        ptc.setXid(split[0]);
//                        ptc.setGender(split[1]);
//                        ptc.setAge(split[2]);
//                        ptc.setIsChild(split[3]);
//                        ptc.setMaritalStatus(split[4]);
//                        update1Sql(ptc);
//                    }
//                }
//            }
//        }




//        //      解析二类标签
//        String[] split1;
//        for (personTradingCenter p : personTradingCenters){//获取数据库的xid
//           System.out.println("p.getXid()"+p.getXid());
//            for (String str:strings){//获取txt的xid
//                String[] split = str.split("\\|");
//                for (int i=0;i<split.length;i++){
//                    if(split[0].equals(p.getXid())){
//                        ptc= new personTradingCenter();
//                        ptc.setXid(split[0]);
//                        ptc.setArea(split[1]);
//                        ptc.setTypeAccessDurationName(split[2]);
//                        ptc.setTourismCharacteristics(split[3]);
//                        ptc.setConsumerIndex(split[4]);
//                        update2Sql(ptc);
//                    }
//                }
//            }
//        }
//
//        System.out.println("strings"+strings.size());
//
//    }



        //      解析三类标签

            for (String str:strings2){//获取txt的xid
                st=new spendingTime();
                String[] split = str.split("\\|");
                for (int i=0;i<split.length;i++){
                    String slt1 = split[1];
                    String[] split1 = slt1.split("\\#");
                        for (int j=0;j<split1.length;j++){
                            String sp = split1[j];
                            String[] split2 = sp.split("\\,");
                            for (int k=0;k<split2.length;k++){
                                st.setXid(split[0]);
                                st.setSpendingTimeName(split2[0]);
                                st.setSpendingTimeNumber(split2[1]);
                                insertSql(st);
                                break;
                            }

                        }
                    break;
                }
            }




//        for (String str:strings){//获取txt的xid
//            st=new spendingTime();
//            String[] split = str.split("\\|");
//            for (int i=0;i<split.length;i++){
//                String slt1 = split[2];
//                String[] split1 = slt1.split("\\#");
//
//                for (int j=0;j<split1.length;j++){
//                    String sp = split1[j];
//                    String[] split2 = sp.split("\\,");
//                    for (int k=0;k<split2.length;k++){
//                        st.setXid(split[0]);
//                        st.setSpendingTimeName(split2[0]);
//                        st.setSpendingTimeNumber(split2[1]);
//                        insertSql(st);
//                        break;
//                    }
//
//                }
//                break;
//            }
//        }






//        String slt2 = split[2];
//        String[] spli1 = slt1.split("\\#");
//
//        for (int j=0;j<spli1.length;j++){
//            String sp = spli1[j];
//            String[] spli2 = sp.split("\\,");
//            for (int k=0;k<spli2.length;k++){
//                st.setXid(split[0]);
//                st.setSpendingTimeName(spli2[0]);
//                st.setSpendingTimeNumber(spli2[1]);
//                insertSql(st);
//                break;
//            }
//            break;
//        }
//
//

        System.out.println("strings"+strings.size());

    }






//    String spli = split[2];
//                        if(spli.indexOf("#")!= -1 ){
//        String[] sp = spli.split("\\#");
//        for (int j=0;j<sp.length;j++){
//            String strs = sp[j];
//            String[] slp = strs.split("\\,");
//            for (int k=0;k<slp.length;k++){
//                ptc.setTypeAccessDurationType(slp[0]);
//                ptc.setTypeAccessDurationName(slp[1]);
//                ptc.setTypeAccessDuration(Integer.parseInt(slp[2]));
//
//            }
//        }
//    }else{
//        if(spli.indexOf(",")!= -1 ){
//            String[] sp = spli.split("\\,");
//            for (int k=0;k< spli.length();k++){
//                ptc.setTypeAccessDurationType(sp[0]);
//                ptc.setTypeAccessDurationName(sp[1]);
//                ptc.setTypeAccessDuration(Integer.parseInt(sp[2]));
//            }
//        }
//
//    }








    private static List<personTradingCenter> selectListSql()throws Exception {
        List<personTradingCenter> ptcList = new ArrayList<personTradingCenter>();
        Connection con = jdbcDbCon.conn();//获取连接
        String sql = "select xid from bigdata_person_trading_center";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();//返回2维结果集ResultSet
        while (rs.next()) {

            //String mobile = rs.getString("mobile");//获取第二个列的值 编号 name
            String xid = rs.getString("xid");//获取第三列的值 编号age
            personTradingCenter ptc = new personTradingCenter();
            ptc.setXid(xid);
            ptcList.add(ptc);


        }
        return ptcList;
    }





    private static int   update1Sql(personTradingCenter ptc){

        int i = 0;
        conn = jdbcDbCon.conn();		//调用 DBconnection 类的 conn() 方法连接数据库
      //  String sql = "INSERT INTO bigdata_person_trading_center (gender,age,isChild,maritalStatus) VALUES(?,?,?,?)";		//插入sql语句
            String sql = "update bigdata_person_trading_center set gender='" + ptc.getGender() + "'" +
                        ",age='" + ptc.getAge()+ "'" +
                        ",isChild='" + ptc.getIsChild()+ "'" +
                        ",maritalStatus='" + ptc.getMaritalStatus()+ "'" +
                        " where xid='" + ptc.getXid() + "'";
        try {
            ps = conn.prepareStatement(sql);
            i = ps.executeUpdate();
//            ps.setString(1, ptc.getGender());
            System.out.println("更新成功(*￣︶￣)");
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            jdbcDbCon.close();
        }
        return i;
    }


    private static int   update2Sql(personTradingCenter ptc){

//        ptc.setTypeAccessDurationType(sp[0]);
//        ptc.setTypeAccessDurationName(sp[1]);
//        ptc.setTypeAccessDuration(Integer.parseInt(sp[2]));

        int i = 0;
        conn = jdbcDbCon.conn();		//调用 DBconnection 类的 conn() 方法连接数据库
        //  String sql = "INSERT INTO bigdata_person_trading_center (gender,age,isChild,maritalStatus) VALUES(?,?,?,?)";		//插入sql语句
        String sql = "update bigdata_person_trading_center set area='" + ptc.getArea() + "'" +
                ",consumerIndex='" + ptc.getConsumerIndex()+ "'" +
                ",typeAccessDurationType='" + ptc.getTypeAccessDurationType()+ "'" +
                ",typeAccessDurationName='" + ptc.getTypeAccessDurationName()+ "'" +
                ",typeAccessDuration='" + ptc.getTypeAccessDuration()+ "'" +
                ",tourismCharacteristics='" + ptc.getTourismCharacteristics()+ "'" +
                " where xid='" + ptc.getXid() + "'";
        try {
            ps = conn.prepareStatement(sql);
            i = ps.executeUpdate();
            System.out.println("更新成功(*￣︶￣)");
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            jdbcDbCon.close();
        }
        return i;
    }



    private static int   insertSql(spendingTime st){

//        ptc.setTypeAccessDurationType(sp[0]);
//        ptc.setTypeAccessDurationName(sp[1]);
//        ptc.setTypeAccessDuration(Integer.parseInt(sp[2]));

        int i = 0;
        conn = jdbcDbCon.conn();		//调用 DBconnection 类的 conn() 方法连接数据库
           String sql = "INSERT INTO bigdata_spending_time (xid,spendingTimeName,spendingTimeNumber) VALUES(?,?,?)";		//插入sql语句

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,st.getXid());
            ps.setString(2,st.getSpendingTimeName());
            ps.setString(3,st.getSpendingTimeNumber());
            i = ps.executeUpdate();
            System.out.println("插入成功(*￣︶￣)");
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            jdbcDbCon.close();
        }
        return i;
    }




    private static Integer   selectListsSql(){

        conn = jdbcDbCon.conn();
        String sql = "select mobile from bigdata_person_trading_center";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            int col = rs.getMetaData().getColumnCount();
            System.out.println("============================");
            while (rs.next()) {
                for (int i = 1; i <= col; i++) {
                    System.out.print(rs.getString(i) + "\t");
                    if ((i == 2) && (rs.getString(i).length() < 8)) {
                        System.out.print("\t");
                    }
                }
                System.out.println("");
            }
            System.out.println("============================");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;



    }



    private static List<String> fTM() {
        Map<Integer, String> map = new HashMap<Integer, String>();
        List<String> lst=new ArrayList<String>();
        File file = new File(FILE_IN);
        BufferedReader reader = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            int line = 1;
            int lines = 0;
            String str="";
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                if(tempString.indexOf("=|") != -1){
                    line++;
                        String ssss = tempString.replaceAll("@", "") ;
                        String[] split = ssss.split("\\|");
                        for (int i=0;i<split.length;i++){
                            if(StringUtils.isEmpty(split[i])){
                                continue;
                            }
                            String s = split[i];
                            str+=s+"|";
                        }
                    lst.add(str);
                    str="";
                }

            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }

      return lst;
    }


    private static List<String> fTM2() {
        Map<Integer, String> map = new HashMap<Integer, String>();
        List<String> lst=new ArrayList<String>();
        File file = new File(FILE_IN);
        BufferedReader reader = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            int line = 1;
            int lines = 0;
            String str="";
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                if(tempString.indexOf("=|") != -1){
                    line++;
                    //String ssss = tempString.replaceAll("|@|", "") ;
                    String[] split = tempString.split("\\|");
                    for (int i=0;i<split.length;i++){
                        if(StringUtils.isEmpty(split[i])){
                            continue;
                        }
                        String s = split[i];
                        str+=s+"|";
                    }
                    lst.add(str);
                    str="";
                }

            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }

        return lst;
    }






    private static void showAvailableBytes(InputStream in) {
        try {
            System.out.println("当前字节输入流中的字节数为:" + in.available());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }








}
