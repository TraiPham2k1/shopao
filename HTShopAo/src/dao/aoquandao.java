package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.loaibean;
import bean.xacnhanhoadonbean;
import bean.aoquanbean;

public class aoquandao {
	
	public ArrayList<aoquanbean> getao(){
    	ArrayList<aoquanbean> ds = new ArrayList<aoquanbean>();
		try {
    		//b1: ket noi vs csdl
    		CoSodao kn = new CoSodao();
    		kn.KetNoi();
    		//b2: lay du lieu ve
    		String sql="select * from AoQuan";
    		PreparedStatement cmd = kn.cn.prepareStatement(sql);
    		ResultSet rs = cmd.executeQuery();
    		//luu all du lieu vao mang ds
    		while(rs.next()) {
    			String maao = rs.getString("maao");
    			String tenao = rs.getString("tenao");
    			int soluong = rs.getInt("soluong");
    			int gia = rs.getInt("gia");
    			String maloai=rs.getString("maloai");
    			String anh = rs.getString("anh");
    			ds.add(new aoquanbean(maao, tenao, soluong, gia, maloai, anh));
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
	 public int Them(String maao, String tenao, long soluong, long gia, String maloai, String anh) {
			try {
				CoSodao cs=new CoSodao();
				cs.KetNoi();
				String sql="insert into AoQuan(maao,tenao,soluong,gia,maloai,anh) values(?,?,?,?,?,?)";
				PreparedStatement cmd=cs.cn.prepareStatement(sql);
				cmd.setString(1, maao);
				cmd.setString(2, tenao);
				cmd.setLong(3, soluong);
				cmd.setLong(4, gia);
				cmd.setString(5, maloai);
				cmd.setString(6, anh);
				int kq=cmd.executeUpdate();
				cs.cn.close();
				return kq;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		}
	 public boolean Sua(String maao, String tenao, long soluong, long gia, String maloai, String anh) {
			try {
				CoSodao kn = new CoSodao();
				kn.KetNoi();
				String sql = "update AoQuan  set tenao=?,soluong=?,gia=?,maloai=?,anh=? where maao=?";
				PreparedStatement cmd = kn.cn.prepareStatement(sql);
				cmd.setString(1, tenao);
				cmd.setLong(2, soluong);
				cmd.setLong(3, gia);
				cmd.setString(4, maloai);
				cmd.setString(5, anh);
				cmd.setString(6, maao);
				cmd.executeUpdate();
				kn.cn.close();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}

		public int Xoa(String maao) throws Exception {
			try {
				CoSodao kn = new CoSodao();
				kn.KetNoi();
				String sql = "delete from AoQuan where maao=?";
				PreparedStatement cmd = kn.cn.prepareStatement(sql);
				cmd.setString(1, maao);
				int kq = cmd.executeUpdate();
				kn.cn.close();
				return kq;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}
		}
	 public static void main(String[] args) {
			aoquandao sdao=new aoquandao();
			ArrayList<aoquanbean> ds=sdao.getao();
			for (aoquanbean d : ds) {
				System.out.println(d.getTenao());
			}
		}
}
