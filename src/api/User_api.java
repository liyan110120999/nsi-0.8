package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import entity.User;
import model.Model;
import people.DB;
import user.Mail;
import user.RandomCode;
import user.User_model;

@WebServlet("/User_api")
public class User_api extends HttpServlet{

	private static final long serialVersionUID = 6311813463986313971L;
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        this.doPost(request,response);
	    }
	    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			    	String whereFrom = null;
					whereFrom = request.getParameter("whereFrom");
				
				if(whereFrom.equals("login")){
					
					String name = request.getParameter("username");
					String pwd = request.getParameter("pwd");
					
					Model model=new Model();
					User user=new User();
//					默认值为-2 表示没有该用户
					int member_sign=-2;
					int UserVerifyCode=000000;
//					如果用户名密码和code都通过，跳转
				
					if(model.checkUser(name, pwd)){									
//						获取用户标志位
						member_sign=model.queryByName(name).getMember_sign();
						System.out.println("User_api:用户标志位："+member_sign);						
						UserVerifyCode=name.length()*member_sign+987654;
					}else{
						System.out.println("User_api:密码校验错误");			
					}
	
					Gson gson = new Gson();   	
			
					String back="{\"member_sign\":\""+member_sign+"\","
								+ "\"username\":\""+name+"\","
								+ "\"UserVerifyCode\":\""+UserVerifyCode+"\"}";

			    	String Callback = request.getParameter("Callback");//客户端请求参数	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
			    	
				}else if(whereFrom.equals("verify")){
					String name = request.getParameter("username");
					String member_sign = request.getParameter("member_sign");
					String UserVerifyCode = request.getParameter("UserVerifyCode");
//					1、用户存不存在？
//					2、权限标记位是否正确？
//					3、校验和是否正确？
					System.out.println("校验账号密码："+name+member_sign+UserVerifyCode);
					
					Model model=new Model();
					int verifyResult=model.UserVerify(name,member_sign,UserVerifyCode);
					
					Gson gson = new Gson();   					
					String back="{\"verifyResult\":\""+verifyResult+"\"}";

			    	String Callback = request.getParameter("Callback");//客户端请求参数	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
//			    新用户注册
				}else if(whereFrom.equals("register")){
					String Email=request.getParameter("Email");
					String Name=request.getParameter("Name");
					String company=request.getParameter("company");
					String position=request.getParameter("position");
					String Passwd01=request.getParameter("Passwd01");
					String User_phone=request.getParameter("phone");
								
					// 获取时间
					java.util.Date currentTime = new java.util.Date(); 
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					String User_loadTime = formatter.format(currentTime);
					
					int msg=-2;
//					发送邮件
					if(Email!=null){
						User_model user=new User_model();
						
						user.setName(Email);
						
						String code = RandomCode.getRandomCode();
			//			set			
						System.out.println(Email+code);
						try {
							//发送
							System.out.println("user.get的邮箱地址："+user.getName());
							Mail.sendMail(user.getName(), code);										
						} catch (MessagingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}			
//						录入数据库  ，"-1"为用户状态标志位
						String sql="INSERT INTO nsi_user (UserName,Password,Member_sign,User_TureName,User_Organization,User_position,User_phone,User_registerCode,Load_time)"
									+ "VALUES ('"+Email+"','"+Passwd01+"','-1','"+Name+"','"+company+"','"+position+"','"+User_phone+"','"+code+"','"+User_loadTime+"')";
						DB.Insert(sql);
					}
					msg=1;
					
					Gson gson = new Gson();   					
					String back="{\"msg\":\""+msg+"\"}";

			    	String Callback = request.getParameter("Callback");//客户端请求参数	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
			    
			    		    	
////					验证邮箱激活码
//				}else if(whereFrom.equals("registerCode")){
//					String registerCode=request.getParameter("registerCode");
//					String UserMail=request.getParameter("UserMail");
//					
//					System.out.println("register.java:收到邮箱链接"+registerCode+UserMail);
//					
////					修改状态码
//					String sql="UPDATE nsi_user SET Member_sign='0' WHERE UserName='"+UserMail+"' ";
//					DB.alter(sql);
//					
//					request.getRequestDispatcher("/nsi-0.8/User/registerSuccess.jsp");
//					response.sendRedirect("/nsi-0.8/User/registerSuccess.jsp");
////					跳转到激活成功界面
//			    	检查邮箱是否注册过
				}else if(whereFrom.equals("checkMail")){
					String checkMail=request.getParameter("checkMail");
					String sql="SELECT * FROM nsi_user WHERE UserName='"+checkMail+"' ";
					System.out.println("检查邮箱是否注册过："+checkMail+sql);
					int a=DB.count(sql);
					System.out.println("结果数："+a);
					int msg=-2;
					if(a<1){
						msg=1;
					}else{
						msg=-1;
					}
					
					String back="{\"msg\":\""+msg+"\"}";
					
			    	String Callback = request.getParameter("Callback");//客户端请求参数	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
		    	
//				忘记密码
			    }else if(whereFrom.equals("forgetPW")){
					String mail = request.getParameter("mail");
		//			1、该用户存不存在？
		//			2、发送验证码邮件
		//			3、验证码是否正确？
					int msg=-2;
					System.out.println("User_api:忘记密码："+mail);
					Model model=new Model();
					if (model.UserExistence(mail)>=1) {
//						邮箱存在
						try {
							//发送忘记密码 验证码
							Mail.ForgetPWsendMail(mail);
							
						} catch (MessagingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}	
						msg=1;
						
					} else {
						System.out.println("User_api:忘记密码:邮箱不存在！！");
						msg=-1;
					}
									
					String back="{\"msg\":\""+msg+"\"}";
		
			    	String Callback = request.getParameter("Callback");//客户端请求参数	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
			    	
				}else if(whereFrom.equals("forgetPWverify")){
					String mail = request.getParameter("mail");
					String code00 = request.getParameter("code");
					int code=Integer.parseInt(code00);
		//			1、获取参数
		//			2、校验 注意“小时数”需要+1判断
		//			3、返回值 原mail ，授权可以改密码
					int msg=-2;
					System.out.println("User_api:忘记密码校验："+mail+"&"+code);
					Model model=new Model();

					//基于时间和邮件地址字符长度的加密算法	
					Calendar time = Calendar.getInstance();
					System.out.println("ForgetPWsendMail:cc加密算法：hour:"+time.get(Calendar.HOUR_OF_DAY));
					int time_hour =time.get(Calendar.HOUR_OF_DAY);
					int cc=mail.length()*time_hour+987654;
					int cc02=mail.length()*(time_hour+1)+987654;
					
					if (code==cc|code==cc02) {
						msg=1;						
					} else {
						System.out.println("User_api:忘记密码验证:验证码不正确！！！");
						msg=-1;
					}
									
					String back="{\"msg\":\""+msg+"\"}";
		
			    	String Callback = request.getParameter("Callback");//客户端请求参数	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
				}
				
	    }
}
