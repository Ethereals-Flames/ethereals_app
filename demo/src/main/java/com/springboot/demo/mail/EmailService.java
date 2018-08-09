package com.springboot.demo.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {
	private Properties props = new Properties();
	private String host =  "smtp.gmail.com";
	private final String username = "organicfarm.service";
	private final String password = "ethereals";
	private String from = "organicfarm.service@gmail.com";
	public void sendMail(String to, String subject, String messageText) {
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		Session session1 = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			Message mail = new MimeMessage(session1);
			mail.setFrom(new InternetAddress(from));
			mail.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to) );
			mail.setSubject(subject);
			mail.setText(messageText);
			Transport.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
	}
	
}
