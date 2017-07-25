package Institution;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			session.setAttribute("Institution_countAllRS",countAllRS);		//搜索结果数
			
			session.setAttribute("Institution_currentPage",pageNum);	//当前页	
			request.setAttribute("insertcount", insertcount);	//新增成功数
			request.setAttribute("Institution_list", list);		
			
//			 空展示
			session.setAttribute("Institution_nullShow","1");	
			
			request.getRequestDispatcher("institution/Institution_list.jsp").forward(request, response);
			
		}else if(whereFrom.equals("insert")){
			
			int countAllRS = 1;
			String Institution_name = request.getParameter("Institution_name");	
			String Institution_Areas = request.getParameter("Institution_Areas");		
			String Institution_CEO = request.getParameter("Institution_CEO");
			String Institution_LegalPerson = request.getParameter("Institution_LegalPerson");
			
			String Institution_Type = request.getParameter("Institution_Type");		
			String Institution_ServiceType = request.getParameter("Institution_ServiceType");	
			
			String Institution_Service = request.getParameter("Institution_Service");		
			String Institution_Telephone = request.getParameter("Institution_Telephone");		
			String Institution_Address = request.getParameter("Institution_Address");		
			String Institution_Mail = request.getParameter("Institution_Mail");		
			String Institution_Website = request.getParameter("Institution_Website");		
			
			String Institution_Introduction = request.getParameter("Institution_Introduction");
			String Institution_Investment = request.getParameter("Institution_Investment");		
			String Institution_Remark = request.getParameter("Institution_Remark");				
			String Institution_loadPeople = request.getParameter("Institution_loadPeople");		
			String Institution_loadTime = request.getParameter("Institution_loadTime");
		
			String sql="INSERT INTO nsi_institution_data (Name,Areas,CEO,LegalPerson,Type,ServiceType,Service,Telephone,Address,Mail,Website,Introduction,Investment,Remark,Load_people,Load_time) "
					+ "VALUES ('"+Institution_name+"','"+Institution_Areas+"','"+Institution_CEO+"','"+Institution_LegalPerson+"','"+Institution_Type+"','"+Institution_ServiceType+"','"+Institution_Service+"','"+Institution_Telephone+"','"+Institution_Address+"','"+Institution_Mail+"','"+Institution_Website+"','"+Institution_Introduction+"','"+Institution_Investment+"','"+Institution_Remark+"','"+Institution_loadPeople+"','"+Institution_loadTime+"')";
					
//			request.setAttribute("countAllRS", countAllRS);	    //搜索结果数	
			session.setAttribute("Institution_countAllRS",countAllRS);		//搜索结果数
			
//			搜索修改结果返回给list
			List<Institution_model> list = new ArrayList<Institution_model>();
//			插入数据后 返回该数据的 list
			list=Institution_DB.Insert(sql);				
			System.out.println("Ins_insert:"+list);
			
			session.setAttribute("Institution_countAllRS",countAllRS);
			request.setAttribute("Institution_list", list);	
			request.getRequestDispatcher("institution/Institution_list.jsp").forward(request, response);	
			

			
//			请求-详细
		}else if(whereFrom.equals("detail")){
			
			String detail_Institution_id = null;			
			detail_Institution_id = request.getParameter("Insititution_id");	
			List<Institution_model> list = new ArrayList<Institution_model>();
			String sql="select * from nsi_institution_data where Id='"+detail_Institution_id+"' limit 0,100 ";
			list=Institution_DB.Search(sql);			
//			request.setAttribute("countAllRS", countAllRS);	    //搜索结果数
//			request.setAttribute("insertcount", insertcount);	//新增成功数
			request.setAttribute("Institution_list", list);					
			request.getRequestDispatcher("institution/Institution_detail.jsp").forward(request, response);
			
		}else if(whereFrom.equals("alterButton")){
			
			String alter_institution_id = request.getParameter("alter_institution_id");
			List<Institution_model> list = new ArrayList<Institution_model>();	
			String sql="select * from nsi_institution_data where Id='"+alter_institution_id+"' limit 0,1";
			list=Institution_DB.Search(sql);		
			request.setAttribute("list", list);   			
			request.getRequestDispatcher("institution/Institution_alter.jsp").forward(request, response);		
			
		}else if(whereFrom.equals("alter")){
			
			String Institution_id = request.getParameter("alter_Institution_id");
			
			String Institution_name = request.getParameter("Institution_name");
			String Institution_Areas = request.getParameter("Institution_Areas");
			String Institution_CEO = request.getParameter("Institution_CEO");
			String Institution_LegalPerson = request.getParameter("Institution_LegalPerson");
			
			String Institution_Type = request.getParameter("Institution_Type");
			String Institution_ServiceType = request.getParameter("Institution_ServiceType");	
			
			String Institution_Service = request.getParameter("Institution_Service");
			String Institution_Telephone = request.getParameter("Institution_Telephone");
			String Institution_Address = request.getParameter("Institution_Address");
			String Institution_Mail = request.getParameter("Institution_Mail");
			String Institution_Website = request.getParameter("Institution_Website");	
			
			String Institution_Introduction = request.getParameter("Institution_Introduction");
			String Institution_Investment = request.getParameter("Institution_Investment");
			String Institution_Remark = request.getParameter("Institution_Remark");

			String Institution_loadPeople = request.getParameter("username");
			String Institution_loadTime = request.getParameter("SubmitDate");
			
			List<Institution_model> list = new ArrayList<Institution_model>();
//			修改数据	
			String sql="UPDATE nsi_Institution_data SET Name='"+Institution_name+"',Areas='"+Institution_Areas+"',CEO='"+Institution_CEO+"',LegalPerson='"+Institution_LegalPerson+"',Type='"+Institution_Type+"',ServiceType='"+Institution_ServiceType+"',Service='"+Institution_Service+"',Telephone='"+Institution_Telephone+"',Address='"+Institution_Address+"',Mail='"+Institution_Mail+"',Website='"+Institution_Website+"',Introduction='"+Institution_Introduction+"',Investment='"+Institution_Investment+"',Remark='"+Institution_Remark+"',Load_people='"+Institution_loadPeople+"',Load_time='"+Institution_loadTime+"'"
					+ "WHERE Id='"+Institution_id+"' ";
			Institution_DB.alter(sql);
			
//			搜索修改结果返回给list
			String SearchSql="select * from nsi_Institution_data where Id ='"+Institution_id+"' limit 0,1";
			list =Institution_DB.Search(SearchSql);
						
			session.setAttribute("Institution_countAllRS","1");//搜索结果
			
			request.setAttribute("Institution_list", list);	
			request.getRequestDispatcher("institution/Institution_list.jsp").forward(request, response);	
		
		}else if(whereFrom.equals("deleteButton")){

			String Institution_id = request.getParameter("alter_Institution_id");
			List<Institution_model> list = new ArrayList<Institution_model>();
//			获取ID,删除该条记录
			String sql="DELETE FROM nsi_institution_data WHERE Id ='"+Institution_id+"';";	
			Institution_DB.Delete(sql);		
//			搜索全部结果返回给list
			String SearchSql="select * from nsi_Institution_data;";
			list =Institution_DB.Search(SearchSql);
			
			System.out.println("deleteButton-Sql:"+Institution_id+sql);
			request.setAttribute("Institution_list", list);	
			request.getRequestDispatcher("institution/Institution_list.jsp").forward(request, response);
		}
}
}