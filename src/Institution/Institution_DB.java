package Institution;
import java.sql.*;
import java.util.*;
import javax.sql.*;

import people.People_model;
		
	public class Institution_DB {	
		String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
		String username = "root";
		String password = "123456";
		
			public static List<Institution_model> Search(String sql)
			{
				List<Institution_model> list = new ArrayList<Institution_model>();
				try
				{	
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
					String username = "root";
					String password = "123456";
	
					Connection conn = DriverManager.getConnection(url,username,password);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					
					while(rs.next()){				
						Institution_model Institution = new Institution_model();
						Institution.setId(rs.getInt(1));
						Institution.setName(rs.getString(2));
						Institution.setAreas(rs.getString(3));
						Institution.setCEO(rs.getString(4));
						Institution.setService(rs.getString(5));
						Institution.setTelephone(rs.getString(6));
						Institution.setAddress(rs.getString(7));
						Institution.setMail(rs.getString(8));
						Institution.setIntroduction(rs.getString(9));
						Institution.setInvestment(rs.getString(10));
						Institution.setRemark(rs.getString(11));
						
						list.add(Institution);
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
					System.out.println("Institution DB.java:搜索sql异常");	
				}
				return list;
			}
			
			public static List<Institution_model> Insert(String sql)
			{
				List<Institution_model> list = new ArrayList<Institution_model>();
				try
				{	
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
					String username = "root";
					String password = "123456";
					boolean i=false;
					Connection conn = DriverManager.getConnection(url,username,password);
					Statement stmt = conn.createStatement();
	//				ResultSet rs = stmt.executeQuery(sql);
					i=stmt.execute(sql);
					
					System.out.println("People DB.java:插入：插入动作已执行");	
		            //关闭结果集,语句
		           
		            stmt.close();
		            conn.close();
				}
				catch(Exception e)
				{
					System.out.println("People DB.java:插入：插入sql异常");	
					e.printStackTrace();
				}
				return list;
			}
			
}
