package user;

import java.util.Calendar;
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
	
		Properties props= new Properties();	
		 // ��ʾSMTP�����ʼ�����Ҫ���������֤
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", ALIDM_SMTP_HOST);

         props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
         props.put("mail.smtp.socketFactory.port", "465");
         props.put("mail.smtp.port", "465");
        
        
        // �����˵��˺�
        props.put("mail.user", "service@mail.html9.top");
        // ����SMTP����ʱ��Ҫ�ṩ������
        props.put("mail.password", "Xinxueshuo123Mail");
		
     // ������Ȩ��Ϣ�����ڽ���SMTP���������֤
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // �û���������
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
               
     // ʹ�û������Ժ���Ȩ��Ϣ�������ʼ��Ự
        Session mailSession = Session.getInstance(props, authenticator);
//		�򿪵���
        mailSession.setDebug(true);
//		2�������ʼ�����
		Message message = new MimeMessage(mailSession);
		//������
		message.setFrom(new InternetAddress("service@mail.html9.top"));
		//�ռ���
		message.setRecipient(RecipientType.TO, new InternetAddress(toWho));
		//����
		message.setSubject("��ѧ˵�ļ����ʼ�");
		//����
//		message.setContent("<h3>��ӭע����ѧ˵����ϵͳ</h3> <h3>������������� �����˺� <br /><a href=\"http://47.92.84.36:8080/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"\">http://47.92.84.36:8080/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"</a></h3>", "text/html;charset=UTF-8");
		message.setContent("<blockquote class=\"quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">\n<div style=\"font-size:14px; color:#666;border:1px solid #d9d9d9; border-top:4px solid #20a56e; height:auto; padding:12px 35px 28px ;width:600px;margin:40px auto;font-family:microsoft yahei;word-wrap:break-word\">\n<p style=\"line-height:20px;\">\n<span style=\"color:#000;font-size:1.2em;font-weight:bold;\">"+toWho+"</span>\uFF0C\u6B22\u8FCE\u60A8\u6CE8\u518C\u65B0\u5B66\u8BF4\u6570\u636E\u7CFB\u7EDF\u3002\n</p>\n<p style=\"line-height:20px;\">\u8BF7\u8BBF\u95EE\u4EE5\u4E0B\u94FE\u63A5\u5B8C\u6210\u60A8\u7684\u90AE\u7BB1\u6FC0\u6D3B\u9A8C\u8BC1\u3002</p>\n<p style=\"line-height:20px;\">"
				+"<h3><br /><a href=\"http://47.92.84.36:80/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"\">http://47.92.84.36:80/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"</a></h3>"
				+"</p>\n<p style=\"line-height:20px;\">\u5982\u679C\u65E0\u6CD5\u6253\u5F00\u94FE\u63A5\uFF0C\u8BF7\u590D\u5236\u4E0A\u9762\u7684\u94FE\u63A5\u7C98\u8D34\u5230\u6D4F\u89C8\u5668\u7684\u5730\u5740\u680F\u3002 </p>\n<dl style=\"background:#f9f9f9; border:1px solid #dcdcdc; padding:12px; color:#8a6d3b; margin:25px 0;\">\n<dt style=\"line-height:30px; font-weight:bold; margin-left:12px\">\u65B0\u5B66\u8BF4\u53EF\u4EE5\u5E2E\u60A8\u505A\u4EC0\u4E48\uFF1F</dt>\n<dd style=\"line-height:30px; margin-left:12px \">\u6559\u80B2\u5708\u7684\u54A8\u8BE2\u52A8\u6001</dd>\n<dd style=\"line-height:30px; margin-left:12px \">\u4E13\u4E1A\u7684\u7814\u7A76\u6210\u679C</dd>\n<dd style=\"line-height:30px;  margin-left:12px\">\u56FD\u9645\u5B66\u6821\u54A8\u8BE2\u670D\u52A1</dd></dl>\n<p style=\"color:#999; font-size:12px; line-height:12px; padding-top:24px; border-top:1px solid #dcdcdc;\">\u672C\u90AE\u4EF6\u7531\u7CFB\u7EDF\u81EA\u52A8\u53D1\u9001\uFF0C\u8BF7\u52FF\u76F4\u63A5\u56DE\u590D\uFF01\u5982\u6709\u4EFB\u4F55\u7591\u95EE\uFF0C\u8BF7\u8054\u7CFB\u6211\u4EEC\u7684\u5BA2\u670D\u4EBA\u5458\u3002</p>\n<p style=\"color:#999; font-size:12px; line-height:12px;\">\u8054\u7CFB\u7535\u8BDD\uFF1A<span style=\"border-bottom:1px dashed #ccc;z-index:1\" t=\"7\" onclick=\"return false;\" >010-52468286</span>\n</p></div>\n</blockquote>", "text/html;charset=UTF-8");
//		3�����ͼ����ʼ�
		Transport.send(message);		
	}
	
