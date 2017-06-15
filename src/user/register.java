package user;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.User_model;
import people.DB;

	public class register extends HttpServlet {
		public static final long serialVersionUID = 2L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		    	this.doPost(request,response);
		    
		}
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			
//			String whereFrom=null;		
//			whereFrom = request.getParameter("whereFrom");
//			
			String Email=request.getParameter("Email");
			String Name=request.getParameter("Name");
			String company=request.getParameter("company");
			String position=request.getParameter("position");
			String Passwd01=request.getParameter("Passwd01");
			String User_phone=request.getParameter("phone");
			
			System.out.println("register.java:"+Email+Name+company+Passwd01);
			
//			发送邮件
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
//				录入数据库  ，"-1"为用户状态标志位
				String sql="INSERT INTO nsi_user (UserName,Password,Member_sign,User_TureName,User_Organization,User_position,User_phone,User_registerCode)"
							+ "VALUES ('"+Email+"','"+Passwd01+"','-1','"+Name+"','"+company+"','"+position+"','"+User_phone+"','"+code+"')";
				DB.Insert(sql);
				
//			验证邮箱激活码
			}else if(request.getParameter("registerCode")!=null){
				String registerCode=request.getParameter("registerCode");
				String UserMail=request.getParameter("UserMail");
				
				System.out.println("register.java:收到邮箱链接"+registerCode+UserMail);
				
//				修改状态码
				String sql="UPDATE nsi_user SET Member_sign='1' WHERE UserName='"+UserMail+"' ";
				DB.alter(sql);
				
			}
			

		}
}
