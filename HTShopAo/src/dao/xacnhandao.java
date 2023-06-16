package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.xacnhanchitietbean;
import bean.xacnhanhoadonbean;

public class xacnhandao {
	 public ArrayList<xacnhanchitietbean> getdanhsach(){
	    	try {
	 		   CoSodao cs=new CoSodao();
	 		   cs.KetNoi();
	 		   ArrayList<xacnhanchitietbean> ds= new ArrayList<xacnhanchitietbean>();
	 		   String sql="select * from VXacNhanChiTiet where damua=0";
	 		   PreparedStatement cmd= cs.cn.prepareStatement(sql);
	 		   ResultSet rs=cmd.executeQuery();
	 		   while(rs.next()) {
				  long MaChiTietHD=rs.getLong("MaChiTietHD");
			      long MaHoaDon=rs.getLong("MaHoaDon");
				  long makh=rs.getLong("makh");
				  String hoten=rs.getString("hoten");; 
				  String tenao=rs.getString("tenao");
				  long SoLuongMua=rs.getLong("SoLuongMua");
				  long gia=rs.getLong("gia");
				  long ThanhTien=rs.getLong("ThanhTien");
				  Date NgayMua=rs.getDate("NgayMua");
				  boolean damua=rs.getBoolean("damua");
	 			  ds.add(new xacnhanchitietbean(MaChiTietHD, MaHoaDon, makh, hoten, tenao, gia, SoLuongMua, ThanhTien, NgayMua, damua));
	 		   }
	 		   //b4: Dong rs va cn
	 		   rs.close();
	 		   cs.cn.close();
	 		   return ds;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
	    }
	 public ArrayList<xacnhanhoadonbean> getdanhsachHD(){
	    	try {
	 		   CoSodao cs=new CoSodao();
	 		   cs.KetNoi();
	 		   ArrayList<xacnhanhoadonbean> ds= new ArrayList<xacnhanhoadonbean>();
	 		   String sql="select * from VXacNhanHoaDon where damuaHD=0";
	 		   PreparedStatement cmd= cs.cn.prepareStatement(sql);
	 		   ResultSet rs=cmd.executeQuery();
	 		   while(rs.next()) {
	 			  long MaChiTietHD=rs.getLong("MaChiTietHD");
			      long MaHoaDon=rs.getLong("MaHoaDon");
				  long makh=rs.getLong("makh");
				  String hoten=rs.getString("hoten");; 
				  String tenao=rs.getString("tenao");
				  long SoLuongMua=rs.getLong("SoLuongMua");
				  long gia=rs.getLong("gia");
				  long ThanhTien=rs.getLong("ThanhTien");
				  Date NgayMua=rs.getDate("NgayMua");
				  boolean damua=rs.getBoolean("damua");
	 			  ds.add(new xacnhanhoadonbean(MaChiTietHD, MaHoaDon, makh, hoten, tenao, gia, SoLuongMua, ThanhTien, NgayMua, damua));
	 		   }
	 		   rs.close();cs.cn.close();
	 		   return ds;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
	    }
	 public boolean updatect(int damua,long machitiethd) {
			try {
				CoSodao cs=new CoSodao();
				cs.KetNoi();
				String sql="update VXacNhanChiTiet set damua=? where MaChiTietHD=?";
				PreparedStatement cmd=cs.cn.prepareStatement(sql);
				cmd.setLong(1, damua);
				cmd.setLong(2, machitiethd);
				
				cmd.executeUpdate();
				cs.cn.close();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
	 public boolean updateHD(int damuaHD,long maHD) {
			try {
				CoSodao cs=new CoSodao();
				cs.KetNoi();
				String sql="update VXacNhanHoaDon set damuaHD=? where MaHoaDon=?";
				PreparedStatement cmd=cs.cn.prepareStatement(sql);
				int kq=cmd.executeUpdate();
				cmd.setLong(1, damuaHD);
				cmd.setLong(2, maHD);
				cs.cn.close();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
//	 public static void main(String[] args) {
//			xacnhanchitietdao sdao=new xacnhanchitietdao();
//			ArrayList<xacnhanchitietbean> ds=sdao.getdanhsach();
//			for (xacnhanchitietbean d : ds) {
//				System.out.println(d.getTenao());
//			}
//		}
//	 public static void main(String[] args) {
//			xacnhandao sdao=new xacnhandao();
//			ArrayList<xacnhanhoadonbean> ds=sdao.getdanhsachHD();
//			for (xacnhanhoadonbean d : ds) {
//				System.out.println(d.getTongmua());
//			}
//		}
   public static void main(String[] args) {
		xacnhandao dao=new xacnhandao();
		if(dao.updateHD(1,25))
		System.out.println("thành công");

	}
}
