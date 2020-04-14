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
		 * Properties Ŭ������ �ý��� �Ӽ��� ��ü�� �����ϴ� Ŭ����
		 * Hashtable�� ��ӹ޴� Ŭ������ �Ӽ��� ���� 1:1�� �����
		 * */
		
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		 Authenticator auth  = new MailAuth();
		 Session session = Session.getDefaultInstance(prop, auth);
		 /*
			 * MailAuth.java���� Authenticator�� ��ӹ޾� ������ 
			 * MailAuth Ŭ������ �޾� ������ �����Ѵ�.
			 * getDefaultInstance�� ù��° �Ķ���ʹ� 27~33Line���� ������ ��
		 * */
		 MimeMessage msg = new MimeMessage(session);
		// MimeMessage�� Message(�߻�)Ŭ������ ��ӹ��� ���ͳ� ������ ���� Ŭ����
		// 38Line ������ ������ ��� msg��ü�� �����Ѵ�.
		 
		 try{
			 	msg.setSentDate(new Date()); //������ ��¥ 
			 	msg.setFrom(new InternetAddress("tots2626@naver.com", "Kbw891123")); //������
			 // Message Ŭ������ setFrom()�޼ҵ带 ����Ͽ� �߼��ڸ� �����Ѵ�.
			 // �߼����� ����,�߼����� InternetAddress Ŭ������ �̸��� �ּҸ� ��Ÿ�� �� ����ϴ� Ŭ����
			 
			 	InternetAddress to = new InternetAddress("cbwkim@gmail.com"); //������ 
			 	msg.setRecipient(Message.RecipientType.TO, to);
		 
			 	msg.setSubject("����������", "UTF-8");
	            // ������ ���� ���� , encoding Ÿ�� ����

			 	msg.setText("���� ������ �湮���ּż� �����մϴ�, �� ���� ���񽺸� ���� �����ۼ� ��Ź�帳�ϴ�."
			 			+ "<<url:survey.html>>", "UTF-8");
	            // ������ ���� �Է�, encoding Ÿ�� ����

			 	Transport.send(msg);
	            // Transport�� ������ ���������� ������ Ŭ������ ������ ������ �κ��̴�.

		 }catch(AddressException ae){
			 System.out.println("AddressException : " + ae);
			 
		 } catch(MessagingException me) {
        	// ���� �������� ���� ����ó��
            System.out.println("MessagingException : " + me.getMessage());
		 } catch(UnsupportedEncodingException e) {
        	// �������� ���� ���ڵ��� ����� ��� ���� ó��
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
		 }           
	}
}


/* 
 * Message Ŭ������ setRecipient()�޼ҵ带 ����Ͽ� �����ڸ� ����
 * setRecipient() �޼ҵ�� ������, ����, ���� ���� ������ �����ϴ�.
 * Message.RecipientType.TO : �޴»��
 * Message.RecipientType.CC : ����
 * Message.RecipientType.BCC : ���� ����
 * */	
