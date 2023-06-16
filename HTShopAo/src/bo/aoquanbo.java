package bo;

import java.util.ArrayList;

import bean.loaibean;
import bean.themaoquanbean;
import bean.aoquanbean;
import dao.loaidao;
import dao.aoquandao;

public class aoquanbo {
	aoquandao sdao = new aoquandao();
	ArrayList<aoquanbean> ds;

	public ArrayList<aoquanbean> getao() {
		ds = sdao.getao();
		return ds;
	}

	public ArrayList<aoquanbean> TimMa(String maloai) throws Exception {
		ArrayList<aoquanbean> tam = new ArrayList<aoquanbean>();
		for (aoquanbean s : ds)
			if (s.getMaloai().equals(maloai))
				tam.add(s);
		return tam;
	}

	public ArrayList<aoquanbean> Tim(String key) {
		ArrayList<aoquanbean> tam = new ArrayList<aoquanbean>();
		for (aoquanbean s : ds)
			if (s.getTenao().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| s.getMaloai().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(s);
		return tam;
	}

	public int Them(String maao, String tenao, long soluong, long gia, String maloai, String anh) {
		return sdao.Them(maao, tenao, soluong, gia, maloai, anh);
	}

	public boolean Sua(String maao, String tenao, long soluong, long gia, String maloai, String anh) {
		return sdao.Sua(maao, tenao, soluong,  gia,  maloai,  anh);
	}

	public int Xoa(String maao) throws Exception {
		return sdao.Xoa(maao);
	}
}
