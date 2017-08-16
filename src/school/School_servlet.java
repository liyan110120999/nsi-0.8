package school;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet(name="School_servlet",urlPatterns="/School_servlet",loadOnStartup=1)
public class School_servlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
    	this.doPost(request,response);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				String whereFrom = null;
				String School_searchKey = null;
				whereFrom = request.getParameter("whereFrom");
				School_searchKey = request.getParameter("School_searchKey");
				
		//		分页参数
				Integer pageNum = request.getParameter("pageNum") != null && !request.getParameter("pageNum").equals("") ? Integer.parseInt(request.getParameter("pageNum")) : 1;
				int OnePageNum=20;
				int pageNumX=(pageNum-1)*OnePageNum;
				
				HttpSession session=request.getSession(); 
				
				System.out.println("school-servlet:正在运行  页数： "+pageNum+"第一页数："+pageNumX);	
		
				
		if(whereFrom.equals("search")){
			int insertcount = 0;
			int countAllRS = 0;
//			搜索选项		
//			String searchMenu=request.getParameter("searchMenu");
							
			String sql=null;		
			String sqlcount=null;
			List<School_model> list = new ArrayList<School_model>();	
			
//			SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like'%<%=School_name%>%' order by CONVERT(School_name USING gb2312) limit <%=(pageNum-1)*OnePageNum%>,<%=OnePageNum%>;
			 sql="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312) limit 0,20";
			 sqlcount="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312)";

	
			System.out.println("school：搜索语句："+sql);
			
			list=School_DB.Search(sql);
			countAllRS=DB.count(sqlcount);
			
			session.setAttribute("School_searchKey_session",School_searchKey);		
			session.setAttribute("countAllRS",countAllRS);		
			session.setAttribute("currentPage",pageNum);	//当前页
			//request.setAttribute("countAllRS", "11");	    //搜索结果数
//			request.setAttribute("insertcount", insertcount);	//新增成功数
			request.setAttribute("list", list);	
			
//			 空展示
			session.setAttribute("school_nullShow","1");									
			request.getRequestDispatcher("school/school_list.jsp").forward(request, response);
			
			
			
		}else if(whereFrom.equals("detail")){
			int insertcount = 0;
			int countAllRS = 0;
			String detail_school_id = null;			
			detail_school_id = request.getParameter("detail_school_id");	
			List<People_model> list = new ArrayList<People_model>();
	
			String sql="select * from nsi_school_data where school_name='"+detail_school_id+"' limit 0,2 ";
			//String sql="select * from nsi_people_data limit 0,100";
			list=DB.Search(sql);
			
			request.setAttribute("countAllRS", countAllRS);	    //搜索结果数
			request.setAttribute("insertcount", insertcount);	//新增成功数
			request.setAttribute("list", list);					
			request.getRequestDispatcher("school/school_detail.jsp").forward(request, response);
		}
	}
}
