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
		//		1、创建连接，连接到邮件服务器
//		是javax.mail.Session;不是数据传输中的session
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
//		2、创建邮件对象
		Message message = new MimeMessage(session);
		//发件人
		message.setFrom(new InternetAddress("service@mail.html9.top"));
		//收件人
		message.setRecipient(RecipientType.TO, new InternetAddress(toWho));
		//主题
		message.setSubject("新学说的激活邮件");
		//正文
		message.setContent("<h3>欢迎注册新学说数据系统</h3> <h3>请点击下面的链接 激活账号 <a href=\"http://47.92.84.36:8080/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"\">http://47.92.84.36:8080/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"</a></h3>", "text/html;charset=UTF-8");
//		3、发送激活邮件
		Transport.send(message);
	}

}
