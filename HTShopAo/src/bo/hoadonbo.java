package bo;

import dao.hoadondao;

public class hoadonbo {
	hoadondao hddao=new hoadondao();
	public long maxhoadon() {
		return hddao.maxhoadon();
	}
	public int Them(long makh) {
		return hddao.Them(makh);
	}
}
