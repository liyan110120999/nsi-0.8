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
//文件上传
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
//servlet注解
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

	/**
	 * Servlet implementation class UploadServlet
	 */
	@WebServlet("/UploadServlet")
	public class People_UpImg extends HttpServlet {
	    private static final long serialVersionUID = 1L;

	    // 上传文件存储目录
	    private static final String UPLOAD_DIRECTORY = "upload";
	 
	    // 上传配置
	    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	 
	    /**
	     * 上传数据及保存文件
	     */
	    protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			// 检测是否为多媒体上传
	    	
	    	String people_id=request.getParameter("UpImage_people_id");
	    	 System.out.println("图片servlet，收到的用户ID:"+people_id);
			if (!ServletFileUpload.isMultipartContent(request)) {
			    // 如果不是则停止
			    PrintWriter writer = response.getWriter();
			    writer.println("Error: 表单必须包含 enctype=multipart/form-data");
			    writer.flush();
			    return;
			}
	 
	        // 配置上传参数
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
	        factory.setSizeThreshold(MEMORY_THRESHOLD);
	        // 设置临时存储目录
	        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	 
	        ServletFileUpload upload = new ServletFileUpload(factory);
	         
	        // 设置最大文件上传值
	        upload.setFileSizeMax(MAX_FILE_SIZE);
	         
	        // 设置最大请求值 (包含文件和表单数据)
	        upload.setSizeMax(MAX_REQUEST_SIZE);
	        
	        // 中文处理
	        upload.setHeaderEncoding("UTF-8"); 

	        // 构造临时路径来存储上传的文件
	        // 这个路径相对当前应用的目录
//	        String uploadPath = getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
	        String uploadPath = "C:" + File.separator+"upImage"+ File.separator+"upPeopleImg"+File.separator+ UPLOAD_DIRECTORY;
	         
	        // 如果目录不存在则创建
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }
	 
	        try {
	            // 解析请求的内容提取文件数据
//	        	忽略警告或错误信息
	            @SuppressWarnings("unchecked")
	            List<FileItem> formItems = upload.parseRequest(request);
	 
	            if (formItems != null && formItems.size() > 0) {
	                // 迭代表单数据
	                for (FileItem item : formItems) {
	                    // 处理不在表单中的字段
	                    if (!item.isFormField()) {
//	                    	文件名
//	                        String fileName = new File(item.getName()).getName();
	                    	
	                        String filePath = uploadPath + File.separator + people_id+".jpg";
	                        File storeFile = new File(filePath);
	                        
	                        //	                        上传图片地址至数据库
	                        String sql="UPDATE nsi_people_data SET People_ImgUrl='/upImage/upPeopleImg/upload/"+people_id+".jpg' WHERE People_id='"+people_id+"' ";    			
	        				DB.alter(sql);
	                        
	                        // 在控制台输出文件的上传路径                     
	                        System.out.println("图片上传地址："+filePath);
	                        System.out.println("图片上传sql："+sql);
	                        // 保存文件到硬盘
	                        item.write(storeFile);
	                        request.setAttribute("message",
	                            "文件上传成功!");
	                    }
	                }
	            }
	        } catch (Exception ex) {
	            request.setAttribute("message",
	                    "错误信息: " + ex.getMessage());
	        }
	        response.sendRedirect("/nsi-0.8/people/People_list.jsp");
	        // 跳转到 message.jsp
//	        getServletContext().getRequestDispatcher("/nsi-0.8/people/People_list.jsp").forward(
//	                request, response);
	    }
	}