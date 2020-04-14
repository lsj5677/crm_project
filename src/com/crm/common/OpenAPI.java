package com.crm.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class OpenAPI {

	private static String WEATHER_RSS_URL = "http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1165053100";
	private static String DUST_API_URL= "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst";
	private static String DUST_API_SERVICEKEY = "DmDZBBhMBraGzTzUiBLU%2FZHRCdPVpZPKzEoHlKyIZuqgOfJgzC6aNRNIEby%2FWQI14ExJkeED%2Btrv1g3D8Bf6lw%3D%3D";

	public static String dustApi() throws Exception {
		String sidoName = "서울";
		String numOfRows = "100";				
		String pageNo = "1";
		String searchCondition = "DAILY";
		String ver = "1.3";
		String _returnType = "json";
		
        StringBuilder urlBuilder = new StringBuilder(DUST_API_URL);
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + DUST_API_SERVICEKEY);
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("searchCondition","UTF-8") + "=" + URLEncoder.encode(searchCondition, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("sidoName","UTF-8") + "=" + URLEncoder.encode(sidoName, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("ver","UTF-8") + "=" + URLEncoder.encode(ver, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("_returnType","UTF-8") + "=" + URLEncoder.encode(_returnType, "UTF-8"));
        
        return urlConnection(urlBuilder.toString());
	}// dustApi()
	
	//weather RSS
	public static String weatherRssXML() throws Exception {
		return urlConnection(WEATHER_RSS_URL);
	}// weatherRssXML()

	private static String urlConnection(String url) throws Exception {
		
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		if (conn !=null) {
			conn.setConnectTimeout(5000);
			conn.setUseCaches(false);
			
			if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
				StringBuilder sBuffer = new StringBuilder();
				InputStreamReader isr = new InputStreamReader(conn.getInputStream(), "UTF-8");
				BufferedReader br = new BufferedReader(isr);
				
				while (true) {
					String line = br.readLine();
					if (line == null) break;
					sBuffer.append(line);
				}
				
				br.close();
				conn.disconnect();
				
				return sBuffer.toString();
			}// if
		
		}
		return "";
	}// urlConnection()
	
	public static void main(String[] args) {
		try {
			weatherRssXML();
			dustApi();
			
			System.out.println(weatherRssXML());
			System.out.println(dustApi());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}// OpenAPI class
