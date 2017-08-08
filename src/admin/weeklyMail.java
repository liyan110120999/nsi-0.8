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

//发送周刊
	public class weeklyMail {
		
		private static final String ALIDM_SMTP_HOST = "smtpdm.aliyun.com";
		private static final int ALIDM_SMTP_PORT = 25;
		
		public static void sendMail(String toWho,
									String title01,String title02,String title03,String title04,String title05,String title06, 
									String content01,String content02,String content03,String content04,String content05,String content06,
									String link01,String link02,String link03,String link04,String link05,String link06
				) throws Exception, MessagingException {
		
			Properties props= new Properties();	
			 // 表示SMTP发送邮件，需要进行身份验证
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.host", ALIDM_SMTP_HOST);

	         props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	         props.put("mail.smtp.socketFactory.port", "465");
	         props.put("mail.smtp.port", "465");
	        
	        
	        // 发件人的账号
	        props.put("mail.user", "service@mail.html9.top");
	        // 访问SMTP服务时需要提供的密码
	        props.put("mail.password", "Xinxueshuo123Mail");
			
	     // 构建授权信息，用于进行SMTP进行身份验证
	        Authenticator authenticator = new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                // 用户名、密码
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
	        
	     // 使用环境属性和授权信息，创建邮件会话
	        Session mailSession = Session.getInstance(props, authenticator);
//			打开调试
	        mailSession.setDebug(true);
//			2、创建邮件对象
			Message message = new MimeMessage(mailSession);
		
			
	        //设置自定义发件人昵称  
	        String nick="";  
	        try {  
	            nick=javax.mail.internet.MimeUtility.encodeText("新学说");  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }   
			
	        
//			//发件人
//			message.setFrom(new InternetAddress("service@mail.html9.top"));
			
			//发件人
			message.setFrom(new InternetAddress(nick+"<"+"service@mail.html9.top"+">"));
			//收件人
			message.setRecipient(RecipientType.TO, new InternetAddress(toWho));
			//主题
			message.setSubject("新学说资讯期刊");
			//正文

//			message.setContent("", "text/html;charset=UTF-8");		
			
			
//			第一版
//			message.setContent("<div><style type=\"text/css\">  a:link{color:#1F538F;text-decoration:none;  }  a:hover{color:red;  }  "
//					+ "a{text-decoration:none; color: #1F538F;font-size: 14px;}"
//					+ "h2{font-size:1.3em;color: #1F538F;padding-bottom:10px;text-align: left;margin: 5px 0 5px 0;}"
//					+ "</style>"
//					+ "<div style=\"height: 825px;width:600px;border:1px solid #cccccc;margin: 0 auto; background-image: url(http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/mail05.jpg);\">"
//					+ "<div style=\"text-align: center;width: 350px;margin:0 auto;padding-top: 340px;\">"
//					+ "<div ><h2 ><a style=\"color: red\">●</a> <a href=\""+link01+"\" >"+title01+"</a></h2></div>"
//							+ "<div><h2 ><a style=\"color: red\">●</a> <a href=\""+link02+"\" >"+title02+"</a></h2>"
//							+ "</div><div><h2 ><a style=\"color: red\">●</a> <a href=\""+link03+"\" >"+title03+"</a></h2>"
//							+ "</div><div><h2 ><a style=\"color: red\">●</a> <a href=\""+link04+"\" >"+title04+"</a></h2>"
//							+ "</div><div><h2 ><a style=\"color: red\">●</a> <a href=\""+link05+"\" >"+title05+"</a></h2>"
//							+ "</div>  <a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/zxdt\"><b>查看更多</b></a> </div></div></div>", "text/html;charset=UTF-8");
//			第二版01
//			message.setContent("<style>a:link{color:#1F538F;text-decoration:none}a:hover{color:red}"
//					+ "a{text-decoration:none;color:#1F538F;font-size:14px}h2{font-size:1.3em;color:#1F538F;padding-bottom:10px;text-align:left;margin:5px 0 5px 0}"
//					+ ".bigdiv{width:580px;height:460px;margin-top:510px;margin-left:110px}"
//					+ ".smalldiv{width:170px;height:200px;padding:5px;float:left;margin-right:20px;margin-bottom:35px}"
//					+ ".headerText{font-size:12px;margin-top:2px;margin-bottom:2px}"
//					+ ".text{font-size:8px;margin-top:2px;font-weight:400}"
//					+ "</style>"
//					+ "<div style=\"height:1069px;width:800px;border:1px solid #ccc;margin:0 auto;background-image:url(http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/mail06.jpg)\">"
//					+ "<div class=\"bigdiv\"><div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">国际素质注册</h3><h5 class=\"text\">江南可采莲，莲叶何田田，英国素质发展认证中小新学说，英国素质发展认证中小</h5></div>"
//					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">国际素质注册</h3><h5 class=\"text\">由新学说，英国素质发展认江南可采莲，莲叶何田田</h5></div>"
//					+ "<div class=\"smalldiv\" style=\"margin-right:0\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">国际素质注册</h3><h5 class=\"text\">由江南可采莲，莲叶何田田说，英国素质发展认证中小新学说，英国素质发展认证中小</h5></div>"
//					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">国际素质注册</h3><h5 class=\"text\">由新学说，英国素质发展认证中心新学说，英国江南可采莲，莲叶何田田证中小</h5></div>"
//					+ "<div class=\"smalldiv\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">国际素质注册</h3><h5 class=\"text\">由新学说，英国素江南可采莲，莲叶何田田中小新学说，英国素质发展认证中小</h5></div>"
//					+ "<div class=\"smalldiv\" style=\"margin-right:0\"><img src=\"http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/context.jpg\" height=\"120\" width=\"170\">"
//					+ "<h3 class=\"headerText\">国际素质注册</h3><h5 class=\"text\">由江南可采莲，莲叶何田田，英国素质发展认证中小新学说，英国素质发展认证中</h5></div>"
//					+ "<a href=\"http://www.baidu.com\" style=\"float:right;margin-right:25px;margin-top:10px\">更多</a></div></div>", "text/html;charset=UTF-8");		

			
			message.setContent("<style>a:link{color:#1F538F;text-decoration:none}a:hover{color:red}a{text-decoration:none;color:#1F538F;font-size:14px}"
					+ "h2{font-size:1.3em;color:#1F538F;padding-bottom:10px;text-align:left;margin:5px 0 5px 0}.headerdiv{margin-top:330px;text-align:center}"
					+ ".bigdiv{width:580px;height:460px;margin-top:155px;margin-left:110px}.smalldiv{width:170px;height:200px;padding:5px;float:left;margin-right:20px;margin-bottom:35px}"
					+ ".headerText{font-size:14px;margin-top:0;margin-bottom:2px}.text{font-size:10px;margin-top:2px;font-weight:400;color:#aaa}.header02{color:#fff;padding:0 62px}</style>"
					+ "<body><div style=\"height:1069px;width:800px;border:1px solid #ccc;margin:0 auto;background-image:url(http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/mail06.jpg)\"><div class=\"headerdiv\">"
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/index/category/gywm\" class=\"header02\">关于我们</a>"
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/zxdt\" class=\"header02\">资讯动态</a>"
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/hyhy\" class=\"header02\">行业活动</a>"
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/yjcg\" class=\"header02\">研究成果</a>"
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
					+ "<a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/zxdt\" style=\"float:right;margin-right:30px;margin-top:10px\">更多</a></div></div></body>", "text/html;charset=UTF-8");	
			
			//			3、发送激活邮件
			Transport.send(message);
			
		}
}
