package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangbean;
import bean.khachhangbean;
import bo.chitiethoadonbo;
import bo.giohangbo;
import bo.hoadonbo;

/**
 * Servlet implementation class dathangController
 */
@WebServlet("/dathangController")
public class dathangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dathangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		hoadonbo hd=new hoadonbo();
		chitiethoadonbo ct=new chitiethoadonbo();
		
		HttpSession session=request.getSession();
		khachhangbean kh=(khachhangbean)session.getAttribute("kh");
		if(kh!=null) {
			giohangbo gh=(giohangbo)session.getAttribute("gio");
				hd.Them(kh.getMakh());//them vao 1 hoa don
				
			long mahd=hd.maxhoadon();
			for(giohangbean g: gh.ds) {
				ct.Them(g.getMaao(),g.getSoluong(),mahd);
			}
			RequestDispatcher rd=request.getRequestDispatcher("lichsuController");
			rd.forward(request, response);
		}else
		{
			RequestDispatcher rd=request.getRequestDispatcher("dangnhap.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
