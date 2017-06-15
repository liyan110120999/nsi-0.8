package school;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="School_servlet",urlPatterns="/School_servlet",loadOnStartup=1)
public class School_servlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	this.doPost(request,response);
    
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String aaa01 = request.getParameter("aaa01");
//		
//		System.out.println("school_servlet:aaa01"+aaa01);
//		
//		String tempString = request.getParameter("tempString");
//		System.out.println("school_servlet:tempString:"+tempString);
		
	
		String[] checkbox03 = request.getParameterValues("checkbox03");
		if(checkbox03==null){
			System.out.println("school_servlet:数组 空");
		}else{
			for(int i = 0;i<checkbox03.length;i++){
				System.out.println("school_servlet:数组:"+checkbox03[i]);
			}
		}	
	}
}
