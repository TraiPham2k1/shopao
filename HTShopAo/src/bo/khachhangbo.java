package bo;

import bean.khachhangbean;
import dao.khachhangdao;

public class khachhangbo {
	  khachhangdao dn=new khachhangdao();
	    public khachhangbean ktdn(String tendangnhap, String matkhau) throws Exception {
	    	return dn.ktdn(tendangnhap, matkhau);
	    }
}
