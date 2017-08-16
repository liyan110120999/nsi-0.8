package admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import people.DB;
import school.School_DB;
import school.School_model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/testJson")
public class testJson extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
//    	�����������
//    	Gson gson = new Gson();
//    	
////    	��ȡ�����ؼ��� �õ�list
//    	String School_searchKey="����";
//    	String sql=null;		
//		String sqlcount=null;
//		int countAllRS = 0;
//		
//		List<School_model> list = new ArrayList<School_model>();			
//
//		 sql="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312) limit 0,10";
//		 sqlcount="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312)";
//
//		System.out.println("school��������䣺"+sql);
//		
//		list=School_DB.Search(sql);
//		countAllRS=DB.count(sqlcount);
//    	String jsonList =gson.toJson(list);
//    	
////    	response.getWriter().write(Callback+"("+back+")");
////    	����list
//    	response.setContentType("text/html;charset=UTF-8");  
//    	response.getWriter().write(jsonList);
//    	System.out.println(jsonList);
    	
    	
//    	1����ȡ�ؼ��� ��ҳ����
//    	2��ƴװsql
//    	3������list
//    	4��ת��json
//    	5�����Ͽ���ͷcallback
//    	6��������Ϣ
    	
    	Gson gson = new Gson();
    	
//    	��ȡ�����ؼ��� �õ�list
    	String School_searchKey="����";
    	String sql=null;		
		String sqlcount=null;
		int countAllRS = 0;
		
		List<School_model> list = new ArrayList<School_model>();			

		 sql="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312) limit 0,10";
		 sqlcount="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312)";

		System.out.println("school��������䣺"+sql);
		
		list=School_DB.Search(sql);
		countAllRS=DB.count(sqlcount);
    	String jsonList =gson.toJson(list);
 
    	
//    	response.getWriter().write(Callback+"("+back+")");
//    	����list
    	response.setContentType("text/html;charset=UTF-8");  
    	response.getWriter().write(jsonList);
    	System.out.println(jsonList);
    	
    }

}
