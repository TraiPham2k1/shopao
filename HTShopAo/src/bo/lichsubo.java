package bo;

import java.util.ArrayList;
import bean.lichsubean;
import dao.lichsudao;


public class lichsubo {
	lichsudao ls=new lichsudao();
	ArrayList<lichsubean> ds;
   public ArrayList<lichsubean> getlichsu(long Makh) throws Exception{
	   ds=ls.getlichsu(Makh);
	   return ds;
   }
}
