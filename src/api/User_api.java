package api;

import java.io.IOException;
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
//					Ĭ��ֵΪ-2 ��ʾû�и��û�
					int member_sign=-2;
					int UserVerifyCode=000000;
//					����û��������code��ͨ������ת
				
					if(model.checkUser(name, pwd)){									
//						��ȡ�û���־λ
						member_sign=model.queryByName(name).getMember_sign();
						System.out.println("User_api:�û���־λ��"+member_sign);						
						UserVerifyCode=name.length()*member_sign+987654;
					}else{
						System.out.println("User_api:����У�����");			
					}
	
					Gson gson = new Gson();   	
			
					String back="{\"member_sign\":\""+member_sign+"\","
								+ "\"username\":\""+name+"\","
								+ "\"UserVerifyCode\":\""+UserVerifyCode+"\"}";

			    	String Callback = request.getParameter("Callback");//�ͻ����������	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
			    	
				}else if(whereFrom.equals("verify")){
					String name = request.getParameter("username");
					String member_sign = request.getParameter("member_sign");
					String UserVerifyCode = request.getParameter("UserVerifyCode");
//					1���û��治���ڣ�
//					2��Ȩ�ޱ��λ�Ƿ���ȷ��
//					3��У����Ƿ���ȷ��
					System.out.println("У���˺����룺"+name+member_sign+UserVerifyCode);
					
					Model model=new Model();
					int verifyResult=model.UserVerify(name,member_sign,UserVerifyCode);
					
					Gson gson = new Gson();   					
					String back="{\"verifyResult\":\""+verifyResult+"\"}";

			    	String Callback = request.getParameter("Callback");//�ͻ����������	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
			    	
//				��������
			    }else if(whereFrom.equals("forgetPW")){
					String mail = request.getParameter("mail");
		//			1�����û��治���ڣ�
		//			2��������֤���ʼ�
		//			3����֤���Ƿ���ȷ��
					int msg=-2;
					System.out.println("User_api:�������룺"+mail);
					Model model=new Model();
					if (model.UserExistence(mail)>=1) {
//						�������
						try {
							//������������ ��֤��
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
						System.out.println("User_api:��������:���䲻���ڣ���");
						msg=-1;
					}
									
					String back="{\"msg\":\""+msg+"\"}";
		
			    	String Callback = request.getParameter("Callback");//�ͻ����������	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
			    	
				}else if(whereFrom.equals("forgetPWverify")){
					String mail = request.getParameter("mail");
					String code00 = request.getParameter("code");
					int code=Integer.parseInt(code00);
		//			1����ȡ����
		//			2��У�� ע�⡰Сʱ������Ҫ+1�ж�
		//			3������ֵ ԭmail ����Ȩ���Ը�����
					int msg=-2;
					System.out.println("User_api:��������У�飺"+mail+"&"+code);
					Model model=new Model();

					//����ʱ����ʼ���ַ�ַ����ȵļ����㷨	
					Calendar time = Calendar.getInstance();
					System.out.println("ForgetPWsendMail:cc�����㷨��hour:"+time.get(Calendar.HOUR_OF_DAY));
					int time_hour =time.get(Calendar.HOUR_OF_DAY);
					int cc=mail.length()*time_hour+987654;
					int cc02=mail.length()*(time_hour+1)+987654;
					
					if (code==cc|code==cc02) {
						msg=1;						
					} else {
						System.out.println("User_api:����������֤:��֤�벻��ȷ������");
						msg=-1;
					}
									
					String back="{\"msg\":\""+msg+"\"}";
		
			    	String Callback = request.getParameter("Callback");//�ͻ����������	  	    	
			    	response.setContentType("text/html;charset=UTF-8");  
			    	response.getWriter().write(Callback+"("+back+")");
			    	System.out.println(Callback+"("+back+")");
				}
				
	    }
}
