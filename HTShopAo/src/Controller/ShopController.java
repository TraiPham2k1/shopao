package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.aoquanbean;
import bo.aoquanbo;
import bo.loaibo;

/**
 * Servlet implementation class ShopController
 */
@WebServlet("/ShopController")
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		loaibo lbo = new loaibo();

		// ArrayList<loaibean> dsloai=lbo.getloai();
		request.setAttribute("dsloai", lbo.getloai());

		aoquanbo sbo = new aoquanbo();
		ArrayList<aoquanbean> dsaoquan = sbo.getao();
		String maloai = request.getParameter("ml");
		String key = request.getParameter("txttk");
		if (maloai != null)
			try {
				dsaoquan = sbo.TimMa(maloai);
			} catch (Exception e) {
				e.printStackTrace();
			}
		else if (key != null)
			dsaoquan = sbo.Tim(key);
		request.setAttribute("dsaoquan", dsaoquan);

		RequestDispatcher rd = request.getRequestDispatcher("Shop.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
