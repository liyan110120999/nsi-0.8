package bean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 锟斤拷锟斤拷锟斤拷菘锟斤拷锟阶拷岬斤拷锟斤拷锟斤拷锟斤拷
			Class.forName("com.mysql.jdbc.Driver");
			// 锟斤拷菘锟斤拷锟斤拷锟斤拷址锟�
			String url = "jdbc:mysql://localhost:3306/NSI_DATABASE";
			// 锟斤拷菘锟斤拷没锟斤拷锟�
			String username = "root";
			// 锟斤拷菘锟斤拷锟斤拷锟�
			String password = "123456";
			// 锟斤拷锟斤拷Connection锟斤拷锟斤拷
			Connection conn = DriverManager.getConnection(url,username,password);
			Connection connCount01 = DriverManager.getConnection(url,username,password);
			Connection connCount02 = DriverManager.getConnection(url,username,password);
			Connection connCount03 = DriverManager.getConnection(url,username,password);
			Connection connCount04 = DriverManager.getConnection(url,username,password);
			Statement stmt = conn.createStatement();
			Statement stmtCount01 = connCount01.createStatement();
			Statement stmtCount02 = connCount02.createStatement();
			Statement stmtCount03 = connCount03.createStatement();
			Statement stmtCount04 = connCount04.createStatement();
			List<Book> list = new ArrayList<Book>();
			// 锟斤拷锟酵硷拷锟斤拷锟较拷锟絊QL锟斤拷锟�
			String sql = "select * from nsi_school_data limit 0,100";	
			//全部数据
			String sqlcount01 = "SELECT * FROM nsi_school_data";
			
			String sqlcount02 = "SELECT * FROM nsi_school_data  WHERE Areas ='上海'";
			String sqlcount03 = "SELECT * FROM nsi_school_data  WHERE Areas ='北京'";
			String sqlcount04 = "SELECT * FROM nsi_school_data  WHERE Areas ='广东'";
		
			
			ResultSet rs = stmt.executeQuery(sql);
			
			ResultSet rsCount01 = stmtCount01.executeQuery(sqlcount01);	
			ResultSet rsCount02 = stmtCount02.executeQuery(sqlcount02);	
			ResultSet rsCount03 = stmtCount03.executeQuery(sqlcount03);
			ResultSet rsCount04 = stmtCount04.executeQuery(sqlcount04);
			
			
//			int countRS =0;
//			int countRS02 =0;
//			int countRS03 =0;
//			int countRS04 =0;
//			
//			
//			
//			while(rsCount02.next()){
//				countRS02++;
//			}
//			while(rsCount03.next()){
//				countRS03++;
//			}
//			while(rsCount04.next()){
//				countRS04++;
//			}
			
			
			while(rs.next()){
				System.out.println("有结果集have something");	
				Book book = new Book();
				book.setName(rs.getString("School_name"));
				book.setTeacher_number(rs.getInt("Teacher_number"));
				list.add(book);
				
			}
			
			//测试记录总数
			rs.last();
			rsCount01.last();
			rsCount02.last();
			rsCount03.last();
			rsCount04.last();
		
			int countAllRS = rs.getRow();
			int countRS01 = rsCount01.getRow();
			int countRS02 = rsCount02.getRow();
			int countRS03 = rsCount03.getRow();
			int countRS04 = rsCount04.getRow();

			
			
			
			
			
			
			
//			System.out.println(countRS);
			request.setAttribute("sqlcount01", countRS01);
			request.setAttribute("sqlcount02", countRS02);
			request.setAttribute("sqlcount03", countRS03);
			request.setAttribute("sqlcount04", countRS04);
			
			request.setAttribute("countAllRS", countAllRS);
			
			
			request.setAttribute("list", list);
			rs.close();	
			stmt.close();	// 锟截憋拷Statement
			conn.close();
			
			rsCount01.close();	
			rsCount02.close();	
			rsCount03.close();	
			rsCount04.close();	
			
			stmtCount01.close();
			stmtCount02.close();
			stmtCount03.close();
			stmtCount04.close();
			
			connCount01.close();
			connCount02.close();
			connCount03.close();
			connCount04.close();
			
			
			Connection connCount05 = DriverManager.getConnection(url,username,password);
			Statement stmtCount05 = connCount05.createStatement();
			String sqlcount05 = "SELECT * FROM nsi_school_data  WHERE Areas ='浙江'";
			ResultSet rsCount05 = stmtCount05.executeQuery(sqlcount05);	
			int countRS05 =0;
			while(rsCount05.next()){
							countRS05++;
						}
			request.setAttribute("sqlcount05", countRS05);
			rsCount05.close();	
			stmtCount05.close();
			connCount05.close();
			
		
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 锟斤拷锟斤拷转锟斤拷锟斤拷book_list.jsp
		
		
		request.getRequestDispatcher("book_list.jsp").forward(request, response);
	}
}
