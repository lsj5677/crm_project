package com.crm.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {

	public static JSONObject getJsonStringFromMap(Map<String, Object> map) {
		JSONObject jsonObject = new JSONObject();
		
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			jsonObject.put(key, value);
		}// for

		return jsonObject;
	}// getJsonStringFromMap()

	public static JSONArray getJsonArrayFromList(List<Map<String, Object>> list) {
		JSONArray jsonArray = new JSONArray();
		
		for (Map<String, Object> map : list) {
			jsonArray.add(getJsonStringFromMap(map));
		}// for

		return jsonArray;
	}// getJsonArrayFromList()

	/**
	 * List<Map>?ùÑ jsonString?úºÎ°? Î≥??ôò?ïú?ã§.
	 *
	 * @param list List<Map<String, Object>>.
	 * @return String.
	 */
	public static String getJsonStringFromList(List<Map<String, Object>> list) {
		JSONArray jsonArray = getJsonArrayFromList(list);
		return jsonArray.toJSONString();
	}

	/**
	 * JsonObjectÎ•? Map<String, String>?úºÎ°? Î≥??ôò?ïú?ã§.
	 *
	 * @param jsonObj JSONObject.
	 * @return Map<String, Object>.
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapFromJsonObject(JSONObject jsonObj) {
		Map<String, Object> map = null;

		try { map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class); } 
		catch (Exception e) { e.printStackTrace(); }

		return map;
	}// getMapFromJsonObject()

	/**
	 * JsonArrayÎ•? List<Map<String, String>>?úºÎ°? Î≥??ôò?ïú?ã§.
	 *
	 * @param jsonArray JSONArray.
	 * @return List<Map<String, Object>>.
	 */
	public static List<Map<String, Object>> getListMapFromJsonArray(JSONArray jsonArray) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		if (jsonArray != null) {
			int jsonSize = jsonArray.size();
			
			for (int i = 0; i < jsonSize; i++) {
				Map<String, Object> map = JsonUtil.getMapFromJsonObject((JSONObject) jsonArray.get(i));
				list.add(map);
			}// for
		}// if (jsonArray != null)

		return list;
	}// getListMapFromJsonArray()
	
}// JsonUtil class
