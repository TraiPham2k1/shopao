package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.dangkybean;
import bo.dangkybo;
import dao.dangkydao;

/**
 * Servlet implementation class ktdk
 */
@WebServlet("/ktdk")
public class ktdk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String HoTenKH=request.getParameter("HotenKH");
			String TenDN=request.getParameter("TenDN");
			String Matkhau=request.getParameter("Matkhau");
			String Matkhaunhaplai=request.getParameter("Matkhaunhaplai");
			String Email=request.getParameter("Email");
			String Diachi=request.getParameter("Diachi");
			String Dienthoai=request.getParameter("Dienthoai");
			String Ngaysinh=request.getParameter("Ngaysinh");
			
			if(Matkhau.equals(Matkhaunhaplai)) {
			dangkybo tk=new dangkybo();
			tk.Them(HoTenKH, Diachi, Dienthoai, Email, TenDN, Matkhau);
			
			RequestDispatcher rd = request.getRequestDispatcher("HomeController");// Chuyen tiep ve trang htsach.jsp
			rd.forward(request, response);
			}else
			{
				RequestDispatcher rd = request.getRequestDispatcher("dangkyController");// Chuyen tiep ve trang htsach.jsp
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
