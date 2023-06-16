package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.aoquanbo;
import bo.loaibo;

/**
 * Servlet implementation class suaxoaAoController
 */
@WebServlet("/suaxoaAoController")
public class suaxoaAoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suaxoaAoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		aoquanbo ao=new aoquanbo();
		String maao=request.getParameter("txtmaao");
		String tenao=request.getParameter("txttenao");
		Long soluong=Long.parseLong("txtsoluong");
		Long gia=Long.parseLong("txtsoluong");
		String maloai=request.getParameter("txtmaloai");
		String anh=request.getParameter("txtanh");
		String[] check = request.getParameterValues("check");
		if (check != null)
			for (String ml : check)
				try {
					ao.Xoa(ml);
				response.sendRedirect("aoquanController");
				} catch (Exception e) {
					e.printStackTrace();
				}
//		if (request.getParameter("butsua") != null) {
//			System.out.println("thanhcong");
//			RequestDispatcher rd=request.getRequestDispatcher("SuaaoquanController");
//			rd.forward(request, response);
//		}
		if (request.getParameter("butxoa") != null) {
			String mao = request.getParameter("butxoa");
			try {
				ao.Xoa(mao);
				response.sendRedirect("aoquanController");
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
