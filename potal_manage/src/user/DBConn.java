package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	public static Connection getMySqlConnection() {
		Connection conn=null;
		try {
			String jdbcUrl="jdbc:mysql://localhost:3306/potaldatabase?autoReconnect=true&validationQuery=select 1";
		      String dbId = "root";
		      String dbPass = "apfhddlek65";
		      
		      Class.forName("com.mysql.jdbc.Driver");
		      conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		      
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;	      
	      
	}
}
