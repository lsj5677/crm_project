package com.crm.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {

	public void mailSend(){
		
		Properties prop = System.getProperties();
		/*
		 * Properties prop = System.getProperties();
		 * Properties 클래스는 시스템 속성을 객체로 생성하는 클래스
		 * Hashtable을 상속받는 클래스로 속성과 값은 1:1로 저장됨
		 * */
		
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		 Authenticator auth  = new MailAuth();
		 Session session = Session.getDefaultInstance(prop, auth);
		 /*
			 * MailAuth.java에서 Authenticator를 상속받아 생성한 
			 * MailAuth 클래스를 받아 세션을 생성한다.
			 * getDefaultInstance의 첫번째 파라미터는 27~33Line에서 정의한 값
		 * */
		 MimeMessage msg = new MimeMessage(session);
		// MimeMessage는 Message(추상)클래스를 상속받은 인터넷 메일을 위한 클래스
		// 38Line 생성한 세션을 담아 msg객체를 생성한다.
		 
		 try{
			 	msg.setSentDate(new Date()); //보내는 날짜 
			 	msg.setFrom(new InternetAddress("tots2626@naver.com", "Kbw891123")); //보낸이
			 // Message 클래스의 setFrom()메소드를 사용하여 발송자를 지정한다.
			 // 발송자의 메일,발송지명 InternetAddress 클래스는 이메일 주소를 나타날 때 사용하는 클래스
			 
			 	InternetAddress to = new InternetAddress("cbwkim@gmail.com"); //수신자 
			 	msg.setRecipient(Message.RecipientType.TO, to);
		 
			 	msg.setSubject("고객설문조사", "UTF-8");
	            // 메일의 제목 지정 , encoding 타입 설정

			 	msg.setText("오늘 매장을 방문해주셔서 감사합니다, 더 나은 서비스를 위해 설문작성 부탁드립니다."
			 			+ "<<url:survey.html>>", "UTF-8");
	            // 메일의 내용 입력, encoding 타입 설정

			 	Transport.send(msg);
	            // Transport는 메일을 최종적으로 보내는 클래스로 메일을 보내는 부분이다.

		 }catch(AddressException ae){
			 System.out.println("AddressException : " + ae);
			 
		 } catch(MessagingException me) {
        	// 메일 계정인증 관련 예외처리
            System.out.println("MessagingException : " + me.getMessage());
		 } catch(UnsupportedEncodingException e) {
        	// 지원되지 않은 인코딩을 사용할 경우 예외 처리
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
		 }           
	}
}


/* 
 * Message 클래스의 setRecipient()메소드를 사용하여 수신자를 설정
 * setRecipient() 메소드로 수신자, 참조, 숨은 참조 설정이 가능하다.
 * Message.RecipientType.TO : 받는사람
 * Message.RecipientType.CC : 참조
 * Message.RecipientType.BCC : 숨은 참조
 * */	
