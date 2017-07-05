package people;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class People_servlet extends HttpServlet {
	public static final long serialVersionUID = 2L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    	this.doPost(request,response);
	    
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
			String whereFrom = null;
			String People_searchKey = null;
			whereFrom = request.getParameter("whereFrom");
			People_searchKey = request.getParameter("People_searchKey");
			
//			分页参数
			Integer pageNum = request.getParameter("pageNum") != null && !request.getParameter("pageNum").equals("") ? Integer.parseInt(request.getParameter("pageNum")) : 1;
			int OnePageNum=20;
			int pageNumX=(pageNum-1)*OnePageNum;
			
			HttpSession session=request.getSession(); 
			
			System.out.println("people-servlet:正在运行  页数： "+pageNum+"第一页数："+pageNumX);	
			
			if(whereFrom.equals("search")){
				int insertcount = 0;
				int countAllRS = 0;
//				搜索选项		
				String searchMenu=request.getParameter("searchMenu");
								
				String sql=null;		
				String sqlcount=null;
				List<People_model> list = new ArrayList<People_model>();
		
//				选项搜索
				if(searchMenu.equals("人脉")){				
					 sql="select * from nsi_people_data where CONCAT(IFNULL(`People_name`,''),IFNULL(`People_work`,''),IFNULL(`People_introduction`,''),IFNULL(`People_remark`,'')) like '%"+People_searchKey+"%'limit "+pageNumX+","+(pageNumX+OnePageNum)+"";	
					 sqlcount="select * from nsi_people_data where CONCAT(IFNULL(`People_name`,''),IFNULL(`People_work`,''),IFNULL(`People_introduction`,''),IFNULL(`People_remark`,'')) like '%"+People_searchKey+"%' ";
				}else if(searchMenu.equals("会员")){
					 sql="select * from nsi_people_data where CONCAT(IFNULL(`People_name`,''),IFNULL(`People_work`,''),IFNULL(`People_introduction`,''),IFNULL(`People_remark`,'')) like '%"+People_searchKey+"%' AND People_member IS NOT NULL AND People_member !='' limit "+pageNumX+","+(pageNumX+OnePageNum)+"";
					 sqlcount="select * from nsi_people_data where CONCAT(IFNULL(`People_name`,''),IFNULL(`People_work`,''),IFNULL(`People_introduction`,''),IFNULL(`People_remark`,'')) like '%"+People_searchKey+"%' AND People_member IS NOT NULL AND People_member !='' ";
				}else {
					 sql="select * from nsi_people_data where CONCAT(IFNULL(`People_name`,''),IFNULL(`People_work`,''),IFNULL(`People_introduction`,''),IFNULL(`People_remark`,'')) like '%"+People_searchKey+"%'limit 0,20";
					 sqlcount="select * from nsi_people_data where CONCAT(IFNULL(`People_name`,''),IFNULL(`People_work`,''),IFNULL(`People_introduction`,''),IFNULL(`People_remark`,'')) like '%"+People_searchKey+"%' ";
				}
		
				System.out.println("搜索语句："+searchMenu+sql);
				
				list=DB.Search(sql);
				countAllRS=DB.count(sqlcount);
				
				session.setAttribute("People_searchKey_session",People_searchKey);		
				session.setAttribute("countAllRS",countAllRS);		
				session.setAttribute("currentPage",pageNum);	//当前页
				//request.setAttribute("countAllRS", "11");	    //搜索结果数
				request.setAttribute("insertcount", insertcount);	//新增成功数
				request.setAttribute("list", list);	
				
//				 空展示
				session.setAttribute("People_nullShow","1");	
									
				request.getRequestDispatcher("people/People_list.jsp").forward(request, response);
			}
			else if(whereFrom.equals("detail")){
				int insertcount = 0;
				int countAllRS = 0;
				String detail_people_id = null;			
				detail_people_id = request.getParameter("detail_people_id");	
				List<People_model> list = new ArrayList<People_model>();
		
				String sql="select * from nsi_people_data where People_id='"+detail_people_id+"' limit 0,100 ";
				//String sql="select * from nsi_people_data limit 0,100";
				list=DB.Search(sql);
				
				request.setAttribute("countAllRS", countAllRS);	    //搜索结果数
				request.setAttribute("insertcount", insertcount);	//新增成功数
				request.setAttribute("list", list);					
				request.getRequestDispatcher("people/People_detail.jsp").forward(request, response);
			}
			else if(whereFrom.equals("insert")){

				
				int countAllRS = 0;
				String People_name = request.getParameter("People_name");			
				String People_member = request.getParameter("People_member");
				String People_dueTime = request.getParameter("People_dueTime");
				String People_work = request.getParameter("People_work");
				String People_position = request.getParameter("People_position");
				String People_phone = request.getParameter("People_phone");
				String People_mail = request.getParameter("People_mail");
				String People_telephone = request.getParameter("People_telephone");
				String People_wechat = request.getParameter("People_wechat");
				
				String People_loadPeople = request.getParameter("People_loadPeople");
				String People_loadTime = request.getParameter("People_loadTime");
				String People_address = request.getParameter("People_address");
				String People_introduction = request.getParameter("People_introduction");
				String People_remark = request.getParameter("People_remark");
			
				List<People_model> list = new ArrayList<People_model>();
		
				String sql="INSERT INTO nsi_people_data (People_name,People_member,People_dueTime,People_work,People_position,People_phone,People_mail,People_telephone,People_wechat,People_loadPeople,People_loadTime,People_address,People_introduction,People_remark) "
						+ "VALUES ('"+People_name+"','"+People_member+"','"+People_dueTime+"','"+People_work+"','"+People_position+"','"+People_phone+"','"+People_mail+"','"+People_telephone+"','"+People_wechat+"','"+People_loadPeople+"','"+People_loadTime+"','"+People_address+"','"+People_introduction+"','"+People_remark+"')";
	
				DB.Insert(sql);
				
				request.setAttribute("countAllRS", countAllRS);	    //搜索结果数
			
				request.getRequestDispatcher("people/People_list.jsp").forward(request, response);
			}		
			else if(whereFrom.equals("alterButton")){
				
				String alter_People_id = request.getParameter("alter_people_id");

				List<People_model> list = new ArrayList<People_model>();	
				String sql="select * from nsi_people_data where People_id='"+alter_People_id+"' limit 0,100 ";

				list=DB.Search(sql);
				
				
				request.setAttribute("list", list);   			
				request.getRequestDispatcher("people/People_alter.jsp").forward(request, response);				
			}
			
			else if(whereFrom.equals("alter")){
				
				String People_id = request.getParameter("alter_people_id");
			
				String People_name = request.getParameter("People_name");			
				String People_member = request.getParameter("People_member");
				String People_dueTime = request.getParameter("People_dueTime");
				String People_work = request.getParameter("People_work");
				String People_position = request.getParameter("People_position");
				String People_phone = request.getParameter("People_phone");
				String People_mail = request.getParameter("People_mail");
				String People_telephone = request.getParameter("People_telephone");
				String People_wechat = request.getParameter("People_wechat");
				String People_loadPeople = request.getParameter("username");
				String People_loadTime = request.getParameter("SubmitDate");
				String People_address = request.getParameter("People_address");
				String People_introduction = request.getParameter("People_introduction");
				String People_remark = request.getParameter("People_remark");
			

				
				List<People_model> list = new ArrayList<People_model>();
						
				String sql="UPDATE nsi_people_data SET People_name='"+People_name+"',People_member='"+People_member+"',People_dueTime='"+People_dueTime+"',People_work='"+People_work+"',People_position='"+People_position+"',People_phone='"+People_phone+"',People_mail='"+People_mail+"',People_telephone='"+People_telephone+"',People_wechat='"+People_wechat+"',People_loadPeople='"+People_loadPeople+"',People_loadTime='"+People_loadTime+"',People_address='"+People_address+"',People_introduction='"+People_introduction+"',People_remark='"+People_remark+"'"
						+ "WHERE People_id='"+People_id+"' ";
			
				DB.alter(sql);
				
				request.setAttribute("People_id", People_id);	  		
				request.getRequestDispatcher("people/People_list.jsp").forward(request, response);				
			}
			else if(whereFrom.equals("delete")){
				
				int countAllRS = 0;
				
				String People_id = request.getParameter("delete_people_id");			
			
			
				List<People_model> list = new ArrayList<People_model>();
		
				String sql="DELETE FROM nsi_people_data WHERE People_id ='"+People_id+"';";
			
				DB.Delete(sql);
				
				request.setAttribute("countAllRS", countAllRS);	    //搜索结果数
			
				request.getRequestDispatcher("people/People_list.jsp").forward(request, response);
			}

	}
			
}
