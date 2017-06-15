package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.dbutil.Dbconn;
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
}
