<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
   <!-- <form method="post" action="ktdk"> 
   <div>
   Họ tên khách hàng: <input name="txthtkh" type="text"> <br>
            Tên đăng nhập:<input name="txttdn" type="text"> <br>
            Mật khẩu: <input name="txtmk" type="password"> <br>
            Mật khẩu nhập lại: <input name="txtmknl" type="password"> <br>
            Email: <input name="txte" type="text"> <br>
            Địa Chỉ: <input name="txtdc" type="text"> <br>
           	Điện thoại: <input name="txtsdt" type="text"> <br>
            Ngày sinh:   <input type="date" name="txtns" placeholder="dd-mm-yyyy" value="" min="1997-01-01" max="2030-12-31">
            <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">      
   </div>
</form> -->
<div>


                    <h2 style="text-align:center">ĐĂNG KÝ THÀNH VIÊN</h2><table align="center">

                        <form action="ktdk" method="post">
                        <tbody>
                            <tr style="height:40px">
                                <td> Họ tên khách hàng:</td>
                                <td>
                                    <input id="HotenKH" name="HotenKH" type="text" value="">

                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td> Tên đăng nhập:</td>
                                <td>
                                    <input id="TenDN" name="TenDN" type="text" value="">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td>  Mật khẩu:</td>
                                <td>
                                    <input id="Matkhau" name="Matkhau" type="password">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td>Mật khẩu nhập lại: </td>
                                <td>
                                    <input id="Matkhaunhaplai" name="Matkhaunhaplai" type="password">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td> Email:</td>
                                <td>
                                    <input id="Email" name="Email" type="text" value="">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td> Địa chỉ:</td>
                                <td>
                                    <input id="Diachi" name="Diachi" type="text" value="">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td>Điện thoại:</td>
                                <td>
                                    <input id="Dienthoai" name="Dienthoai" type="text" value="">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td> Ngày sinh :</td>
                                <td>
                                    <input type="date" name="Ngaysinh">
                                </td>
                            </tr>
                            <tr style="height:40px">
                                <td></td>
                                <td>
                                    <input type="Submit" value="Đăng ký">
                                </td>
                            </tr>
                        </tbody>
                        </form>
                    </table>
                </div>
</body>
</html>