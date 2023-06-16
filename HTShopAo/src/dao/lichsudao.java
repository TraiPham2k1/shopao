package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import bean.lichsubean;

public class lichsudao {
	ArrayList<lichsubean> ds=new ArrayList<lichsubean>();
	public ArrayList<lichsubean> getlichsu(long makh) throws SQLException {
		try {
			CoSodao kn = new CoSodao();
    		kn.KetNoi();
    		//b2: lay du lieu ve
    		String sql="select * from LichSuMuaHang where makh=?";
    		PreparedStatement cmd = kn.cn.prepareStatement(sql);
    		cmd.setLong(1, makh);
    		ResultSet rs = cmd.executeQuery();
    		//luu all du lieu vao mang ds
    		while(rs.next()) {
    			//String makh = rs.getString("makh");
    			String MaHoaDon = rs.getString("MaHoaDon");
    			String tenao = rs.getString("tenao");
    			long SoLuongMua = rs.getLong("SoLuongMua");
    			long thanhtien = rs.getLong("ThanhTien");
    			Date NgayMua=rs.getDate("NgayMua");
    			Boolean damua = rs.getBoolean("damua");

    			ds.add(new lichsubean(makh, MaHoaDon, tenao, SoLuongMua, thanhtien, NgayMua, damua));
    		} 
    		//b4: dong ket noi
    		rs.close();
    		kn.cn.close();
        	return ds;

    	} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
    }    
}
