package com.crm.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
	/* 
	 * λ©μΌ? λ³΄λ΄κΈ? ??΄ μΆκ?? mail-1.4.7 jar?? javax.mail ?¨?€μ§?κ°? ?€?΄??€.
	 * javax.mail ?¨?€μ§?? μ£Όμ ?΄??€? 
	 * Session, Message, Address, Authenticator, Transport ?±?΄ ??€. 
	 * SMTP ?λ²μ ?°κ²°ν΄ ?¬?©? ?Έμ¦μ ?κΈ? ??΄? Authenticator ?΄??€ ?¬?©?΄ ????€.
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
		 * Authenticatorλ₯? ?¬?©?κΈ? ??΄?? PasswordAuthenticator ?΄??€λ‘λ??° 
		 * ?Έ?€?΄?€λ₯? ??±?κ³? getPasswordAuthentication λ©μ?λ‘? λ¦¬ν΄λ°μ?Ό ??€.
		 * PasswordAuthentication ?΄??€? ?¬?©?? 
		 * ??΄??? ?¨?€??λ₯? ?? ₯λ°μ λ°ν??λ‘? ?¬? ???€.
		 */
	}
}