//	����ʱ����ʼ���ַ�ַ����ȵļ����㷨
	public static void ForgetPWsendMail(String toWho) throws Exception, MessagingException {
		
		Properties props= new Properties();	
		 // ��ʾSMTP�����ʼ�����Ҫ���������֤
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", ALIDM_SMTP_HOST);

	     props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	     props.put("mail.smtp.socketFactory.port", "465");
	     props.put("mail.smtp.port", "465");
               
        // �����˵��˺�
        props.put("mail.user", "service@mail.html9.top");
        // ����SMTP����ʱ��Ҫ�ṩ������
        props.put("mail.password", "Xinxueshuo123Mail");
		
     // ������Ȩ��Ϣ�����ڽ���SMTP���������֤
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // �û���������
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
               
     // ʹ�û������Ժ���Ȩ��Ϣ�������ʼ��Ự
        Session mailSession = Session.getInstance(props, authenticator);
//		�򿪵���
        mailSession.setDebug(true);
//		2�������ʼ�����
		Message message = new MimeMessage(mailSession);
		//������
		message.setFrom(new InternetAddress("service@mail.html9.top"));
		//�ռ���
		message.setRecipient(RecipientType.TO, new InternetAddress(toWho));
		//����
		message.setSubject("��ѧ˵����֤�ʼ�");
		
		//����ʱ����ʼ���ַ�ַ����ȵļ����㷨	
		Calendar time = Calendar.getInstance();
		System.out.println("ForgetPWsendMail:cc�����㷨��hour:"+time.get(Calendar.HOUR_OF_DAY));
		int time_hour =time.get(Calendar.HOUR_OF_DAY);
		int cc=toWho.length()*time_hour+987654;
		
		//����
//		message.setContent("<h3>��ӭע����ѧ˵����ϵͳ</h3> <h3>������������� �����˺� <br /><a href=\"http://47.92.84.36:8080/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"\">http://47.92.84.36:8080/nsi-0.8/register?registerCode="+code+"&UserMail="+toWho+"</a></h3>", "text/html;charset=UTF-8");
		message.setContent("<blockquote class=\"quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">\n<div style=\"font-size:14px; color:#666;border:1px solid #d9d9d9; border-top:4px solid #20a56e; height:auto; padding:12px 35px 28px ;width:600px;margin:40px auto;font-family:microsoft yahei;word-wrap:break-word\">\n<p style=\"line-height:20px;\">\n<span style=\"color:#000;font-size:1.2em;font-weight:bold;\">"+toWho+"</span>\uFF0C\u6B22\u8FCE\u60A8\u6CE8\u518C\u65B0\u5B66\u8BF4\u6570\u636E\u7CFB\u7EDF\u3002\n</p>\n<p style=\"line-height:20px;\">\u8BF7\u8BBF\u95EE\u4EE5\u4E0B\u94FE\u63A5\u5B8C\u6210\u60A8\u7684\u90AE\u7BB1\u6FC0\u6D3B\u9A8C\u8BC1\u3002</p>\n<p style=\"line-height:20px;\">"
				+"<h3><br /><a href=\"http://47.92.84.36:80/nsi-0.8/register?registerCode="+cc+"&UserMail="+toWho+"\">http://47.92.84.36:80/nsi-0.8/register?registerCode="+cc+"&UserMail="+toWho+"</a></h3>"
				+"</p>\n<p style=\"line-height:20px;\">\u5982\u679C\u65E0\u6CD5\u6253\u5F00\u94FE\u63A5\uFF0C\u8BF7\u590D\u5236\u4E0A\u9762\u7684\u94FE\u63A5\u7C98\u8D34\u5230\u6D4F\u89C8\u5668\u7684\u5730\u5740\u680F\u3002 </p>\n<dl style=\"background:#f9f9f9; border:1px solid #dcdcdc; padding:12px; color:#8a6d3b; margin:25px 0;\">\n<dt style=\"line-height:30px; font-weight:bold; margin-left:12px\">\u65B0\u5B66\u8BF4\u53EF\u4EE5\u5E2E\u60A8\u505A\u4EC0\u4E48\uFF1F</dt>\n<dd style=\"line-height:30px; margin-left:12px \">\u6559\u80B2\u5708\u7684\u54A8\u8BE2\u52A8\u6001</dd>\n<dd style=\"line-height:30px; margin-left:12px \">\u4E13\u4E1A\u7684\u7814\u7A76\u6210\u679C</dd>\n<dd style=\"line-height:30px;  margin-left:12px\">\u56FD\u9645\u5B66\u6821\u54A8\u8BE2\u670D\u52A1</dd></dl>\n<p style=\"color:#999; font-size:12px; line-height:12px; padding-top:24px; border-top:1px solid #dcdcdc;\">\u672C\u90AE\u4EF6\u7531\u7CFB\u7EDF\u81EA\u52A8\u53D1\u9001\uFF0C\u8BF7\u52FF\u76F4\u63A5\u56DE\u590D\uFF01\u5982\u6709\u4EFB\u4F55\u7591\u95EE\uFF0C\u8BF7\u8054\u7CFB\u6211\u4EEC\u7684\u5BA2\u670D\u4EBA\u5458\u3002</p>\n<p style=\"color:#999; font-size:12px; line-height:12px;\">\u8054\u7CFB\u7535\u8BDD\uFF1A<span style=\"border-bottom:1px dashed #ccc;z-index:1\" t=\"7\" onclick=\"return false;\" >010-52468286</span>\n</p></div>\n</blockquote>", "text/html;charset=UTF-8");
//		3�����ͼ����ʼ�
		Transport.send(message);
		
	}
	

}
