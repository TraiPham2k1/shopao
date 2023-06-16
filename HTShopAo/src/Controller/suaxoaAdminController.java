package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bo.loaibo;

/**
 * Servlet implementation class suaxoaAdminController
 */
@WebServlet("/suaxoaAdminController")
public class suaxoaAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaxoaAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		loaibo loai=new loaibo();
		String maloai=request.getParameter("txtmaloai");
		String tenloai=request.getParameter("txttenloai");
		String[] check = request.getParameterValues("check");
		if (check != null)
			for (String ml : check)
				try {
					loai.Xoa(maloai);
				response.sendRedirect("loaiController");
				} catch (Exception e) {
					e.printStackTrace();
				}
		if (request.getParameter("butsua") != null) {
			System.out.println("thanhcong");
			loai.Sua(maloai,tenloai);
			response.sendRedirect("loaiController");
		}
		if (request.getParameter("butxoa") != null) {
			String ml = request.getParameter("butxoa");
			try {
				loai.Xoa(ml);
				response.sendRedirect("loaiController");
			} catch (Exception e) {
				e.printStackTrace();
			}
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
