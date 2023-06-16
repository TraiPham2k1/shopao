package dao;

import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class chitiethoadondao {
	public int Them(String Maao,long soluongmua,long MaHoaDon) {
		try {
			CoSodao cs=new CoSodao();
			cs.KetNoi();
			String sql="insert into ChiTietHoaDon(Maao,SoLuongMua,MaHoaDon,damua) values(?,?,?,?)";
			PreparedStatement cmd=cs.cn.prepareStatement(sql);
			cmd.setString(1, Maao);
			cmd.setLong(2, soluongmua);
			cmd.setLong(3, MaHoaDon);
			cmd.setBoolean(4, false);
			int kq=cmd.executeUpdate();
			cs.cn.close();
			return kq;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
