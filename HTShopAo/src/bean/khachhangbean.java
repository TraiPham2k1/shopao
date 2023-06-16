package bean;

public class khachhangbean {
  private long makh;
  private String hoten;
  private String diachi;
  private String sodt;
  private String tendn;
  private String pass;
public khachhangbean() {
	super();
	// TODO Auto-generated constructor stub
}
public khachhangbean(long makh, String hoten, String diachi, String sodt, String tendn, String pass) {
	super();
	this.makh = makh;
	this.hoten = hoten;
	this.diachi = diachi;
	this.sodt = sodt;
	this.tendn = tendn;
	this.pass = pass;
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
public String getDiachi() {
	return diachi;
}
public void setDiachi(String diachi) {
	this.diachi = diachi;
}
public String getSodt() {
	return sodt;
}
public void setSodt(String sodt) {
	this.sodt = sodt;
}
public String getTendn() {
	return tendn;
}
public void setTendn(String tendn) {
	this.tendn = tendn;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
}
