package bo;

import java.util.ArrayList;

import bean.xacnhanchitietbean;
import bean.xacnhanhoadonbean;
import dao.xacnhandao;

public class xacnhanchitietbo {
	xacnhandao xndao = new xacnhandao();

	public ArrayList<xacnhanchitietbean> getdanhsach() {
		return xndao.getdanhsach();
	}

	public ArrayList<xacnhanhoadonbean> getdanhsachHD() {
		return xndao.getdanhsachHD();
	}

	public boolean updatect(int damua, long machitiethd) {
		return xndao.updatect(damua, machitiethd);
	}
	public boolean updateHD(int damuaHD, long maHD) {
		return xndao.updatect(damuaHD, maHD);
	}
}
