package bean;

import java.util.Date;

public class lichsubean{
	private long makh;
	private String MaHoaDon;
	private String Tenao;
	private long SoLuongMua;
	private long thanhtien;
	private Date NgayMua;
	private boolean damua;
	public lichsubean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsubean(long makh, String maHoaDon, String tenao, long soLuongMua, long thanhtien, Date ngayMua,
			boolean damua) {
		super();
		this.makh = makh;
		MaHoaDon = maHoaDon;
		Tenao = tenao;
		SoLuongMua = soLuongMua;
		this.thanhtien = thanhtien;
		NgayMua = ngayMua;
		this.damua = damua;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public String getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public String getTenao() {
		return Tenao;
	}
	public void setTenao(String tenao) {
		Tenao = tenao;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
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
