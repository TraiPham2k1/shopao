package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	  public ArrayList<loaibean> getloai() {
	    	ArrayList<loaibean> ds = new ArrayList<loaibean>();
	    	try {
	    		//b1: ket noi vs csdl
	    		CoSodao kn = new CoSodao();
	    		kn.KetNoi();
	    		//b2: lay du lieu ve
	    		String sql="select * from loai";
	    		PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    		ResultSet rs = cmd.executeQuery();
	    		//luu all du lieu vao mang ds
	    		while(rs.next()) {
	    			String maloai = rs.getString("maloai");
	    			String tenloai = rs.getString("tenloai");
	    			ds.add(new loaibean(maloai, tenloai));
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
	  public int Them(String maloai, String tenloai) {
			try {
				CoSodao cs = new CoSodao();
				cs.KetNoi();
				String sql = "insert into loai(maloai,tenloai) values(?,?)";
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				cmd.setString(1, maloai);
				cmd.setString(2, tenloai);
				int kq = cmd.executeUpdate();
				cs.cn.close();
				return kq;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		}
	  public boolean Sua(String maloai, String tenloai) {
			try {
				CoSodao kn = new CoSodao();
				kn.KetNoi();
				String sql = "update loai  set tenloai=? where maloai=?";
				PreparedStatement cmd = kn.cn.prepareStatement(sql);
				cmd.setString(1, tenloai);
				cmd.setString(2, maloai);
				cmd.executeUpdate();
				kn.cn.close();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}

		public int Xoa(String maloai) throws Exception {
			try {
				CoSodao kn = new CoSodao();
				kn.KetNoi();
				String sql = "delete from loai where maloai=?";
				PreparedStatement cmd = kn.cn.prepareStatement(sql);
				cmd.setString(1, maloai);
				int kq = cmd.executeUpdate();
				kn.cn.close();
				return kq;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		}
}
