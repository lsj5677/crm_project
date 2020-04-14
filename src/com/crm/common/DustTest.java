package com.crm.common;



import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.BufferedReader;

public class DustTest {
	public static void main(String[] args) {
        // 미세먼�? 경보 ?���? 조회 ?��비스 - ?���??��경공?�� api ?��비스
        try {
            // ?��증키
            String serviceKey = "jsrZbkHh%2BLG1QFMWPGQ%2Bf9sibpg8hIuOYcDqi0doRyFhCDs8gTZZeXFVxQQAdH3L%2BuBtgItrw8Ajku6L2Fm3Tg%3D%3D";
            
            String urlStr = "http://openapi.airkorea.or.kr/openapi/services/rest/UlfptcaAlarmInqireSvc/getUlfptcaAlarmInfo";
            urlStr += "?"+ URLEncoder.encode("ServiceKey","UTF-8") +"=" + serviceKey;
            urlStr += "&"+ URLEncoder.encode("numOfRows","UTF-8") +"=200";
            urlStr += "&"+ URLEncoder.encode("pageNo","UTF-8") +"=1";
            urlStr += "&"+ URLEncoder.encode("year","UTF-8") +"=2019";
            urlStr += "&"+ URLEncoder.encode("_returnType","UTF-8") +"=json";
            
            URL url = new URL(urlStr);
            
            String line = "";
            String result = "";
            
            BufferedReader br;
            br = new BufferedReader(new InputStreamReader(url.openStream()));
            while ((line = br.readLine()) != null) {
                result = result.concat(line);
                //System.out.println(line);                
            }            
            
            // JSON parser 만들?�� 문자?�� ?��?��?���? 객체?��?��?��.
            JSONParser parser = new JSONParser();
            JSONObject obj = (JSONObject)parser.parse(result);
            
            // list ?��?���? 배열?��?���?
            // {"list" : [ {"returnType":"json","clearDate":"--",.......} ] 
            JSONArray parse_listArr = (JSONArray)obj.get("list");
            
            String miseType = "";
            
            // 객체?��?���?
            // {"returnType":"json","clearDate":"--",.......},... 
            for (int i=0;i< parse_listArr.size();i++) {
                JSONObject weather = (JSONObject) parse_listArr.get(i);
                String dataDate = (String) weather.get("dataDate");            // 발령?���?
                String districtName = (String) weather.get("districtName");    // 발령�??��
                String moveName = (String) weather.get("moveName");            // 발령권역
                String issueDate = (String) weather.get("issueDate");        // 발령?��?��
                String issueTime = (String) weather.get("issueTime");        // 발령?���?
                String issueVal  = (String) weather.get("issueVal");        // 발령?��?��
                String itemCode  = (String) weather.get("itemCode");        // 미세먼�? 구분 PM10, PM25
                String issueGbn  = (String) weather.get("issueGbn");        // 경보?���? : 주의�?/경보
                String clearDate = (String) weather.get("clearDate");        // ?��?��?��?��
                String clearTime = (String) weather.get("clearTime");        // ?��?��?���?
                String clearVal = (String) weather.get("clearVal");            // ?��?��?�� 미세먼�??��?��
                
                if (itemCode.equals("PM10")) {            
                    miseType = "";
                } else if (itemCode.equals("PM25")) {    
                    miseType = "초�?�세먼�?";
                }
                StringBuffer sb = new StringBuffer();
                sb.append("발령?���? : " + dataDate + ", �??�� : " + districtName + " ("+ moveName +"), " + "발령?���? : "+ issueDate + " " + issueTime + ", ?��?�� : " + issueVal + " ("+ issueGbn +") " + miseType);
                System.out.println(sb.toString());                
            }
            
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
 
    }
}

