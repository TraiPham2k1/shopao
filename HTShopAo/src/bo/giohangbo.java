package bo;



import java.util.ArrayList;



import bean.giohangbean;

public class giohangbo {
	public ArrayList<giohangbean> ds=new ArrayList<giohangbean>();
	
	public void Them(String maao, String tenao, long soluong, long gia, String anh) {
		for(giohangbean g:ds)
			if(g.getMaao().trim().equals(maao.trim())) {
				g.setSoluong(soluong+g.getSoluong());
				return ;
			}
			ds.add(new giohangbean(maao, tenao, soluong, gia, anh));
	}
	public void Sua(String maao, String tenao, long soluong, long gia, String anh) {
		for(giohangbean g:ds)
			if(g.getMaao().trim().equals(maao.trim())) {
				g.setSoluong(soluong);
				return ;
			}
			ds.add(new giohangbean(maao, tenao, soluong, gia, anh));
	}
	public long TongTien() {
		long s=0;
		for(giohangbean g:ds) 
			s=s+g.getThanhtien();
			return s;
		
	}
	 public ArrayList<giohangbean> Xoa(String ms) throws Exception{
	    	int n=ds.size();//lấy số phần tử trong mang
			for(int i=0;i<n;i++)
	    		if(ds.get(i).getMaao().equalsIgnoreCase(ms))
	    			{
	    				ds.remove(i);break;	
	    			}
	    	return ds;
	 }
}
