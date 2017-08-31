package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class User_DB {
	public static List<User_model> Search(String sql)
	{
		List<User_model> list = new ArrayList<User_model>();
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
				User_model user = new User_model();				
				
				user.setName(rs.getString("username"));
				user.setMember_sign(rs.getInt("Member_sign"));
				user.setUser_TureName(rs.getString("User_TureName"));

//				未完整

				list.add(user);
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
			System.out.println("School_DB.java:搜索sql异常");	
		}
		return list;
	}
}
