package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.khachhangbean;

public class khachhangdao {

	public khachhangbean ktdn(String tendn, String pass) {
		try {
			CoSodao cs= new CoSodao();
			cs.KetNoi();
			String sql="select * from KhachHang where tendn=? and pass=?";
			PreparedStatement cmd= cs.cn.prepareStatement(sql);
			cmd.setString(1, tendn);
			cmd.setString(2, pass);
			ResultSet rs= cmd.executeQuery();
			khachhangbean kh=null;
			if(rs.next()) {//Dang nhap thanh cong
				long makh=rs.getLong("makh");
				String hoten=rs.getString("hoten");
				String diachi=rs.getString("diachi");
				String sodt=rs.getString("sodt");
//				String tendn=rs.getString("tendn");
//				String pass=rs.getString("pass");
				kh=new khachhangbean(makh, hoten, diachi, sodt, tendn, pass);
			}
			rs.close(); cs.cn.close();
			return kh;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static void main(String[] args) {
		khachhangdao khdao=new  khachhangdao();
		khachhangbean kh=khdao.ktdn("nkchung", "123");
		System.out.println(kh.getMakh());
	}

}
