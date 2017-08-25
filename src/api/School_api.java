package api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sun.org.apache.bcel.internal.generic.RETURN;

import people.DB;
import people.People_model;
import school.School_Areas_model;
import school.School_DB;
import school.School_model;

@WebServlet("/School_api")
public class School_api extends HttpServlet{

	private static final long serialVersionUID = 2251864747506072591L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	String whereFrom = null;
			whereFrom = request.getParameter("whereFrom");
	
//	    	1、获取关键字 分页参数
//	    	2、拼装sql
//	    	3、返回list
//	    	4、转换json
//	    	5、加上跨域头callback
//	    	6、发送信息	
		if(whereFrom.equals("insert")){
			
		}else if(whereFrom.equals("delete")){
			
		}else if(whereFrom.equals("alter")){
			
		}else if(whereFrom.equals("search")){
			System.out.println("school api:WF=test");
			
	    	Gson gson = new Gson();   	

	    	String School_searchKey=request.getParameter("School_searchKey");
	    	String sql=null;		
			String sqlcount=null;
			int countAllRS = 0;
			
//			分页参数 ：第几页、每页几个。默认值：1、20；
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
///////////////////////////////////////////////////////////////////////////////////			
//	    	高级搜索
		}else if(whereFrom.equals("AdvancedSearch")){
			
			Gson gson = new Gson();   	
//			获取参数
//	    	String School_searchKey=request.getParameter("School_searchKey");
	    	String[] area = request.getParameterValues("area");
	    	String[] system = request.getParameterValues("system");
	    	String[] course = request.getParameterValues("course");
//	    	空数组
	    	String[] null4 = {"0","0","0","0"};
				
//			分页参数 ：第几页、每页几个。默认值：1、20；
			Integer pageNum = request.getParameter("pageNum") != null && !request.getParameter("pageNum").equals("") ? Integer.parseInt(request.getParameter("pageNum")) : 1;
			Integer OnePageNum = request.getParameter("OnePageNum") != null && !request.getParameter("OnePageNum").equals("") ? Integer.parseInt(request.getParameter("OnePageNum")) : 20;

			int pageNumX=(pageNum-1)*OnePageNum;
			
			List<School_model> list = new ArrayList<School_model>();
			
			StringBuffer StringBuffer = new StringBuffer("SELECT * from NSI_SCHOOL_data WHERE 1=1");
//				数组01不为空
			if(!Arrays.equals(area, null4)){
				StringBuffer.append(" AND ( 1=0");
				for(int i = 0; i<area.length; i++)
				 switch (area[i])
				 {
				  case "0":				 
				  break;
				  case "1":
					  StringBuffer.append(" or Areas like '%北京%'");
				  break;
				  case "2":
					  StringBuffer.append(" or Areas like '%上海%'");
				  break;
				  case "3":
					  StringBuffer.append(" or Areas like '%广州%'");
				  break;
				  case "4":
					  StringBuffer.append(" or Areas like '%深圳%'");
				  break;
				  
				  default:				  
				  break;
				 }
				StringBuffer.append(")");
				}
			
			if(!Arrays.equals(system, null4)){
				StringBuffer.append(" AND ( 1=0");
				for(int i = 0; i<system.length; i++)
				 switch (system[i])
				 {
				  case "0":					 
				  break;
				  case "1":
					  StringBuffer.append(" or School_system like '%高中%'");
				  break;
				  case "2":
					  StringBuffer.append(" or School_system like '%初中%'");
				  break;
				  case "3":
					  StringBuffer.append(" or School_system like '%小学%'");
				  break;
				  case "4":
					  StringBuffer.append(" or School_system like '%幼儿园%'");
				  break;
				  
				  default:					  
				  break;
				 }
				StringBuffer.append(")");
				}
			
			if(!Arrays.equals(course, null4)){
				StringBuffer.append(" AND ( 1=0");
				for(int i = 0; i<course.length; i++)
				 switch (course[i])
				 {
				  case "0":					 
				  break;
				  case "1":
					  StringBuffer.append(" or Course like '%AP%'");
				  break;
				  case "2":
					  StringBuffer.append(" or Course like '%PYP%'");
				  break;
				  case "3":
					  StringBuffer.append(" or Course like '%IMYC%'");
				  break;
				  case "4":
					  StringBuffer.append(" or Course like '%A-LEVEL%'");
				  break;
				  
				  default:					  
				  break;
				 }
				StringBuffer.append(")");
				}
			
			StringBuffer.append(" order by CONVERT(School_name USING gb2312)");
			StringBuffer.append("limit "+pageNumX+","+OnePageNum+"");
//			 order by CONVERT(School_name USING gb2312) limit "+pageNumX+","+OnePageNum+"
			System.out.println("school：搜索语句："+StringBuffer);
			
			list=School_DB.Search(StringBuffer.toString());

	    	String jsonList =gson.toJson(list);

	    	String Callback = request.getParameter("Callback");//客户端请求参数
	    	response.setContentType("text/html;charset=UTF-8");  
	    	response.getWriter().write(Callback+"("+jsonList+")");
	    	System.out.println(Callback+jsonList);
	    	
//	    	测试
	    	for(int i = 0; i<4; i++){
	    		System.out.println(course[i]);
		    	System.out.println(null4[i]);
	    	}
	    	
///////////////////////////////////////////////////////////////////////////////////	///////////////////////////////////////////////////////////////////////////////////	    	
//	    	高级搜索 计数
		}else if(whereFrom.equals("AdvancedSearchCount")){
			Gson gson = new Gson();   	
//			获取参数
//	    	String School_searchKey=request.getParameter("School_searchKey");
	    	String[] area = request.getParameterValues("area");
	    	String[] system = request.getParameterValues("system");
	    	String[] course = request.getParameterValues("course");
//	    	空数组
	    	String[] null4 = {"0","0","0","0"};
	    	int countAllRS = 0;
	    	
			StringBuffer StringBuffer = new StringBuffer("SELECT * from NSI_SCHOOL_data WHERE 1=1");
//				数组01不为空
			if(!Arrays.equals(area, null4)){
				StringBuffer.append(" AND ( 1=0");
				for(int i = 0; i<area.length; i++)
				 switch (area[i])
				 {
				  case "0":				 
				  break;
				  case "1":
					  StringBuffer.append(" or Areas like '%北京%'");
				  break;
				  case "2":
					  StringBuffer.append(" or Areas like '%上海%'");
				  break;
				  case "3":
					  StringBuffer.append(" or Areas like '%广州%'");
				  break;
				  case "4":
					  StringBuffer.append(" or Areas like '%深圳%'");
				  break;
				  
				  default:				  
				  break;
				 }
				StringBuffer.append(")");
				}
			
			if(!Arrays.equals(system, null4)){
				StringBuffer.append(" AND ( 1=0");
				for(int i = 0; i<system.length; i++)
				 switch (system[i])
				 {
				  case "0":					 
				  break;
				  case "1":
					  StringBuffer.append(" or School_system like '%高中%'");
				  break;
				  case "2":
					  StringBuffer.append(" or School_system like '%初中%'");
				  break;
				  case "3":
					  StringBuffer.append(" or School_system like '%小学%'");
				  break;
				  case "4":
					  StringBuffer.append(" or School_system like '%幼儿园%'");
				  break;
				  
				  default:					  
				  break;
				 }
				StringBuffer.append(")");
				}
			
			if(!Arrays.equals(course, null4)){
				StringBuffer.append(" AND ( 1=0");
				for(int i = 0; i<course.length; i++)
				 switch (course[i])
				 {
				  case "0":					 
				  break;
				  case "1":
					  StringBuffer.append(" or Course like '%AP%'");
				  break;
				  case "2":
					  StringBuffer.append(" or Course like '%PYP%'");
				  break;
				  case "3":
					  StringBuffer.append(" or Course like '%IMYC%'");
				  break;
				  case "4":
					  StringBuffer.append(" or Course like '%A-LEVEL%'");
				  break;
				  
				  default:					  
				  break;
				 }
				StringBuffer.append(")");
				}
			
			StringBuffer.append(" order by CONVERT(School_name USING gb2312)");

//			 order by CONVERT(School_name USING gb2312) limit "+pageNumX+","+OnePageNum+"
			System.out.println("school：搜索语句："+StringBuffer);
			countAllRS=DB.count(StringBuffer.toString());
			
			String back="{\"countAllRS\":\""+countAllRS+"\"}";

	    	String Callback = request.getParameter("Callback");//客户端请求参数	  	    	
	    	response.setContentType("text/html;charset=UTF-8");  
	    	response.getWriter().write(Callback+"("+back+")");
	    	System.out.println(Callback+"("+back+")");
			
			
///////////////////////////////////////////////////////////////////////////////////	///////////////////////////////////////////////////////////////////////////////////				
//	    	传入Id 返回list值
		}else if(whereFrom.equals("detail")){
			System.out.println("school api:WF=detail");		
	    	Gson gson = new Gson();   	
	    	String School_Id=request.getParameter("School_Id");
	    	String sql=null;		

			
			List<School_model> list = new ArrayList<School_model>();			
			 sql="SELECT * from NSI_SCHOOL_data WHERE"
			 		+ "Id="+School_Id+"order by CONVERT(School_name USING gb2312) limit 0,1";
			System.out.println("school：detail语句："+sql);
			
			list=School_DB.Search(sql);

	    	String jsonList =gson.toJson(list);

	    	String Callback = request.getParameter("Callback");//客户端请求参数
	    	response.setContentType("text/html;charset=UTF-8");  
	    	response.getWriter().write(Callback+"("+jsonList+")");
	    	System.out.println(Callback+jsonList);
///////////////////////////////////////////////////////////////////////////////////	///////////////////////////////////////////////////////////////////////////////////			
		}else if(whereFrom.equals("count")){
			
			System.out.println("school api:WF=count");		
	    	Gson gson = new Gson();   	
	    	String School_searchKey=request.getParameter("School_searchKey");			
			String sqlcount=null;
			int countAllRS = 0;
							
			sqlcount="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312)";
			System.out.println("school：搜索语句："+sqlcount);
					
			countAllRS=DB.count(sqlcount);
		
			String back="{countAllRS:"+countAllRS+"}";

	    	String Callback = request.getParameter("Callback");//客户端请求参数	  	    	
	    	response.setContentType("text/html;charset=UTF-8");  
	    	response.getWriter().write(Callback+"("+back+")");
	    	System.out.println(Callback+"("+back+")");
	    	
//	    	测试echart数据
		}else if(whereFrom.equals("testEchart")){	
			
			System.out.println("school api:WF=testEchart");		
	    	Gson gson = new Gson();   	
	    	String City_searchKey=request.getParameter("City_searchKey");			
			String sqlcount=null;
			int countAllRS = 0;
			String[] china=	{"北京", "上海", "天津", "重庆", "浙江", "江苏", "广东", "福建", "湖南", "湖北", "辽宁", 
				"吉林", "黑龙江", "河北", "河南", "山东", "陕西", "甘肃", "新疆", "青海", "山西", "四川", 
				"贵州", "安徽", "江西", "云南", "内蒙古", "西藏", "广西", "宁夏", "海南", "香港", "澳门", "台湾"};
			
			List<School_Areas_model> list=new ArrayList<School_Areas_model>();
		
			for(int i = 0; i<china.length; i++){
				sqlcount="SELECT * from NSI_SCHOOL_data WHERE Areas like '%"+china[i]+"%' order by CONVERT(School_name USING gb2312)";					
				countAllRS=DB.count(sqlcount);
				
				School_Areas_model School_Areas= new School_Areas_model();
				
				School_Areas.setName(china[i]);
				School_Areas.setValue(countAllRS);

				list.add(School_Areas);
			}
//			对list排序
			Collections.sort(list,new Comparator<School_Areas_model>() {
	        
				@Override
				public int compare(School_Areas_model arg0, School_Areas_model arg1) {
					// TODO Auto-generated method stub
					 int hits0 = arg0.getValue();  
		             int hits1 = arg1.getValue(); 
		             if (hits1 > hits0) {  
		                    return 1;  
		                } else if (hits1 == hits0) {  
		                    return 0;  
		                } else {  
		                    return -1;  
		                }  
					
					}
	        });
			
//			sqlcount="SELECT * from NSI_SCHOOL_data WHERE Areas like '%"+City_searchKey+"%' order by CONVERT(School_name USING gb2312)";
//			System.out.println("school：搜索语句："+sqlcount);
//					
//			countAllRS=DB.count(sqlcount);
//		
//			String back="{\""+City_searchKey+"\":\""+countAllRS+"\"}";
			String jsonList =gson.toJson(list);
			
	    	String Callback = request.getParameter("Callback");//客户端请求参数	  	    	
	    	response.setContentType("text/html;charset=UTF-8");  
	    	response.getWriter().write(Callback+"("+jsonList+")");
	    	System.out.println(Callback+"("+jsonList+")");
	    	
			
		}else if(whereFrom.equals("test")){
//	    	1、获取关键字 分页参数
//	    	2、拼装sql
//	    	3、返回list
//	    	4、转换json
//	    	5、加上跨域头callback
//	    	6、发送信息	
			System.out.println("school api:WF=test");
			
	    	Gson gson = new Gson();   	

	    	String School_searchKey=request.getParameter("School_searchKey");
	    	String sql=null;		
			String sqlcount=null;
			int countAllRS = 0;
			
//			分页参数 ：第几页、每页几个。默认值：1、20；
			Integer pageNum = request.getParameter("pageNum") != null && !request.getParameter("pageNum").equals("") ? Integer.parseInt(request.getParameter("pageNum")) : 1;
			Integer OnePageNum = request.getParameter("OnePageNum") != null && !request.getParameter("OnePageNum").equals("") ? Integer.parseInt(request.getParameter("OnePageNum")) : 20;

			int pageNumX=(pageNum-1)*OnePageNum;
			
			List<School_model> list = new ArrayList<School_model>();			
			 sql="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312) limit "+pageNumX+","+OnePageNum+"";
			 sqlcount="SELECT * from NSI_SCHOOL_data WHERE CONCAT(IFNULL(`School_name`,''),IFNULL(`Investment`,''),IFNULL(`remark`,''),IFNULL(`Areas`,''),IFNULL(`School_system`,''),IFNULL(`Course`,'')) like '%"+School_searchKey+"%' order by CONVERT(School_name USING gb2312)";
			System.out.println("school：搜索语句："+sql);
			
			list=School_DB.Search(sql);
			countAllRS=DB.count(sqlcount);
//	    	String jsonList =gson.toJson(list);
		
//			String back="{\"name\":\"Brett\"}";
			System.out.println(list);
//			附加参数
			Gson gson2 = new Gson(); 
		
	    	String jsonList =gson.toJson(list);

	    	String Callback = request.getParameter("Callback");//客户端请求参数
//	    	额外的参数
	    	    	
	    	response.setContentType("text/html;charset=UTF-8");  
//	    	response.getWriter().write(Callback+"("+jsonList+")");
	    	response.getWriter().write(Callback+"("+jsonList+")");
	    	System.out.println(Callback+"("+jsonList+")");
	    	
		}else{
			System.out.println("school_api：没收到whereFrom参数！！！");
		}
    }
}
