package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.dangnhapbean;
import bean.xacnhanhoadonbean;
import bo.xacnhanchitietbo;

/**
 * Servlet implementation class xacnhanhoadonController
 */
@WebServlet("/xacnhanhoadonController")
public class xacnhanhoadonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanhoadonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			xacnhanchitietbo xn=new xacnhanchitietbo();
			
			HttpSession session=request.getSession();
			dangnhapbean admin=(dangnhapbean)session.getAttribute("admin");
			if(admin==null) {
				response.sendRedirect("ktdnAdminController");
			}else {
				ArrayList<xacnhanhoadonbean> dshd=xn.getdanhsachHD();
				request.setAttribute("dshd", dshd);
				RequestDispatcher rd= request.getRequestDispatcher("xacnhanhoadon.jsp");
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
