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
	@WebServlet("/UploadServlet")
	public class People_UpImg extends HttpServlet {
	    private static final long serialVersionUID = 1L;

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
	    	
	    	String people_id=request.getParameter("UpImage_people_id");
	    	 System.out.println("ͼƬservlet���յ����û�ID:"+people_id);
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
	        String uploadPath = "C:" + File.separator+"upImage"+ File.separator+"upPeopleImg"+File.separator+ UPLOAD_DIRECTORY;
	         
	        // ���Ŀ¼�������򴴽�
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }
	 
	        try {
	            // ���������������ȡ�ļ�����
//	        	���Ծ���������Ϣ
	            @SuppressWarnings("unchecked")
	            List<FileItem> formItems = upload.parseRequest(request);
	 
	            if (formItems != null && formItems.size() > 0) {
	                // ����������
	                for (FileItem item : formItems) {
	                    // �����ڱ��е��ֶ�
	                    if (!item.isFormField()) {
//	                    	�ļ���
//	                        String fileName = new File(item.getName()).getName();
	                    	
	                        String filePath = uploadPath + File.separator + people_id+".jpg";
	                        File storeFile = new File(filePath);
	                        
	                        //	                        �ϴ�ͼƬ��ַ�����ݿ�
	                        String sql="UPDATE nsi_people_data SET People_ImgUrl='/upImage/upPeopleImg/upload/"+people_id+".jpg' WHERE People_id='"+people_id+"' ";    			
	        				DB.alter(sql);
	                        
	                        // �ڿ���̨����ļ����ϴ�·��                     
	                        System.out.println("ͼƬ�ϴ���ַ��"+filePath);
	                        System.out.println("ͼƬ�ϴ�sql��"+sql);
	                        // �����ļ���Ӳ��
	                        item.write(storeFile);
	                        request.setAttribute("message",
	                            "�ļ��ϴ��ɹ�!");
	                    }
	                }
	            }
	        } catch (Exception ex) {
	            request.setAttribute("message",
	                    "������Ϣ: " + ex.getMessage());
	        }
	        response.sendRedirect("/nsi-0.8/people/People_list.jsp");
	        // ��ת�� message.jsp
//	        getServletContext().getRequestDispatcher("/nsi-0.8/people/People_list.jsp").forward(
//	                request, response);
	    }
	}