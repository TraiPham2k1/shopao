package bo;

import dao.chitiethoadondao;

public class chitiethoadonbo {
	chitiethoadondao ctdao=new chitiethoadondao();
	public int Them(String Maao,long soluongmua,long MaHoaDon){
		return ctdao.Them(Maao, soluongmua, MaHoaDon);
	}
}
