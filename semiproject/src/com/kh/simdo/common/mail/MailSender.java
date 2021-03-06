package com.kh.simdo.common.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.kh.simdo.common.code.ConfigCode;
import com.kh.simdo.common.code.ErrorCode;
import com.kh.simdo.common.exception.ToAlertException;

public class MailSender {
	// 크게 기능분리를 해보자
		// 1. Session 객체 생성
		// 2. 메세지 생성
		// 3. 메세지에 body부분을 작성하기 위해 multipart객체 생성
		// 2번이 메인이니까 1,3을 분리해주자.

		public void sendEmail(String subject, String text, String toEmail) {
			
	        try {
	        	// 4. 메시지 작성을 위한 MimeMesaage 생성 - 생성할 때 3번의 session 객체 전달
	        	MimeMessage msg = new MimeMessage(getSession());
				msg.setFrom(new InternetAddress(ConfigCode.EMAIL.desc));
				msg.setRecipients(Message.RecipientType.TO, toEmail);
				msg.setSubject(subject);
				msg.setContent(getMulipart(text));
				
				// 6. javax.mail라이브러리가 메일전송을 위해 제공해주는 Transport 클래스의 send 메서드를 사용해 메일 전송
				Transport.send(msg);
			} catch (MessagingException e) {
				throw new ToAlertException(ErrorCode.MAIL01,e);
			}
	        System.out.println("sendEmail");
		}
		
		private Session getSession() {
			// 1. 네이버 smtp 서버를 사용하기 위해 인증정보 - 네이버 id, pw 필요
			PasswordAuthentication pa = new PasswordAuthentication("choayoung91@naver.com", "");
			
			// 2. 사용할 smtp 서버 정보를 작성 - smtp 서버이름, 포트, tls통신 가능 여부, 사용자 인증 여부
			// session 정보에는 getInstance(Properties props, Authenticator authenticator) 이렇게 2개가 들어간다.
			Properties prop = new Properties();
			// host정보,
			prop.put("mail.smtp.host", "smtp.naver.com");
			prop.put("mail.smtp.port","587");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", "true");
			
			//세션에 넣어주기, 익명클래스로 인증정보 넣어주기.
			// 3. javax.mail의 session 객체 생성하여 인증정보와 smtp서버정보를 전달
			Session session = Session.getDefaultInstance(prop, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return pa;
				}
			});
			System.out.println("getSession");
			return session;
		}
		
		private Multipart getMulipart(String text) throws MessagingException {
			 
			// 5. smtp 메시지의 body를 작성할 때, 텍스트 이외의 content-type 데이터를 전송하기 위한 MimeMultipart객체를 생성해 메일 본문을 작성
			//mulipart는 메시지에 setContent() 사용하려고!  추상클래스들이라 본클래스 선언하고 body 넣어주기
			Multipart mulipart = new MimeMultipart();
			MimeBodyPart htmlPart = new MimeBodyPart();
			
			htmlPart.setContent(text,"text/html; charset=UTF-8");
			mulipart.addBodyPart(htmlPart);
			System.out.println("getMulipart");
			return mulipart;
		}

}
