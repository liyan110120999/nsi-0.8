package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.dbutil.Dbconn;
import people.DB;
import entity.User;

public class Model {
	User user =new User();
	public boolean checkUser(String username, String password) {
		user =this.queryByName(username);
		if (user!=null) {
			return (username.equals(user.getName()) && password.equals(user
					.getPassword()));}
		else 
			return false;
	}
	
	private PreparedStatement  ps;
	private ResultSet rs;
	Dbconn s=new Dbconn();
	
//	�Ƿ�����û�
	public User queryByName(String name) {
		User user = null; 
		String sql = "select * from nsi_user where UserName = ? ";
        try {
    		Connection conn=s.getConnection();
        	ps = conn.prepareStatement(sql);
        	ps.setString(1, name);
            rs = ps.executeQuery();
           if(rs.next()){
                user = new User();
                user.setName(rs.getString("UserName"));
                user.setPassword(rs.getString("Password"));
                user.setUser_TureName(rs.getString("User_TureName"));
                user.setMember_sign(Integer.parseInt(rs.getString("Member_sign")));
               
            }
            s.closeAll(conn,ps,rs);   
        } catch (Exception e) {
            e.printStackTrace();
        }
    return user;
	}
//	����û���־λ�Ƿ� δ����
	public boolean queryByCode(String name) {
		User user = null; 
		boolean checkCode = false; 
		String sql = "select * from nsi_user where UserName = ? AND Member_sign > 0";
        try {
    		Connection conn=s.getConnection();
        	ps = conn.prepareStatement(sql);
        	ps.setString(1, name);
            rs = ps.executeQuery();
           if(rs.next()){
        	   checkCode=true;
            }
            s.closeAll(conn,ps,rs);   
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("code��֤��"+checkCode);
    return checkCode;
	}
	
// ���޸� ΪID��ѯ ��ʱ�ò���
//	��ѯ�û��ȼ���־λ
	public int queryById(String name) {
		User user = null; 
		int User_Member_sign= -2; 
		String sql = "select * from nsi_user where UserName = ?";
        try {
    		Connection conn=s.getConnection();
        	ps = conn.prepareStatement(sql);
        	ps.setString(1, name);
            rs = ps.executeQuery();
           if(rs.next()){
        	   user = new User();
               user.setName(rs.getString("UserName"));
               user.setMember_sign(Integer.parseInt(rs.getString("Member_sign")));
            }
            s.closeAll(conn,ps,rs);   
        } catch (Exception e) {
            e.printStackTrace();
        }
        User_Member_sign=user.getMember_sign();
        System.out.println("Model ��ѯ�û��ȼ�Ϊ��"+User_Member_sign);
    return User_Member_sign;
	}
	
	
//	�û�cookieУ��
	public int UserVerify(String username,String member_sign,String UserVerifyCode) {
//		1���û��治���ڣ�
//		2��Ȩ�ޱ��λ�Ƿ���ȷ��
//		3��У����Ƿ���ȷ��
		User user = null; 
		int CookieVerify= -3; 
		String sql = "select * from nsi_user where UserName = '"+username+"'";
		int aa=DB.count(sql);
		if (aa>=1) {
			 try {
		    		Connection conn=s.getConnection();
		        	ps = conn.prepareStatement(sql);	        
		            rs = ps.executeQuery();
		           if(rs.next()){
		        	   user = new User();
		               user.setName(rs.getString("UserName"));
		               user.setMember_sign(Integer.parseInt(rs.getString("Member_sign")));
		            }
		            s.closeAll(conn,ps,rs);   
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
			 String bb=String.valueOf(user.getMember_sign());
			
			 if(member_sign.equals(bb)){
				 int cc=username.length()*Integer.parseInt(member_sign)+987654;
				 if (cc==Integer.parseInt(UserVerifyCode)) {
					 CookieVerify=1;
				 }
			 }else {
				 CookieVerify=-1;
			 }
			 
		}else {
			CookieVerify=-2;
		}
        
        System.out.println("Model �û�cookieУ��Ϊ��"+CookieVerify);
    return CookieVerify;
	}
	
//	�ж������Ƿ����
	public int UserExistence(String username) {
//		1���û��治���ڣ�
		User user = null; 
		int CookieVerify= -3; 
		String sql = "select * from nsi_user where UserName = '"+username+"'";
		int aa=DB.count(sql);
		if (aa>=1) {
				 CookieVerify=1;
		}else {
			CookieVerify=-1;
		}
        System.out.println("Model �û������Ƿ���ڣ�"+CookieVerify);
    return CookieVerify;
	}
}
