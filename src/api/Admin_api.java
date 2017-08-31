package api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import people.DB;
import school.School_Areas_model;
import school.School_DB;
import school.School_model;
import user.User_DB;
import user.User_model;

@WebServlet("/Admin_api")
public class Admin_api extends HttpServlet{

	private static final long serialVersionUID = 4592738530208345077L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String whereFrom = null;
		whereFrom = request.getParameter("whereFrom");
    	
    	if(whereFrom.equals("Staff_MonthlyCount")){
//    		1、取得 要统计的月份
//    		2、得到员工姓名列表
//    		3、遍历 列表 查询贡献量
    		
    		System.out.println("school api:WF======Staff_MonthlyCount");		
	    	Gson gson = new Gson();   	
	
	    	String Month_Time_Key=request.getParameter("Month_Time_Key");
	    	String sql=null;		
			String sqlcount=null;
			int countAllRS = 0;
			
			List<User_model> list = new ArrayList<User_model>();			
			 sql="SELECT * from nsi_user WHERE member_sign > 3";

			System.out.println("Admin_api：搜索员工语句："+sql);
			list=User_DB.Search(sql);
			
//			借用School_Areas_model的键值模型
			List<School_Areas_model> list02=new ArrayList<School_Areas_model>();
			
			
			for(int i = 0; i<list.size(); i++){
				String name=list.get(i).getName();
				sqlcount="SELECT * from NSI_SCHOOL_data WHERE load_people ='"+name+"' AND load_time like '%"+Month_Time_Key+"%' ";					
				countAllRS=DB.count(sqlcount);
				
				School_Areas_model School_Areas= new School_Areas_model();
				
				School_Areas.setName(name);
				School_Areas.setValue(countAllRS);

				list02.add(School_Areas);
			}
			
	    	String jsonList =gson.toJson(list02);
	    	String Callback = request.getParameter("Callback");//客户端请求参数
	    	response.setContentType("text/html;charset=UTF-8");  
	    	response.getWriter().write(Callback+"("+jsonList+")");
	    	System.out.println(Callback+jsonList);
  
	    }else if(whereFrom.equals("search")){
	    	
			System.out.println("school api:WF======search");
			
	    	Gson gson = new Gson();   	
	
	    	String School_searchKey=request.getParameter("School_searchKey");
	    	String sql=null;		
			String sqlcount=null;
			int countAllRS = 0;
			
	//		分页参数 ：第几页、每页几个。默认值：1、20；
			Integer pageNum = request.getParameter("pageNum") != null && !request.getParameter("pageNum").equals("") ? Integer.parseInt(request.getParameter("pageNum")) : 1;
			Integer OnePageNum = request.getParameter("OnePageNum") != null && !request.getParameter("OnePageNum").equals("") ? Integer.parseInt(request.getParameter("OnePageNum")) : 20;
	
			int pageNumX=(pageNum-1)*OnePageNum;
			
			List<School_model> list = new ArrayList<School_model>();			
			 sql="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312) limit "+pageNumX+","+OnePageNum+"";
			 sqlcount="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312)";
			System.out.println("school：搜索语句："+sql);
			
			list=School_DB.Search(sql);
			countAllRS=DB.count(sqlcount);
	    	String jsonList =gson.toJson(list);
	
	    	String Callback = request.getParameter("Callback");//客户端请求参数
	    	response.setContentType("text/html;charset=UTF-8");  
	    	response.getWriter().write(Callback+"("+jsonList+")");
	    	System.out.println(Callback+jsonList);
	    }
    }
    }
