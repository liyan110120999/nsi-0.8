package school;

import java.sql.*;
import java.util.*;

import people.People_model;

public class School_DB {
	
//	搜索 返回list
	public static List<School_model> Search(String sql)
	{
		List<School_model> list = new ArrayList<School_model>();
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
				School_model school = new School_model();				
				
				school.setSchool_name(rs.getString("School_name"));
				school.setSchool_properties(rs.getString("School_properties"));
				school.setAreas(rs.getString("Areas"));
				school.setFounded_time(rs.getString("Founded_time"));
				school.setSchool_system(rs.getString("School_system"));
				school.setCourse(rs.getString("Course"));
				school.setPresident(rs.getString("President"));
				school.setPresident_country(rs.getString("President_country"));
				school.setTeacher_number(rs.getString("Teacher_number"));
				school.setForeign_teacher_num(rs.getString("Foreign_teacher_num"));
				school.setTeacher_salary(rs.getString("Teacher_salary"));
				school.setNum_students(rs.getString("Num_students"));
				school.setGraduating_stu_num(rs.getString("Graduating_stu_num"));
				school.setExtra_curricular_edu(rs.getString("Extra_curricular_edu"));
				school.setCovered_area(rs.getString("Covered_area"));
				school.setBuilt_area(rs.getString("Built_area"));
				school.setTuition(rs.getString("Tuition"));
				school.setWebsite(rs.getString("website"));
				school.setLoad_people(rs.getString("load_people"));
				school.setLoad_time(rs.getString("load_time"));
				school.setInvestment(rs.getString("Investment"));
				school.setRemark(rs.getString("remark"));
				list.add(school);
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
