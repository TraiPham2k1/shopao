package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import bean.khachhangbean;

public class hoadondao {
	public long maxhoadon() {
		try {
			CoSodao cs= new CoSodao();
			cs.KetNoi();
			String sql="select max(mahoadon) as maxhd from hoadon";
			PreparedStatement cmd= cs.cn.prepareStatement(sql);
			ResultSet rs= cmd.executeQuery();
			long kq=0;
			if(rs.next()) {//Dang nhap thanh cong
				kq=rs.getLong("maxhd");
			}
			rs.close(); cs.cn.close();
			return kq;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		
		}
	}
	public int Them(long makh) {
		try {
			CoSodao cs=new CoSodao();
			cs.KetNoi();
			String sql="insert into hoadon(makh,NgayMua,damua) values(?,?,?)";
			PreparedStatement cmd=cs.cn.prepareStatement(sql);
			
			cmd.setLong(1, makh);
			Calendar c=Calendar.getInstance();
			int ngay=c.get(Calendar.DAY_OF_MONTH);
			int thang=c.get(Calendar.MONTH)+1;
			int nam=c.get(Calendar.YEAR);
			String nn=String.valueOf(nam)+"-"+String.valueOf(thang)+"-"+String.valueOf(ngay);
			
			SimpleDateFormat dd=new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date ngaynhap=dd.parse(nn);
			
			cmd.setDate(2, new java.sql.Date(ngaynhap.getTime()));
			cmd.setBoolean(3, false);
			int kq=cmd.executeUpdate();
			return kq;
		} catch (Exception e) {
		 e.printStackTrace();
		 return 0;
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

}
