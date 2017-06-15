package servletControl;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model;
import entity.User;

public class ServletControl extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ServletControl() {
		super();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		
		String Userfal = "userfal";
		String Codefal = "Codefal";
		HttpSession session=request.getSession(); 
		
		Model model=new Model();
		User user=new User();
//		����û��������code��ͨ������ת
		if(model.checkUser(name, pwd)){
			if(model.queryByCode(name)){
				
//				��ȡ�û���־λ��ͨ��session����ҳ��
				int member_sign=model.queryByName(name).getMember_sign();
				System.out.println("servletControl:�û���־λ��"+member_sign);
				
				session.setAttribute("Session_user",name);
				session.setAttribute("Session_userMember_sign",member_sign);
				response.sendRedirect("list.jsp");	
			}else{
//		code��֤ûͨ��
			request.setAttribute("loginResult",Codefal);	
			request.getRequestDispatcher("login.jsp").forward(request, response);
			} 
		}
		else{
//		�û���֤ûͨ��			
			request.setAttribute("loginResult",Userfal);	
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
			}
		}
	}


