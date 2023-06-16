
<!DOCTYPE html>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Remove"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.giohangbean"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
/*   giohangbo gh=(giohangbo)session.getAttribute("gio");
  String[] check= request.getParameterValues("check");
  if(check!=null)
	  for(String ms:check)
		  gh.Xoa(ms);
  	session.setAttribute("i", gh.ds.size());
  if(request.getParameter("butxoa")!=null){
	  String ms=request.getParameter("butxoa");
	  gh.Xoa(ms);
  }
  if(request.getParameter("butsua")!=null){
	  String ms=request.getParameter("butsua");
	  String sl=request.getParameter(ms);
	//  out.print(ms+":"+sl);
	  gh.Sua(ms, "", Long.parseLong(sl), 0, "");
  }
  session.setAttribute("i", gh.ds.size());
  session.setAttribute("gio", gh);
  if(gh.ds.size()==0 || session.getAttribute("gio")==null){
	  session.removeAttribute("dn");
	  session.removeAttribute("gio");
	  session.setAttribute("i", 0);
	  response.sendRedirect("htsach.jsp");
  }
  else
	  response.sendRedirect("htgio.jsp"); */
%>
</body>
</html>