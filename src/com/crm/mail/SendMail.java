package com.crm.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;

import javax.mail.internet.MimeMessage;

import com.crm.vo.ClientVO;

public class SendMail {

	private static String to_Client_Email;
	private static String to_Client_Name;
	private static String to_user_Name;
	static final String FROM = "tots2626@naver.com";
	// static final String FROMNAME = "占�?蹂묒슧";
	// static final String TO = "tots2626@hotmail.com";
	static final String HOST = "smtp.naver.com";
	static final int PORT = 587;
	// static final String SMTP_USERNAME = "tots2626@naver.com";
	// static final String SMTP_PASSWORD = "Kbw891123";

	static final String SUBJECT = "설문조사서";
	static final String BODY = String.join(System.getProperty("line.separator"), "<h1>안녕하세요 ??</h1>",
			"<p>설문조사에 참여해주세요. 감사합니다.</p>");

	public SendMail() {
	}

	public SendMail(ClientVO cvo) {
		this.to_Client_Email = cvo.getC_Client_Email();
		this.to_Client_Name = cvo.getC_Client_Name(); // 고객명
		this.to_user_Name = cvo.getC_User_Id();
		
	}
	
	public static String mailSending() throws Exception {

		// PasswordAuthentication pa = MailAuth();
		Authenticator auth = new MailAuth(); //
		Properties prop = prop();
		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = message(session);
		Transport.send(msg);

		String result = "msg";

		return result;
	}

	private static Properties prop() {
		Properties prop = System.getProperties();
		// prop.put("mail.transport.protocol", "smtp");
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", PORT);
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");

		// prop.put("mail.smtp.starttls.enable", "true");
		// prop.put("mail.smtp.host", HOST);
		// prop.put("mail.smtp.auth", "true");
		// prop.put("mail.smtp.port", "587");

		return prop;
	}

	public static MimeMessage message(Session session) throws Exception {

		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(FROM, to_user_Name));
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to_Client_Email));
		msg.setSubject(SUBJECT, "UTF-8");
		msg.setContent(form1(), "text/html;charset=UTF-8");
		// msg.setText(BODY, "UTF-8");
		msg.setSubject("안녕하세요 고객님..", "UTF-8");

		// Transport ts = session.getTransport();
		// ts.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
		// ts.sendMessage(msg, msg.getAllRecipients());

		return msg;
	}
	// private static PasswordAuthentication MailAuth(){
	//
	// Authenticator ac = new PasswordAuthentication(SMTP_USERNAME,
	// SMTP_PASSWORD);
	//
	// PasswordAuthentication pa = new PasswordAuthentication(SMTP_USERNAME,
	// SMTP_PASSWORD);
	// return pa;
	// }
	public static String form1() {
		StringBuffer sb = new StringBuffer();
		sb.append("<h3>저희 매장을 방문해주셔서 감사합니다.</h3>");
		sb.append("<p>매장에서의 경험은 어떠셨나요? 서비스에 대한 만족도를 평가해주세요.<br>");
		sb.append("고객님의 피드백은 서비스 향상에 큰 도움이 됩니다. </p>");
		sb.append("<a href='http://www.crm.com/client/mail.crm?to_Client_Email="+to_Client_Email+"&to_Client_Name="+to_Client_Name+"&to_user_Name="+to_user_Name+"'>설문참여하기</a>");
//		sb.append("<a href='http://localhost:8080/client/clientInsertOk.crm'>설문참여하기</a>");
		return sb.toString();
	}

	 public static void main(String[] args) throws Exception {
	 // TODO Auto-generated method stub
//		 SendMail sm = new SendMail("tots2626@hotmail.com","태경","병욱");
		 mailSending();
	 }

	// exam
	public void email() throws Exception {
		mailSending();
	}

}
