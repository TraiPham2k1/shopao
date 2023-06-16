package bean;

public class giohangbean {
	private String maao;
	private String tenao;
	private long soluong;
	private long gia;
	private long thanhtien;
	private String anh;
	public giohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public giohangbean(String maao, String tenao, long soluong, long gia, String anh) {
		super();
		this.maao = maao;
		this.tenao = tenao;
		this.soluong = soluong;
		this.gia = gia;
		this.thanhtien =soluong*gia;
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
	public long getThanhtien() {
		return soluong*gia;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
}
