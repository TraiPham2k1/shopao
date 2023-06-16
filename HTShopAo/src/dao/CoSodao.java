package dao;

import java.sql.Connection;
import java.sql.DriverManager;


public class CoSodao {
	public Connection cn;
    public void KetNoi() {
    	try {
    		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        	System.out.print("Xong b1");
    		String url="jdbc:sqlserver://DELLLATITUDEE74:1433;databaseName=QLShopAo;user=sa;password=123456";
    		cn=DriverManager.getConnection(url);
        	System.out.print("Xong b2");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CoSodao kn = new CoSodao();
		kn.KetNoi();
	}
}
