<%@ page import="com.JDBC.Furniture.furnitureUnit" %>
<%@ page import="com.JDBC.Appl.FDBoperator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/30
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    request.setCharacterEncoding("utf-8");
    int fid = Integer.parseInt(request.getParameter("fno"));
    String fname = (String)request.getParameter("fname");
    //int ftype = Integer.parseInt(request.getParameter("ftype"));
    double fprice = Double.parseDouble(request.getParameter("fprice"));
    int fstock = Integer.parseInt(request.getParameter("fstock"));

    furnitureUnit fu = new furnitureUnit(fid,fname,fstock,null,fprice);
    FDBoperator fdBoperator = new FDBoperator();
    int num = fdBoperator.modFurniture(fu);
    if(num > 0) session.setAttribute("edit","修改成功");
    else session.setAttribute("edit","修改失败");
    %>
<jsp:forward page="product-edit.jsp"/>
<%
%>
</body>
</html>
