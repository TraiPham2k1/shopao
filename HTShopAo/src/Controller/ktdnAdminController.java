package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.dangnhapbean;
import bean.khachhangbean;
import bo.dangnhapAdminbo;
import bo.khachhangbo;

/**
 * Servlet implementation class ktdnAdminController
 */
@WebServlet("/ktdnAdminController")
public class ktdnAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ktdnAdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String un=request.getParameter("txtun");
			String pass=request.getParameter("txtpass");
			
			   dangnhapAdminbo adminbo= new dangnhapAdminbo();
			   dangnhapbean admin=null;
			   RequestDispatcher rd;
			   if(un!=null && pass!=null) {
				  HttpSession session=request.getSession();
				  if(session.getAttribute("admin")==null) {
					  admin=new dangnhapbean();
				  }
				  admin=adminbo.ktdn(un, pass);
					  if(admin==null) 
						   rd= request.getRequestDispatcher("dangnhapAdmin.jsp?kt=1");
					  else {
						   session.setAttribute("admin",admin);
						  rd= request.getRequestDispatcher("loaiController");
					  }
			   	}else 
				   rd= request.getRequestDispatcher("dangnhapAdmin.jsp");
			   rd.forward(request, response);
			   
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
