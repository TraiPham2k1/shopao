package bo;

import bean.dangnhapbean;
import dao.dangnhapAdmindao;

public class dangnhapAdminbo {
	dangnhapAdmindao dndao=new dangnhapAdmindao();
	  public dangnhapbean ktdn(String tendn, String pass) {
		  return dndao.ktdn(tendn, pass);

    }
}
