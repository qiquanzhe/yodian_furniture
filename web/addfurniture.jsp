<%@ page import="com.JDBC.Appl.FDBoperator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/30
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    request.setCharacterEncoding("utf-8");
    int fid = Integer.parseInt(request.getParameter("fno")) ;
    String fname = (String)request.getParameter("fname");
    int ftype = Integer.parseInt(request.getParameter("ftype"));
    int fstock = Integer.parseInt(request.getParameter("fstock"));
    double fprice = Double.parseDouble(request.getParameter("fprice"));

    FDBoperator fdBoperator = new FDBoperator();
    //int num = fdBoperator.searchFurnitureById(fid);

    if(fdBoperator.searchFurnitureById(fid)==null)
    {
        String type = "";
        switch (ftype)
        {
            case 0:type = "沙发";break;
            case 1:type = "床";break;
            case 2:type = "桌子";break;
            case 3:type = "柜子";break;
        }
        fdBoperator.addFurniture(fid,fname,fstock,fprice,type);
        session.setAttribute("add","添加成功");
    }
    else
    {
        session.setAttribute("add","商品编号已存在");
    }
%>
<jsp:forward page="product-add.jsp"/>
</body>
</html>
