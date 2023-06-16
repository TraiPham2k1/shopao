package bean;

import java.sql.Date;

public class xacnhanhoadonbean {
	private long MaChiTietHD;
	private long MaHoaDon;
	private long makh;
	private String hoten;
	private String tenao;
	private long gia;
	private long SoLuongMua;
	private long ThanhTien;
	private Date NgayMua;
	private boolean damua;
	public xacnhanhoadonbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public xacnhanhoadonbean(long maChiTietHD, long maHoaDon, long makh, String hoten, String tenao, long gia,
			long soLuongMua, long thanhTien, Date ngayMua, boolean damua) {
		super();
		MaChiTietHD = maChiTietHD;
		MaHoaDon = maHoaDon;
		this.makh = makh;
		this.hoten = hoten;
		this.tenao = tenao;
		this.gia = gia;
		SoLuongMua = soLuongMua;
		ThanhTien = thanhTien;
		NgayMua = ngayMua;
		this.damua = damua;
	}
	public long getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(long maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
	public long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTenao() {
		return tenao;
	}
	public void setTenao(String tenao) {
		this.tenao = tenao;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
}
