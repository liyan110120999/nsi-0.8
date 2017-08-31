package model.dbutil;

import java.sql.*;


public class School_DBconn {
    private static String username = "root";
    private static String password = "123456";
    private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/nsi_database?useSSL=true";
    
//用户登录验证 sql 配置
     public static Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
        Class.forName(driver).newInstance();
        return DriverManager.getConnection(url, username, password);
    }
    
}