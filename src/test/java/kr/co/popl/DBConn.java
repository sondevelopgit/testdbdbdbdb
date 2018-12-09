package kr.co.popl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConn {
	public static void main(String[] args) {
        Connection connection = null;
        Statement st = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            String url = "jdbc:mysql:localhost:3306/test";
            //url += "?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT&autoReconnect=true&useSSL=false";
            //url += "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            
            String id = "popl";
            String pw = "password";
            
            connection = DriverManager.getConnection(url, id, pw);
            st = connection.createStatement();
 
            String sql;
            sql = "select * FROM test_table;";
 
            ResultSet rs = st.executeQuery(sql);
 
            while (rs.next()) {
            	int num = rs.getInt("num");
            	String name = rs.getString("name");
            	
            	System.out.println("num: " + num);
            	System.out.println("name: " + name);
            }
 
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException se1) {
            se1.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (st != null)
                    st.close();
            } catch (SQLException se2) {
            }
            try {
                if (connection != null)
                    connection.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }    
    }
}