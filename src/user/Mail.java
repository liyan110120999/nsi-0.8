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
	
	private static final String ALIDM_SMTP_HOST = "smtpdm.aliyun.com";
	private static final int ALIDM_SMTP_PORT = 25;
	
	public static void sendMail(String toWho, String code) throws Exception, MessagingException {

		boolean isSSL = true;
		Properties props= new Properties();	
//		String host = "smtp.xinxueshuo.cn";
//        int port = 465;
//        boolean isAuth = true;
		//		1���������ӣ����ӵ��ʼ�������
//		��javax.mail.Session;�������ݴ����е�session
			
	
//		props.put("mail.smtp.ssl.enable", isSSL);
//		props.put("mail.smtp.host", host);
//        props.put("mail.smtp.port", port);
//        props.put("mail.smtp.auth", isAuth);
		
//		����������
//        props.put("mail.smtp.auth", "true");
       // props.put("mail.smtp.host", ALIDM_SMTP_HOST);
       //props.put("mail.smtp.port", ALIDM_SMTP_PORT);   
//        ssl����ͷ
//        props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//		props.put("mail.smtp.socketFactory.port", "465");
//		props.put("mail.smtp.port", "465");
		
		
//		25�˿� ��ͨģʽ
		props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", ALIDM_SMTP_HOST);
        props.put("mail.smtp.port", ALIDM_SMTP_PORT);
       
		Session session= Session.getInstance(props, new Authenticator(){
			
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("service@mail.html9.top", "Xinxueshuo123mail");
			}		
		});
//		�򿪵���
		session.setDebug(true);
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
