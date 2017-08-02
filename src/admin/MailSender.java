package admin;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import people.DB;



@WebServlet("/MailSender")
	public class MailSender extends HttpServlet {
			public static final long serialVersionUID = 2L;
	
			protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
			    	this.doPost(request,response);
			    
			}
			public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
				
				String whereFrom=request.getParameter("whereFrom");
				
				if(whereFrom.equals("sendMail")){
					try
					{		
						String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
						String username = "root";
						String password = "123456";
						String sql="SELECT * from weeklymail;";
						
						Connection conn = DriverManager.getConnection(url,username,password);
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery(sql);
						
//						获取内容
						String title01=request.getParameter("title01");
						String title02=request.getParameter("title02");
						String title03=request.getParameter("title03");
						String title04=request.getParameter("title04");
						String title05=request.getParameter("title05");
						String title06=request.getParameter("title06");
											
						String content01=request.getParameter("content01");
						String content02=request.getParameter("content02");
						String content03=request.getParameter("content03");
						String content04=request.getParameter("content04");
						String content05=request.getParameter("content05");
						String content06=request.getParameter("content06");
											
						String link01=request.getParameter("link01");
						String link02=request.getParameter("link02");
						String link03=request.getParameter("link03");
						String link04=request.getParameter("link04");
						String link05=request.getParameter("link05");
						String link06=request.getParameter("link06");
						
						
						while(rs.next()){				
							weeklyMail.sendMail(rs.getString("mail"),title01,title02,title03,title04,title05,title06,
																	content01,content02,content03,content04,content05,content06,
																	link01,link02,link03,link04,link05,link06);
							System.out.println(rs.getString("mail"));
						}
						rs.last();
			            //关闭结果集,语句
			            rs.close();
			            stmt.close();
			            conn.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
						System.out.println("MailSender.java:sql异常或发送Mail异常");	
					}
//				增加邮件联系人
				}else if (whereFrom.equals("AddMailUser")) {
					
//						获取内容
						String name=request.getParameter("name");
						String email=request.getParameter("email");
	
						String sql="INSERT INTO weeklymail(name,mail)VALUES ('"+name+"','"+email+"')";	
						DB.Insert(sql);
						
						response.sendRedirect("/nsi-0.8/Admin/Mailuser_list.jsp");
//						不可用
//						request.setAttribute("msg", "success");
//						request.getRequestDispatcher("/nsi-0.8/Admin/Mailuser_list.jsp").forward(request, response);
//						
				}

			}
		}

