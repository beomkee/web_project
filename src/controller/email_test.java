package controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class email_test {
	public static void main(String[] args) {
		String host = "smtp.naver.com";
		final String user = "psb6716";
		final String password = "flatron754";
		
		String to = "dowtestemail@gmail.com";

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// Subject
			message.setSubject("자바에서 보내는 이메일입니다");

			// Text
			message.setText("이메일 내용입니다");

			// send the message
			Transport.send(message);
			System.out.println("이메일 전송 성공");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
