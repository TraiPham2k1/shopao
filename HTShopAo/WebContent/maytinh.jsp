

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	double kq=0;
	if(request.getAttribute("bkq")!=null)
		kq=(double)request.getAttribute("bkq");
	%>
	
				<form action="maytinh" method="post">
					a= <input name="txta" type="number" value="0"> <br>
					b= <input name="txtb" type="number" value="0"> <br>
					kq= <input name="txtkq" type="number" value="<%=kq%>"> <br>
					<input name="butc" type="submit" value="+"> 
					<input name="butt" type="submit" value="-"> 
					<input name="butn" type="submit" value="*">
					<input name="butchia" type="submit" value="/">
				</form>
</body>
</html>

