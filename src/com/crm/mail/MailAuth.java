package com.crm.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
	/* 
	 * 메일?�� 보내�? ?��?�� 추�??�� mail-1.4.7 jar?��?�� javax.mail ?��?���?�? ?��?��?��?��.
	 * javax.mail ?��?���??�� 주요 ?��?��?��?�� 
	 * Session, Message, Address, Authenticator, Transport ?��?�� ?��?��. 
	 * SMTP ?��버에 ?��결해 ?��?��?�� ?��증을 ?���? ?��?��?�� Authenticator ?��?��?�� ?��?��?�� ?��?��?��?��.
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
		 * Authenticator�? ?��?��?���? ?��?��?��?�� PasswordAuthenticator ?��?��?��로�??�� 
		 * ?��?��?��?���? ?��?��?���? getPasswordAuthentication 메소?���? 리턴받아?�� ?��?��.
		 * PasswordAuthentication ?��?��?��?�� ?��?��?��?�� 
		 * ?��?��?��?? ?��?��?��?���? ?��?��받아 반환?��?���? ?��?��?��?��?��.
		 */
	}
}
