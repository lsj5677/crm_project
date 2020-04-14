package com.crm.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
	/* 
	 * ë©”ì¼?„ ë³´ë‚´ê¸? ?œ„?•´ ì¶”ê??•œ mail-1.4.7 jar?—?Š” javax.mail ?Œ¨?‚¤ì§?ê°? ?“¤?–´?ˆ?‹¤.
	 * javax.mail ?Œ¨?‚¤ì§??˜ ì£¼ìš” ?´?˜?Š¤?Š” 
	 * Session, Message, Address, Authenticator, Transport ?“±?´ ?ˆ?‹¤. 
	 * SMTP ?„œë²„ì— ?—°ê²°í•´ ?‚¬?š©? ?¸ì¦ì„ ?•˜ê¸? ?œ„?•´?„œ Authenticator ?´?˜?Š¤ ?‚¬?š©?´ ?•„?š”?•˜?‹¤.
	 */
	PasswordAuthentication pa;
	static final String SMTP_USERNAME = "tots2626@naver.com";
	static final String SMTP_PASSWORD = "Kbw891123";
	
	public MailAuth(){
		
		String mail_id = SMTP_USERNAME;
		String mail_pw = SMTP_PASSWORD;
		
		pa = new PasswordAuthentication(mail_id, mail_pw);
		
	}
	public PasswordAuthentication getPasswordAuthentication(){
		return pa;
		
		/* 
		 * public PasswordAuthentication getPasswordAuthentication() {	
		 *		return pa;
		 * 
		 * Authenticatorë¥? ?‚¬?š©?•˜ê¸? ?œ„?•´?„œ?Š” PasswordAuthenticator ?´?˜?Š¤ë¡œë??„° 
		 * ?¸?Š¤?„´?Š¤ë¥? ?ƒ?„±?•˜ê³? getPasswordAuthentication ë©”ì†Œ?“œë¡? ë¦¬í„´ë°›ì•„?•¼ ?•œ?‹¤.
		 * PasswordAuthentication ?´?˜?Š¤?Š” ?‚¬?š©??˜ 
		 * ?•„?´?””?? ?Œ¨?Š¤?›Œ?“œë¥? ?…? ¥ë°›ì•„ ë°˜í™˜?•˜?„ë¡? ?¬? •?˜?•œ?‹¤.
		 */
	}
}
