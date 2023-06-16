package Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.aoquanbean;
import bo.aoquanbo;
import bo.loaibo;

/**
 * Servlet implementation class SuaaoquanController
 */
@WebServlet("/SuaaoquanController")
public class SuaaoquanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaaoquanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		loaibo lbo = new loaibo();
		request.setAttribute("dsloai", lbo.getloai());
		aoquanbo sbo = new aoquanbo();
		ArrayList<aoquanbean> dssach = sbo.getao();
		request.setAttribute("dssach", dssach);

		/*
		 * HttpSession session=request.getSession(); dangnhapbean
		 * admin=(dangnhapbean)session.getAttribute("admin"); if(admin==null) {
		 * response.sendRedirect("ktdnAdminController"); }
		 */
		if (request.getContentLength() <= 0) {
			RequestDispatcher rd = request.getRequestDispatcher("aoquan.jsp");
			rd.forward(request, response);
		} else {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
			String dirUrl1 = request.getServletContext().getRealPath("") + File.separator + "image_sach";
			response.getWriter().println(dirUrl1);
			String maao="", tenao="", maloai="",anh="";
			long soluong=0,gia=0;
			try {
				List<FileItem> fileItems = upload.parseRequest(request);// Láº¥y vá»� cĂ¡c Ä‘á»‘i tÆ°á»£ng gá»­i lĂªn
				// duyá»‡t qua cĂ¡c Ä‘á»‘i tÆ°á»£ng gá»­i lĂªn tá»« client gá»“m file vĂ  cĂ¡c control
				for (FileItem fileItem : fileItems) {
					if (!fileItem.isFormField()) {// Náº¿u ko pháº£i cĂ¡c control=>upfile lĂªn
						// xá»­ lĂ½ file
						String nameimg = fileItem.getName();
						anh="image_sach/"+nameimg ;
						if (!nameimg.equals("")) {
							// Láº¥y Ä‘Æ°á»�ng dáº«n hiá»‡n táº¡i, chá»§ Ă½ xá»­ lĂ½ trĂªn dirUrl Ä‘á»ƒ cĂ³ Ä‘Æ°á»�ng dáº«n Ä‘Ăºng
							String dirUrl = request.getServletContext().getRealPath("") + File.separator + "image_sach";
							File dir = new File(dirUrl);
							if (!dir.exists()) {// náº¿u ko cĂ³ thÆ° má»¥c thĂ¬ táº¡o ra
								dir.mkdir();
							}
							String fileImg = dirUrl + File.separator + nameimg;
							File file = new File(fileImg);// táº¡o file
							try {
								fileItem.write(file);// lÆ°u file
								System.out.println("UPLOAD THÀNH CÔNG...!");
								System.out.println("Đường dẫn lưu file là:  " + dirUrl);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}
					} else// Neu la control
					{
						String tentk=fileItem.getFieldName();
						if(tentk.equals("txtmaao"))
							maao= fileItem.getString();
						if(tentk.equals("txttenao"))
							tenao= fileItem.getString();
						if(tentk.equals("txtmaloai"))
							maloai= fileItem.getString();	
						if(tentk.equals("txtsoluong"))
							soluong= Integer.parseInt(fileItem.getString());
						if(tentk.equals("txtgia"))
							gia= Integer.parseInt(fileItem.getString());
						
					}
				}
				System.out.println(maao);
				sbo.Sua(maao, tenao, soluong, gia, maloai, anh);
				RequestDispatcher rd= request.getRequestDispatcher("aoquanController");
		    	rd.forward(request, response);
			} catch (FileUploadException e) {
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
