package admin;

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
		
		public static void sendMail(String toWho, String title01,String title02,String title03,String title04,String title05, String link01,String link02,String link03,String link04,String link05) throws Exception, MessagingException {
		
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
			//发件人
			message.setFrom(new InternetAddress("service@mail.html9.top"));
			//收件人
			message.setRecipient(RecipientType.TO, new InternetAddress(toWho));
			//主题
			message.setSubject("新学说资讯期刊 第1期");
			//正文
//			message.setContent("<blockquote class=\"quote\" style=\"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex\">\n<div style=\"font-size:14px; color:#666;border:1px solid #d9d9d9; border-top:4px solid #20a56e; height:auto; padding:12px 35px 28px ;width:600px;margin:40px auto;font-family:microsoft yahei;word-wrap:break-word\">\n<p style=\"line-height:20px;\">\n<span style=\"color:#000;font-size:1.2em;font-weight:bold;\">"+toWho+"</span>\uFF0C\u6B22\u8FCE\u60A8\u6CE8\u518C\u65B0\u5B66\u8BF4\u6570\u636E\u7CFB\u7EDF\u3002\n</p>\n<p style=\"line-height:20px;\">\u8BF7\u8BBF\u95EE\u4EE5\u4E0B\u94FE\u63A5\u5B8C\u6210\u60A8\u7684\u90AE\u7BB1\u6FC0\u6D3B\u9A8C\u8BC1\u3002</p>\n<p style=\"line-height:20px;\">"
//					+"<h3><br /><a href=\"http://47.92.84.36:8080/nsi-0.8/register?registerCode=&UserMail="+toWho+"\">http://47.92.84.36:8080/nsi-0.8/register?registerCode=&UserMail="+toWho+"</a></h3>"
//					+"</p>\n<p style=\"line-height:20px;\">\u5982\u679C\u65E0\u6CD5\u6253\u5F00\u94FE\u63A5\uFF0C\u8BF7\u590D\u5236\u4E0A\u9762\u7684\u94FE\u63A5\u7C98\u8D34\u5230\u6D4F\u89C8\u5668\u7684\u5730\u5740\u680F\u3002 </p>\n<dl style=\"background:#f9f9f9; border:1px solid #dcdcdc; padding:12px; color:#8a6d3b; margin:25px 0;\">\n<dt style=\"line-height:30px; font-weight:bold; margin-left:12px\">\u65B0\u5B66\u8BF4\u53EF\u4EE5\u5E2E\u60A8\u505A\u4EC0\u4E48\uFF1F</dt>\n<dd style=\"line-height:30px; margin-left:12px \">\u6559\u80B2\u5708\u7684\u54A8\u8BE2\u52A8\u6001</dd>\n<dd style=\"line-height:30px; margin-left:12px \">\u4E13\u4E1A\u7684\u7814\u7A76\u6210\u679C</dd>\n<dd style=\"line-height:30px;  margin-left:12px\">\u56FD\u9645\u5B66\u6821\u54A8\u8BE2\u670D\u52A1</dd></dl>\n<p style=\"color:#999; font-size:12px; line-height:12px; padding-top:24px; border-top:1px solid #dcdcdc;\">\u672C\u90AE\u4EF6\u7531\u7CFB\u7EDF\u81EA\u52A8\u53D1\u9001\uFF0C\u8BF7\u52FF\u76F4\u63A5\u56DE\u590D\uFF01\u5982\u6709\u4EFB\u4F55\u7591\u95EE\uFF0C\u8BF7\u8054\u7CFB\u6211\u4EEC\u7684\u5BA2\u670D\u4EBA\u5458\u3002</p>\n<p style=\"color:#999; font-size:12px; line-height:12px;\">\u8054\u7CFB\u7535\u8BDD\uFF1A<span style=\"border-bottom:1px dashed #ccc;z-index:1\" t=\"7\" onclick=\"return false;\" >010-52468286</span>\n</p></div>\n</blockquote>", "text/html;charset=UTF-8");

//			message.setContent("", "text/html;charset=UTF-8");		
			
//			message.setContent("<div><style type=\"text/css\">  a:link{color:#1F538F;text-decoration:none;  }  a:hover{color:red;  }  a{text-decoration:none;  }  h2{color: #1F538F;padding-bottom:20px;text-align: left; border-bottom:1px solid #1F538F;  }</style><h5>感谢您注册本网站</h5><div style=\"height: 1100px;width: 800px;margin: 0 auto; background-image: url(http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/mail02.jpg);\"><div style=\"text-align: center;width: 500px;margin:0 auto;padding-top: 420px;\"><div ><h2 ><a style=\"color: red\">●</a><a href=\""+link01+"\" >"+title01+"</a></h2></div><div><h2 ><a style=\"color: red\">●</a> 上海将加强民办学校设立流程监管，引导非营利性办学</h2></div><div><h2 ><a style=\"color: red\">●</a>点击激活注册</h2></div><div><h2 ><a style=\"color: red\">●</a> 国际素质教育概况</h2></div><div><h2 ><a style=\"color: red\">●</a> 学校素质教育项目的开展趋向学术与的“统筹平衡”</h2></div><button style=\"background-color: #1F538F; border: 5px; color: white; padding: 15px 50px; border-radius: 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 20px;\">查看</button></div></div></div>", "text/html;charset=UTF-8");

//			可用
//			message.setContent("<div><style type=\"text/css\">  a:link{color:#1F538F;text-decoration:none;  }  a:hover{color:red;  }  a{text-decoration:none;  }  h2{color: #1F538F;padding-bottom:20px;text-align: left; border-bottom:1px solid #1F538F;  }</style><h5>感谢您注册本网站</h5><div style=\"height: 1100px;width: 800px;margin: 0 auto; background-image: url(http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/mail02.jpg);\"><div style=\"text-align: center;width: 500px;margin:0 auto;padding-top: 420px;\"><div ><h2 ><a style=\"color: red\">●</a><a href=\""+link01+"\" >"+title01+"</a></h2></div><div><h2 ><a style=\"color: red\">●</a> <a href=\""+link02+"\" >"+title02+"</a></h2></div><div><h2 ><a style=\"color: red\">●</a><a href=\""+link03+"\" >"+title03+"</a></h2></div><div><h2 ><a style=\"color: red\">●</a><a href=\""+link04+"\" >"+title04+"</a></h2></div><div><h2 ><a style=\"color: red\">●</a><a href=\""+link05+"\" >"+title05+"</a></h2></div><button style=\"background-color: #1F538F; border: 5px; color: white; padding: 15px 50px; border-radius: 20px; text-align: center; text-decoration: none; display: inline-block; font-size: 20px;\">查看</button></div></div></div>", "text/html;charset=UTF-8");
			
			
			message.setContent("<div><style type=\"text/css\">  a:link{color:#1F538F;text-decoration:none;  }  a:hover{color:red;  }  "
					+ "a{text-decoration:none; color: #1F538F;font-size: 14px;}"
					+ "h2{font-size:1.3em;color: #1F538F;padding-bottom:10px;text-align: left;margin: 5px 0 5px 0;}"
					+ "</style>"
					+ "<div style=\"height: 825px;width:600px;border:1px solid #cccccc;margin: 0 auto; background-image: url(http://47.92.84.36:8080/nsi-0.8/assets/img/weeklyMail/mail04.jpg);\">"
					+ "<div style=\"text-align: center;width: 350px;margin:0 auto;padding-top: 340px;\">"
					+ "<div ><h2 ><a style=\"color: red\">●</a> <a href=\""+link01+"\" >"+title01+"</a></h2></div>"
							+ "<div><h2 ><a style=\"color: red\">●</a> <a href=\""+link02+"\" >"+title02+"</a></h2>"
							+ "</div><div><h2 ><a style=\"color: red\">●</a> <a href=\""+link03+"\" >"+title03+"</a></h2>"
							+ "</div><div><h2 ><a style=\"color: red\">●</a> <a href=\""+link04+"\" >"+title04+"</a></h2>"
							+ "</div><div><h2 ><a style=\"color: red\">●</a> <a href=\""+link05+"\" >"+title05+"</a></h2>"
							+ "</div>  <a href=\"http://www.xinxueshuo.cn/index.php?s=/Home/Article/lists/category/zxdt\"><b>查看更多</b></a> </div></div></div>", "text/html;charset=UTF-8");
					
			//			3、发送激活邮件
			Transport.send(message);
			
		}
}
