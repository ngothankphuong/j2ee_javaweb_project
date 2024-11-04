package dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect  { 
	private static Connection con;
    public static Connection getConn() 
        throws SQLException, ClassNotFoundException 
    { 
    	
        // Database Connection 
        String dbURL = "jdbc:mysql://localhost:3306/phone_store";
        String dbUsername = "root"; 
        String dbPassword = "admin"; 
  
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(dbURL , dbUsername, dbPassword); 
        return con; 
    } 
} 