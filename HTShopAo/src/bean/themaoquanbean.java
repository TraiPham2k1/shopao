package bean;

import java.util.Date;

public class themaoquanbean {
	private String maao;
	private String tenao;
	private long soluong;
	private long gia;
	private String maloai;
	private String anh;
	public themaoquanbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public themaoquanbean(String maao, String tenao, long soluong, long gia, String maloai, String anh) {
		super();
		this.maao = maao;
		this.tenao = tenao;
		this.soluong = soluong;
		this.gia = gia;
		this.maloai = maloai;
		this.anh = anh;
	}
	public String getMaao() {
		return maao;
	}
	public void setMaao(String maao) {
		this.maao = maao;
	}
	public String getTenao() {
		return tenao;
	}
	public void setTenao(String tenao) {
		this.tenao = tenao;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
}
