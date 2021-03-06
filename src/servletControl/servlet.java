package servletControl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.School;
import people.DB;
import people.People_model;

/**
 * Servlet implementation class servlet
 */
@WebServlet("/servlet")
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request,response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(); 
		
		String whereFrom=request.getParameter("whereFrom");
		
		String action = request.getParameter("action");
		String School_name = request.getParameter("School_name");
		Integer pageNum = request.getParameter("PassPage") != null && !request.getParameter("PassPage").equals("") ? Integer.parseInt(request.getParameter("PassPage")) : null;
		String num_order=request.getParameter("num_order");
			
//高级搜索		
		if(whereFrom.equals("AdvancedSearch")){
			
			String[] checkbox01 = request.getParameterValues("checkbox01");
			if(checkbox01==null){
				System.out.println("school_servlet:数组 空");
			}else{
				for(int i = 0;i<checkbox01.length;i++){
					System.out.println("school_servlet:数组01:"+i+checkbox01[i]);
				}
			}	
			
			String[] checkbox02 = request.getParameterValues("checkbox02");
			if(checkbox02==null){
				System.out.println("school_servlet:数组 空");
			}else{
				for(int i = 0;i<checkbox02.length;i++){
					System.out.println("school_servlet:数组02:"+i+checkbox02[i]);
				}
			}	
			
			String[] checkbox03 = request.getParameterValues("checkbox03");
			if(checkbox03==null){
				System.out.println("school_servlet:数组 空");
			}else{
				for(int i = 0;i<checkbox03.length;i++){
					System.out.println("school_servlet:数组03:"+i+checkbox03[i]);
				}
			}	

			request.getRequestDispatcher("list.jsp").forward(request, response);
			
//			普通搜索模式
		}else if(whereFrom.equals("search")){		
				
				System.out.println("servlet.where:"+whereFrom);
	//			为school模块的搜索功能服务
				session.setAttribute("School_name",School_name);
				session.setAttribute("pageNum",pageNum);
				session.setAttribute("num_order",num_order);
				
				request.getRequestDispatcher("list.jsp").forward(request, response);
	//			测试入口
	//			request.getRequestDispatcher("/school/school_list.jsp").forward(request, response);
		    	//判断动作类型
		}else if(whereFrom.equals("bus")){		
			
			System.out.println("servlet.where:"+whereFrom);

			session.setAttribute("pageNum",pageNum);
			session.setAttribute("num_order",num_order);
		
			request.getRequestDispatcher("list.jsp").forward(request, response);
//				测试入口
//				request.getRequestDispatcher("/school/school_list.jsp").forward(request, response);
	    	//判断动作类型
		}else {
			System.out.println("servlet:whereFrom 错误！！！");
		}
	
	}	
}


