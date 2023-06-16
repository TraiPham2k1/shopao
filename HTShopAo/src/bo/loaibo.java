package bo;

import java.util.ArrayList;
import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao=new loaidao();
	ArrayList<loaibean> ds;
	public ArrayList<loaibean> getloai() {
		ds=ldao.getloai();
		return ds;
	}
	public int Them(String maloai,String tenloai){
		return ldao.Them(maloai, tenloai);
	}
	public boolean Sua(String maloai,String tenloai) {
		return ldao.Sua(maloai, tenloai);
	}
	
	public int Xoa(String maloai) throws Exception{
		return ldao.Xoa(maloai);
 }
}
