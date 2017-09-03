package admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

//�ļ��ϴ�
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
//servletע��
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
	    
//		Properties�����ļ�
		private static String propFileName = "../properties/WeeklyMail.properties"; // ָ����Դ�ļ������λ��
		private static Properties prop = new Properties(); // ������ʵ����Properties�����ʵ��
		
	    // �ϴ��ļ��洢Ŀ¼
	    private static final String UPLOAD_DIRECTORY = "upload";
	 
	    // �ϴ�����
	    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	 
	    /**
	     * �ϴ����ݼ������ļ�
	     */
	    protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			// ����Ƿ�Ϊ��ý���ϴ�
	    	System.out.println("mailUpImg.java:��ʼִ��");
			if (!ServletFileUpload.isMultipartContent(request)) {
			    // ���������ֹͣ
			    PrintWriter writer = response.getWriter();
			    writer.println("Error: ��������� enctype=multipart/form-data");
			    writer.flush();
			    return;
			}
	 
	        // �����ϴ�����
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        // �����ڴ��ٽ�ֵ - �����󽫲�����ʱ�ļ����洢����ʱĿ¼��
	        factory.setSizeThreshold(MEMORY_THRESHOLD);
	        // ������ʱ�洢Ŀ¼
	        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	 
	        ServletFileUpload upload = new ServletFileUpload(factory);
	         
	        // ��������ļ��ϴ�ֵ
	        upload.setFileSizeMax(MAX_FILE_SIZE);
	         
	        // �����������ֵ (�����ļ��ͱ�����)
	        upload.setSizeMax(MAX_REQUEST_SIZE);
	        
	        // ���Ĵ���
	        upload.setHeaderEncoding("UTF-8"); 

	        // ������ʱ·�����洢�ϴ����ļ�
	        // ���·����Ե�ǰӦ�õ�Ŀ¼
//	        String uploadPath = getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
	        String uploadPath = "C:" + File.separator+"upImage"+ File.separator+"upMailImg"+File.separator+ UPLOAD_DIRECTORY;
//	        String uploadPath =File.separator+"upImage"+ File.separator+"upMailImg"+File.separator+ UPLOAD_DIRECTORY;
	         
	        // ���Ŀ¼�������򴴽�
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }

	        try {
	            // ���������������ȡ�ļ�����
//	        	���Ծ���������Ϣ
//	            @SuppressWarnings("unchecked")
	            List<FileItem> formItems = upload.parseRequest(request);
	 				
	            if (formItems != null && formItems.size() > 0) {
	                // ����������
	            	int i=1;
					
	                for (FileItem item : formItems) {
	                	
	                    // �����ڱ��е��ֶ�
	                    if (!item.isFormField()) {
	                    	
	                    	// ��Properties�ļ���ȡ��InputStream������
//							InputStream in = getClass().getResourceAsStream(propFileName);
							InputStream in = MailUpImg.class.getResourceAsStream(propFileName);
							prop.load(in); // ͨ���������������Properties�ļ�
							String MailNum = prop.getProperty("MailNum"); // ��ȡprop�ڿ���
	    					
//	                    	ע�⣺mail001����ͼƬ����Դ����ǰ��λ�������ڿ��š�ÿ�η����� �ڿ���+1��������������ͼƬ�������⡣i����ͼƬ�Ĵ���
	                        String filePath = uploadPath + File.separator +"mail"+MailNum+i+".jpg";
	                        File storeFile = new File(filePath);                                               
	                        // �ڿ���̨����ļ����ϴ�·��                     
	                        System.out.println("ͼƬ�ϴ���ַ��"+filePath);
	                        System.out.println("MailNum��ֵ222222"+MailNum);
	          
	                        // �����ļ���Ӳ��
	                        item.write(storeFile);
	                        request.setAttribute("message",
	                            "�ļ��ϴ��ɹ�!");
	                    }
	                    i=i+1;
	                }
	            }
			       System.out.println("mailUpImg.java:����if formitem");
			       System.out.println("mailUpImg.java:��ʼִ��");
	        } catch (Exception ex) {
	            request.setAttribute("message",
	                    "������Ϣ: " + ex.getMessage());
	        }
	        response.sendRedirect("/nsi-0.8/Admin/WeeklyMail.jsp");
	        // ��ת�� message.jsp
//	        getServletContext().getRequestDispatcher("/nsi-0.8/people/People_list.jsp").forward(
//	                request, response);
	    }
	}
