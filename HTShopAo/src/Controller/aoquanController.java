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

import bean.aoquanbean;
import bean.dangnhapbean;
import bo.aoquanbo;

/**
 * Servlet implementation class aoquanController
 */
@WebServlet("/aoquanController")
public class aoquanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aoquanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			aoquanbo sbo=new aoquanbo();
			
			HttpSession session=request.getSession();
			dangnhapbean admin=(dangnhapbean)session.getAttribute("admin");
			if(admin==null) {
				response.sendRedirect("ktdnAdminController");
			}else {
				ArrayList<aoquanbean> dsaoquan=sbo.getao();
				request.setAttribute("dsaoquan", dsaoquan); 
				RequestDispatcher rd= request.getRequestDispatcher("aoquan.jsp");
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