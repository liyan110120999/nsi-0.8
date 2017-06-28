package Institution;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import people.DB;
import people.People_model;

@WebServlet("/Institution_servlet")
public class Institution_servlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String whereFrom = null;
		String Institution_searchKey =null;
		whereFrom = request.getParameter("whereFrom");
		Institution_searchKey = request.getParameter("Institution_searchKey");
		
//		分页参数
		Integer pageNum = request.getParameter("pageNum") != null && !request.getParameter("pageNum").equals("") ? Integer.parseInt(request.getParameter("pageNum")) : 1;
		int OnePageNum=20;
		int pageNumX=(pageNum-1)*OnePageNum;
		
		HttpSession session=request.getSession(); 
				
		if(whereFrom.equals("search")){
			int insertcount = 0;
			int countAllRS = 0;
//			搜索选项		
			String searchMenu=request.getParameter("searchMenu");
							
			String sql=null;		
			String sqlcount=null;
			List<Institution_model> list = new ArrayList<Institution_model>();
	
//			选项搜索
			if(searchMenu.equals("教育")){				
				 sql="select * from nsi_Institution_data where CONCAT(IFNULL(`Name`,''),IFNULL(`CEO`,''),IFNULL(`Service`,''),IFNULL(`Remark`,'')) like '%"+Institution_searchKey+"%'limit "+pageNumX+","+(pageNumX+OnePageNum)+"";	
				 sqlcount="select * from nsi_Institution_data where CONCAT(IFNULL(`Name`,''),IFNULL(`CEO`,''),IFNULL(`Service`,''),IFNULL(`Remark`,'')) like '%"+Institution_searchKey+"%' ";
			}else if(searchMenu.equals("投资")){
				 sql="select * from nsi_Institution_data where CONCAT(IFNULL(`Name`,''),IFNULL(`CEO`,''),IFNULL(`Service`,''),IFNULL(`Remark`,'')) like '%"+Institution_searchKey+"%'limit "+pageNumX+","+(pageNumX+OnePageNum)+"";	
				 sqlcount="select * from nsi_Institution_data where CONCAT(IFNULL(`Name`,''),IFNULL(`CEO`,''),IFNULL(`Service`,''),IFNULL(`Remark`,'')) like '%"+Institution_searchKey+"%' ";
			}else {
				 sql="select * from nsi_Institution_data where CONCAT(IFNULL(`Name`,''),IFNULL(`CEO`,''),IFNULL(`Service`,''),IFNULL(`Remark`,'')) like '%"+Institution_searchKey+"%'limit "+pageNumX+","+(pageNumX+OnePageNum)+"";	
				 sqlcount="select * from nsi_Institution_data where CONCAT(IFNULL(`Name`,''),IFNULL(`CEO`,''),IFNULL(`Service`,''),IFNULL(`Remark`,'')) like '%"+Institution_searchKey+"%' ";
			}
	
			System.out.println("搜索语句："+searchMenu+sql);
			
			list=Institution_DB.Search(sql);
//			people 的DB count 可复用
			countAllRS=DB.count(sqlcount);
			
			session.setAttribute("Institution_searchKey_session",Institution_searchKey);		
			session.setAttribute("Institution_countAllRS",countAllRS);		
			session.setAttribute("Institution_currentPage",pageNum);	//当前页
			//request.setAttribute("countAllRS", "11");	    //搜索结果数
			request.setAttribute("insertcount", insertcount);	//新增成功数
			request.setAttribute("Institution_list", list);	
								
			request.getRequestDispatcher("institution/Institution_list.jsp").forward(request, response);
		}else if(whereFrom.equals("insert")){
			
			int countAllRS = 0;
			String Institution_name = request.getParameter("Institution_name");	
			String Institution_Areas = request.getParameter("Institution_Areas");		
			String Institution_CEO = request.getParameter("Institution_CEO");		
			String Institution_Service = request.getParameter("Institution_Service");		
			String Institution_Telephone = request.getParameter("Institution_Telephone");		
			String Institution_Address = request.getParameter("Institution_Address");		
			String Institution_Mail = request.getParameter("Institution_Mail");		
			String Institution_Introduction = request.getParameter("Institution_Introduction");		
			String Institution_loadPeople = request.getParameter("Institution_loadPeople");		
			String Institution_loadTime = request.getParameter("Institution_loadTime");		
			String Institution_Investment = request.getParameter("Institution_Investment");		
			String Institution_Remark = request.getParameter("Institution_Remark");		
		
			List<People_model> list = new ArrayList<People_model>();
	
			String sql="INSERT INTO nsi_institution_data (Name,Areas,CEO,Service,Telephone,Address,Mail,Introduction,Investment,Remark,Load_people,Load_time) "
					+ "VALUES ('"+Institution_name+"','"+Institution_Areas+"','"+Institution_CEO+"','"+Institution_Service+"','"+Institution_Telephone+"','"+Institution_Address+"','"+Institution_Mail+"','"+Institution_Introduction+"','"+Institution_loadPeople+"','"+Institution_loadTime+"','"+Institution_Investment+"','"+Institution_Remark+"')";

			DB.Insert(sql);
			
			request.setAttribute("countAllRS", countAllRS);	    //搜索结果数
		
			request.getRequestDispatcher("institution/Institution_list.jsp").forward(request, response);
		}		
	}
}