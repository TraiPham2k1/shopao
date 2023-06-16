package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.dangkybean;
import dao.dangkydao;

public class dangkybo {
	dangkydao dk=new dangkydao();
	 public int Them(String hoten, String diachi, String sodt, String email, String tendn, String pass) throws Exception{
	    return dk.Them(hoten, diachi, sodt, email, tendn, pass);
	   }
}
