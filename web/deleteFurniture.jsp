<%@ page import="com.JDBC.Appl.FDBoperator" %>
<%@ page import="com.JDBC.Furniture.furnitureUnit" %>
<%@ page import="java.util.List" %>
<%@ page import="com.JDBC.ImgIO.ImageUnit" %>
<%@ page import="com.JDBC.Appl.IMDBoperator" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/30
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    int fid = Integer.parseInt(request.getParameter("fid"));
    System.out.print(fid);
    FDBoperator fdBoperator = new FDBoperator();

    furnitureUnit fu = fdBoperator.searchFurnitureById(fid);
    System.out.println(fu);
    if(fu!=null)
    {
        fdBoperator.deleteFurniture(fid);
        List<ImageUnit> list = (new IMDBoperator()).searchImageById(fid);
        for(ImageUnit iu:list)
        {
            String url = application.getRealPath("/") + iu.getFimg();
            File file = new File(url);
            if(file.exists())
                file.delete();
        }
        session.setAttribute("tips",null);
    }
    else
    {
        session.setAttribute("tips","找不到该记录，请刷新页面！");
    }

    response.sendRedirect("product-list.jsp");
%>
</body>
</html>
