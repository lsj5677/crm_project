package com.crm.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.crm.vo.UserVO;

public abstract class CrmSession {

	private static final String CRM_USER_ID = "c_User_Id";

	public static boolean killSession(final HttpServletRequest hReq) throws Exception {
		if (hReq == null) { return false; }

		try {
			HttpSession hSession = hReq.getSession(true);
			hSession.invalidate();
		} catch (Exception e) { throw e; }

		return true;
	}// killSession()

	public static boolean setSession(final HttpServletRequest hReq, final UserVO usrVO) throws Exception {
		if (hReq == null) { return false; }
		if (usrVO == null) { return false; }

		HttpSession hSession = hReq.getSession(true);

		try { hSession.setAttribute(CRM_USER_ID, usrVO); } 
		catch (Exception e) { throw e; }

		return true;
	}// setSession()

	public static UserVO getSession(final HttpServletRequest hReq) throws Exception {
		if (hReq == null) { return null; }
		
		UserVO memSession = new UserVO();
		HttpSession hSession = hReq.getSession(false);

		try { memSession = (UserVO) hSession.getAttribute(CRM_USER_ID); } 
		catch (Exception e) { throw e; }
		
		return memSession;
	}// getSession()
	
}// CrmSession class
