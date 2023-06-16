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
import bean.khachhangbean;
import bean.loaibean;
import bo.lichsubo;
import bo.loaibo;

/**
 * Servlet implementation class loaiController
 */
@WebServlet("/loaiController")
public class loaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loaiController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			loaibo lbo=new loaibo();
			
			HttpSession session=request.getSession();
			dangnhapbean admin=(dangnhapbean)session.getAttribute("admin");
			if(admin==null) {
				response.sendRedirect("ktdnAdminController");
			}else {
				ArrayList<loaibean> dsloai=lbo.getloai();
				request.setAttribute("dsloai", dsloai); 
				RequestDispatcher rd= request.getRequestDispatcher("loai.jsp");
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
