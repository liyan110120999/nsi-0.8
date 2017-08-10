package admin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import people.DB;



@WebServlet("/MailSender")
	public class MailSender extends HttpServlet {
			public static final long serialVersionUID = 2L;
			
//			Properties配置文件
			private static String propFileName = "../properties/WeeklyMail.properties"; // 指定资源文件保存的位置
			private static Properties prop = new Properties(); // 创建并实例化Properties对象的实例
	
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
//				测试发送
				}else if (whereFrom.equals("testSend")) {
					
					try
					{		
						
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
						
						
			
							weeklyMail.sendMail("1453485414@qq.com",title01,title02,title03,title04,title05,title06,
																	content01,content02,content03,content04,content05,content06,
																	link01,link02,link03,link04,link05,link06);
							
							weeklyMail.sendMail("hemiao@xinxueshuo.cn",title01,title02,title03,title04,title05,title06,
									content01,content02,content03,content04,content05,content06,
									link01,link02,link03,link04,link05,link06);
							System.out.println("测试发送1453485414@qq.com");

					}
					catch(Exception e)
					{
						e.printStackTrace();
						System.out.println("MailSender.java:sql异常或发送Mail异常");	
					}
				
//				测试Properties
				}else if (whereFrom.equals("testP")) {
					try { // 捕捉异常
						System.out.println("测试：Properties执行");
						// 将Properties文件读取到InputStream对象中
						InputStream in = getClass().getResourceAsStream(propFileName);
						prop.load(in); // 通过输入流对象加载Properties文件
						String dbClassName = prop.getProperty("MailNum"); // 获取数据库驱动
						System.out.println("Properties文件:"+dbClassName);
					} catch (Exception e) {
						e.printStackTrace(); // 输出异常信息
					} 
					
					
				
				}

			}
		}

