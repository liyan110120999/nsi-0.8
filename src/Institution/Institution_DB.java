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
						Institution.setName(rs.getString("Name"));
						Institution.setAreas(rs.getString("Areas"));
						Institution.setCEO(rs.getString("CEO"));
						Institution.setLegalPerson(rs.getString("LegalPerson"));
						Institution.setType(rs.getString("Type"));
						Institution.setServiceType(rs.getString("ServiceType"));
						
						Institution.setService(rs.getString("Service"));
						Institution.setTelephone(rs.getString("Telephone"));
						Institution.setAddress(rs.getString("Address"));
						Institution.setMail(rs.getString("Mail"));						
						Institution.setWebsite(rs.getString("Website"));
						
						Institution.setIntroduction(rs.getString("Introduction"));
						Institution.setInvestment(rs.getString("Investment"));
						Institution.setRemark(rs.getString("Remark"));
						
						Institution.setLoad_people(rs.getString("Load_people"));
						Institution.setLoad_time(rs.getString("Load_time"));
						
						list.add(Institution);
					}
					rs.last();
		            //�رս����,���
		            rs.close();
		            stmt.close();
		            conn.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
					System.out.println("Institution DB.java:����sql�쳣");	
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
					
					System.out.println("Institution DB.java:���룺���붯����ִ��");	
		            //�رս����,���
		           
		            stmt.close();
		            conn.close();
				}
				catch(Exception e)
				{
					System.out.println("Institution DB.java:���룺����sql�쳣");	
					e.printStackTrace();
				}
				return list;
			}
			
			public static List<Institution_model> alter(String sql)
			{
				List<Institution_model> list = new ArrayList<Institution_model>();
				try
				{	
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
					String username = "root";
					String password = "123456";
					int i=-1;
					Connection conn = DriverManager.getConnection(url,username,password);
					Statement stmt = conn.createStatement();
//					ResultSet rs = stmt.executeQuery(sql);
					i=stmt.executeUpdate(sql);
					
					System.out.println("Institution_DB.java:�޸ģ��޸�sql��ִ��,Ӱ��������"+i);	
		            //�رս����,���
		           
		            stmt.close();
		            conn.close();
				}
				catch(Exception e)
				{
					System.out.println("Institution_DB.java:�޸ģ��޸�sql�쳣");	
					e.printStackTrace();
				}
				return list;
			}
			
			public static List<Institution_model> Delete(String sql)
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
//					ResultSet rs = stmt.executeQuery(sql);
					i=stmt.execute(sql);
					
					System.out.println("Institution_DB.java:ɾ����ɾ��������ִ��");	
		            //�رս����,���
		           
		            stmt.close();
		            conn.close();
				}
				catch(Exception e)
				{
					System.out.println("Institution_DB.java:ɾ��sql�쳣");	
					e.printStackTrace();
				}
				return list;
			}
			
}
