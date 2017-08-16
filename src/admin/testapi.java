package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testapi")
public class testapi extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	this.doPost(request,response);
    	System.out.println("00");
}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String whereFrom = null;
		whereFrom = request.getParameter("whereFrom");
		if(whereFrom.equals("aaa")){
			String back="{\"name\":\"Brett\"}";
			System.out.println(back);
			
			String Callback = request.getParameter("Callback");//客户端请求参数
			
			
//			jsonpCallback
			System.out.println(Callback);
			
			response.getWriter().write(Callback+"("+back+")");
		}else{
			System.out.println("NO aaa");
		}
	}
}
