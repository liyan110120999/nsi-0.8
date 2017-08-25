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
	
//	是否存在用户
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
//	检查用户标志位是否 未激活
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
        System.out.println("code验证："+checkCode);
    return checkCode;
	}
	
// 待修改 为ID查询 暂时用不到
//	查询用户等级标志位
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
        System.out.println("Model 查询用户等级为："+User_Member_sign);
    return User_Member_sign;
	}
	
	
//	用户cookie校验
	public int UserVerify(String username,String member_sign,String UserVerifyCode) {
//		1、用户存不存在？
//		2、权限标记位是否正确？
//		3、校验和是否正确？
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
        
        System.out.println("Model 用户cookie校验为："+CookieVerify);
    return CookieVerify;
	}
}
