package admin;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JComboBox.KeySelectionManager;

//�����ܿ�
	public class weeklyMail {
		
		private static final String ALIDM_SMTP_HOST = "smtpdm.aliyun.com";
		private static final int ALIDM_SMTP_PORT = 25;
		
		public static void sendMail(String toWho,
									String title01,String title02,String title03,String title04,String title05,String title06, 
									String content01,String content02,String content03,String content04,String content05,String content06,
									String link01,String link02,String link03,String link04,String link05,String link06
				) throws Exception, MessagingException {
		
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
	        
//			Session session= Session.getInstance(props, new Authenticator(){		
//				@Override
//				protected PasswordAuthentication getPasswordAuthentication() {
//					return new PasswordAuthentication("service@mail.html9.top", "Xinxueshuo123mail");
//				}		
//			});
	        
	     // ʹ�û������Ժ���Ȩ��Ϣ�������ʼ��Ự
	        Session mailSession = Session.getInstance(props, authenticator);
//			�򿪵���
	        mailSession.setDebug(true);
//			2�������ʼ�����
			Message message = new MimeMessage(mailSession);
		
			
	        //�����Զ��巢�����ǳ�  
	        String nick="";  
	        try {  
	            nick=javax.mail.internet.MimeUtility.encodeText("��ѧ˵");  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }   
			
	        
//			//������
//			message.setFrom(new InternetAddress("service@mail.html9.top"));
			
			//������
			message.setFrom(new InternetAddress(nick+"<"+"service@mail.html9.top"+">"));
			//�ռ���
			message.setRecipient(RecipientType.TO, new InternetAddress(toWho));
			//����
			message.setSubject("��ѧ˵��Ѷ�ڿ�");
			//����

//			message.setContent("", "text/html;charset=UTF-8");		
			
			
//			��һ��
//			message.setContent("<div><style type=\"text/css\">  a:link{color:#1F538F;text-decoration:none;  }  a:hover{color:red;  }  "
//					+ "a{text-decoration:none; color: #1F538F;font-size: 14px;}"
//					+ "h2{font-size:1.3em;color: #1F538F;padding-bottom:10px;text-align: left;margin: 5px 0 5px 0;}"
//					+ "</style>"
//					+ "<div style=\"height: 825px;width:600px;border:1px solid #cccccc;margin: 0 auto; background-image: url(http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/mail05.jpg);\">"
//					+ "<div style=\"text-align: center;width: 350px;margin:0 auto;padding-top: 340px;\">"
//					+ "<div ><h2 ><a style=\"color: red\">��</a> <a href=\""+link01+"\" >"+title01+"</a></h2></div>"
//							+ "<div><h2 ><a style=\"color: red\">��</a> <a href=\""+link02+"\" >"+title02+"</a></h2>"
//							+ "</div><div><h2 ><a style=\"color: red\">��</a> <a href=\""+link03+"\" >"+title03+"</a></h2>"
//							+ "</div><div><h2 ><a style=\"color: red\">��</a> <a href=\""+link04+"\" >"+title04+"</a></h2>"
//							+ "</div><div><h2 ><a style=\"color: red\">��</a> <a href=\""+link05+"\" >"+title05+"</a></h2>"
//							+ "</div>  <a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/zxdt\"><b>�鿴����</b></a> </div></div></div>", "text/html;charset=UTF-8");
//			�ڶ���01
//			message.setContent("<style>a:link{color:#1F538F;text-decoration:none}a:hover{color:red}"
//					+ "a{text-decoration:none;color:#1F538F;font-size:14px}h2{font-size:1.3em;color:#1F538F;padding-bottom:10px;text-align:left;margin:5px 0 5px 0}"
//					+ ".bigdiv{width:580px;height:460px;margin-top:510px;margin-left:110px}"
//					+ ".smalldiv{width:170px;height:200px;padding:5px;float:left;margin-right:20px;margin-bottom:35px}"
//					+ ".headerText{font-size:12px;margin-top:2px;margin-bottom:2px}"
//					+ ".text{font-size:8px;margin-top:2px;font-weight:400}"
//					+ "</style>"
//					+ "<div style=\"height:1069px;width:800px;border:1px solid #ccc;margin:0 auto;background-image:url(http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/mail06.jpg)\">"
//					+ "<div class=\"bigdiv\"><div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">��������ע��</h3><h5 class=\"text\">���Ͽɲ�������Ҷ�����Ӣ�����ʷ�չ��֤��С��ѧ˵��Ӣ�����ʷ�չ��֤��С</h5></div>"
//					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">��������ע��</h3><h5 class=\"text\">����ѧ˵��Ӣ�����ʷ�չ�Ͻ��Ͽɲ�������Ҷ������</h5></div>"
//					+ "<div class=\"smalldiv\" style=\"margin-right:0\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">��������ע��</h3><h5 class=\"text\">�ɽ��Ͽɲ�������Ҷ������˵��Ӣ�����ʷ�չ��֤��С��ѧ˵��Ӣ�����ʷ�չ��֤��С</h5></div>"
//					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">��������ע��</h3><h5 class=\"text\">����ѧ˵��Ӣ�����ʷ�չ��֤������ѧ˵��Ӣ�����Ͽɲ�������Ҷ������֤��С</h5></div>"
//					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">��������ע��</h3><h5 class=\"text\">����ѧ˵��Ӣ���ؽ��Ͽɲ�������Ҷ��������С��ѧ˵��Ӣ�����ʷ�չ��֤��С</h5></div>"
//					+ "<div class=\"smalldiv\" style=\"margin-right:0\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">��������ע��</h3><h5 class=\"text\">�ɽ��Ͽɲ�������Ҷ�����Ӣ�����ʷ�չ��֤��С��ѧ˵��Ӣ�����ʷ�չ��֤��</h5></div>"
//					+ "<a href=\"http://www.baidu.com\" style=\"float:right;margin-right:25px;margin-top:10px\">����</a></div></div>", "text/html;charset=UTF-8");		

			
			message.setContent("<style>a:link{color:#1F538F;text-decoration:none}a:hover{color:red}a{text-decoration:none;color:#1F538F;font-size:14px}"
					+ "h2{font-size:1.3em;color:#1F538F;padding-bottom:10px;text-align:left;margin:5px 0 5px 0}.headerdiv{margin-top:330px;text-align:center}"
					+ ".bigdiv{width:580px;height:460px;margin-top:155px;margin-left:110px}.smalldiv{width:170px;height:200px;padding:5px;float:left;margin-right:20px;margin-bottom:35px}"
					+ ".headerText{font-size:14px;margin-top:0;margin-bottom:2px}.text{font-size:10px;margin-top:2px;font-weight:400;color:#aaa}.header02{color:#fff;padding:0 62px}</style>"
					+ "<body><div style=\"height:1069px;width:800px;border:1px solid #ccc;margin:0 auto;background-image:url(http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/mail06.jpg)\"><div class=\"headerdiv\">"
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/index/category/gywm\" class=\"header02\">��������</a>"
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/zxdt\" class=\"header02\">��Ѷ��̬</a>"
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/hyhy\" class=\"header02\">��ҵ�</a>"
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/yjcg\" class=\"header02\">�о��ɹ�</a>"
					+ "</div><div class=\"bigdiv\">"
					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/upImage/upMailImg/upload/mail001.jpg\"height=\"120\" width=\"170\">"
					+ "<h3 class=\"headerText\"><a href=\""+link01+"\">"+title01+"</a></h3><h5 class=\"text\">"+content01+"</h5></div>"
					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/upImage/upMailImg/upload/mail002.jpg\" height=\"120\" width=\"170\">"
					+ "<h3 class=\"headerText\"><a href=\""+link02+"\">"+title02+"</a></h3><h5 class=\"text\">"+content02+"</h5></div>"
					+ "<div class=\"smalldiv\" style=\"margin-right:0\"><img src=\"http://47.92.84.36:8080/upImage/upMailImg/upload/mail003.jpg\" height=\"120\" width=\"170\">"
					+ "<h3 class=\"headerText\"><a href=\""+link03+"\">"+title03+"</a></h3><h5 class=\"text\">"+content03+"</h5></div>"
					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/upImage/upMailImg/upload/mail004.jpg\" height=\"120\" width=\"170\">"
					+ "<h3 class=\"headerText\"><a href=\""+link04+"\">"+title04+"</a></h3><h5 class=\"text\">"+content04+"</h5></div>"
					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/upImage/upMailImg/upload/mail005.jpg\" height=\"120\" width=\"170\">"
					+ "<h3 class=\"headerText\"><a href=\""+link05+"\">"+title05+"</a></h3><h5 class=\"text\">"+content05+"</h5></div>"
					+ "<div class=\"smalldiv\" style=\"margin-right:0\"><img src=\"http://47.92.84.36:8080/upImage/upMailImg/upload/mail006.jpg\" height=\"120\" width=\"170\">"
					+ "<h3 class=\"headerText\"><a href=\""+link06+"\">"+title06+"</a></h3><h5 class=\"text\">"+content06+"</h5></div>"
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/zxdt\" style=\"float:right;margin-right:30px;margin-top:10px\">����</a></div></div></body>", "text/html;charset=UTF-8");	
			
			//			3�����ͼ����ʼ�
			Transport.send(message);
			
		}
}
