package user;

import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;


public class Mail {
	
	public static void sendMail(String toWho, String code) throws Exception, MessagingException {

//		boolean isSSL = true;
//		String host = "smtp.xinxueshuo.cn";
//        int port = 465;
//        boolean isAuth = true;
		//		1���������ӣ����ӵ��ʼ�������
//		��javax.mail.Session;�������ݴ����е�session
		Properties props= new Properties();
		
//		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
//		props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		
//		props.put("mail.smtp.ssl.enable", isSSL);
//		props.put("mail.smtp.host", host);
//        props.put("mail.smtp.port", port);
//        props.put("mail.smtp.auth", isAuth);
        
		Session session= Session.getInstance(props, new Authenticator(){

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("service@mail.html9.top", "123456");
			}		
		});
//		2�������ʼ�����
		Message message = new MimeMessage(session);
		//������
		message.setFrom(new InternetAddress("service@mail.html9.top"));
		//�ռ���
		message.setRecipient(RecipientType.TO, new InternetAddress(toWho));
		//����
		message.setSubject("��ѧ˵�ļ����ʼ�");
		//����
		message.setContent("<h3>��ӭע����ѧ˵����ϵͳ</h3> <h3>������������� �����˺� <a href=\"http://47.92.84.36:8080/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"\">http://47.92.84.36:8080/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"</a></h3>", "text/html;charset=UTF-8");
//		3�����ͼ����ʼ�
		Transport.send(message);
	}

}
