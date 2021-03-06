package admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

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

	@WebServlet("/MailUpImg")
	public class MailUpImg extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    
//		Properties配置文件
		private static String propFileName = "../properties/WeeklyMail.properties"; // 指定资源文件保存的位置
		private static Properties prop = new Properties(); // 创建并实例化Properties对象的实例
		
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
	    	System.out.println("mailUpImg.java:开始执行");
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
	        String uploadPath = "C:" + File.separator+"upImage"+ File.separator+"upMailImg"+File.separator+ UPLOAD_DIRECTORY;
//	        String uploadPath =File.separator+"upImage"+ File.separator+"upMailImg"+File.separator+ UPLOAD_DIRECTORY;
	         
	        // 如果目录不存在则创建
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }

	        try {
	            // 解析请求的内容提取文件数据
//	        	忽略警告或错误信息
//	            @SuppressWarnings("unchecked")
	            List<FileItem> formItems = upload.parseRequest(request);
	 				
	            if (formItems != null && formItems.size() > 0) {
	                // 迭代表单数据
	            	int i=1;
					
	                for (FileItem item : formItems) {
	                	
	                    // 处理不在表单中的字段
	                    if (!item.isFormField()) {
	                    	
	                    	// 将Properties文件读取到InputStream对象中
//							InputStream in = getClass().getResourceAsStream(propFileName);
							InputStream in = MailUpImg.class.getResourceAsStream(propFileName);
							prop.load(in); // 通过输入流对象加载Properties文件
							String MailNum = prop.getProperty("MailNum"); // 获取prop期刊号
	    					
//	                    	注意：mail001代表图片的资源名，前两位数代表期刊号。每次发送需 期刊号+1，来解决：浏览器图片缓存问题。i代表图片的次序
	                        String filePath = uploadPath + File.separator +"mail"+MailNum+i+".jpg";
	                        File storeFile = new File(filePath);                                               
	                        // 在控制台输出文件的上传路径                     
	                        System.out.println("图片上传地址："+filePath);
	                        System.out.println("MailNum的值222222"+MailNum);
	          
	                        // 保存文件到硬盘
	                        item.write(storeFile);
	                        request.setAttribute("message",
	                            "文件上传成功!");
	                    }
	                    i=i+1;
	                }
	            }
			       System.out.println("mailUpImg.java:跳出if formitem");
			       System.out.println("mailUpImg.java:开始执行");
	        } catch (Exception ex) {
	            request.setAttribute("message",
	                    "错误信息: " + ex.getMessage());
	        }
	        response.sendRedirect("/nsi-0.8/Admin/WeeklyMail.jsp");
	        // 跳转到 message.jsp
//	        getServletContext().getRequestDispatcher("/nsi-0.8/people/People_list.jsp").forward(
//	                request, response);
	    }
	}
