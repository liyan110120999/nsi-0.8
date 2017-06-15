package people;
import java.sql.*;
import java.util.*;
import javax.sql.*;
public class DB {
	
	
	String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
	String username = "root";
	String password = "123456";
	
	public static List<People_model> Search(String sql)
	{
		List<People_model> list = new ArrayList<People_model>();
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
				People_model people = new People_model();
				people.setPeople_id(rs.getInt("People_id"));
				people.setPeople_name(rs.getString("People_name"));
				people.setPeople_member(rs.getString("People_member"));
				people.setPeople_dueTime(rs.getString("People_dueTime"));
				people.setPeople_work(rs.getString("People_work"));
				people.setPeople_position(rs.getString("People_position"));
				people.setPeople_phone(rs.getString("People_phone"));
				people.setPeople_mail(rs.getString("People_mail"));
				people.setPeople_telephone(rs.getString("People_telephone"));
				people.setPeople_wechat(rs.getString("People_wechat"));
				people.setPeople_loadPeople(rs.getString("People_loadPeople"));
				people.setPeople_loadTime(rs.getString("People_loadTime"));
				people.setPeople_address(rs.getString("People_address"));
				people.setPeople_introduction(rs.getString("People_introduction"));
				people.setPeople_remark(rs.getString("People_remark"));
				people.setPeople_ImgUrl(rs.getString("People_ImgUrl"));
				list.add(people);
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
			System.out.println("People DB.java:搜索sql异常");	
		}
		return list;
	}
	
	public static List<People_model> Insert(String sql)
	{
		List<People_model> list = new ArrayList<People_model>();
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
			String username = "root";
			String password = "123456";
			boolean i=false;
			Connection conn = DriverManager.getConnection(url,username,password);
			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery(sql);
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
	
	
	public static List<People_model> Delete(String sql)
	{
		List<People_model> list = new ArrayList<People_model>();
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
			String username = "root";
			String password = "123456";
			boolean i=false;
			Connection conn = DriverManager.getConnection(url,username,password);
			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery(sql);
			i=stmt.execute(sql);
			
			System.out.println("People DB.java:删除：删除动作已执行");	
            //关闭结果集,语句
           
            stmt.close();
            conn.close();
		}
		catch(Exception e)
		{
			System.out.println("People DB.java:删除sql异常");	
			e.printStackTrace();
		}
		return list;
	}

	
	public static List<People_model> alter(String sql)
	{
		List<People_model> list = new ArrayList<People_model>();
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
			String username = "root";
			String password = "123456";
			int i=-1;
			Connection conn = DriverManager.getConnection(url,username,password);
			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery(sql);
			i=stmt.executeUpdate(sql);
			
			System.out.println("DB.java:修改：修改sql已执行,影响行数："+i);	
            //关闭结果集,语
           
            stmt.close();
            conn.close();
		}
		catch(Exception e)
		{
			System.out.println("DB.java:修改：修改sql异常");	
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static int count(String sql)
	{
//		List<People_model> list = new ArrayList<People_model>();
		int countNum=-1;
		try{	
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/NSI_DATABASE?useSSL=true";
			String username = "root";
			String password = "123456";
			
			
			Connection conn = DriverManager.getConnection(url,username,password);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			rs.last();
			countNum=rs.getRow();
			System.out.println("People DB.java:计数："+countNum);	
                     
			 rs.close();
	         stmt.close();
	         conn.close();
		}
		catch(Exception e)
		{
			System.out.println("People DB.java:计数sql异常");	
			e.printStackTrace();
		}
		return countNum;
	}
}
