package controller;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.msk.Action;

import service.MainService;

public class EmailAction extends Action {

	MainService mainService = new MainService();

	public String emailGET(HttpServletRequest request, HttpServletResponse res) throws Exception {

		List<String> emailList = mainService.getEmailList();
		request.setAttribute("emailList", emailList);

		return "/concept-master/content/email/emailWrite.jsp";
	}

	public String sendEmailPOST(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String host = "smtp.naver.com";
		final String user = "psb6716";
		final String password = "flatron754";

		String receiver = request.getParameter("receiver");
		String title = request.getParameter("e_title");
		String content = request.getParameter("e_content");

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setText(content);
			Transport.send(message);
		} catch (
		MessagingException e) {
			e.printStackTrace();
		}
		request.setAttribute("receiver", receiver);
		return "/concept-master/content/email/emailSuccess.jsp";
	}
}
