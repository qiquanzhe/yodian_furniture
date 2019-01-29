<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/2
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    if(session.getAttribute("user") != null)
        response.sendRedirect("my-wishlist.jsp");
    else
        response.sendRedirect("404.jsp");
%>
</body>
</html>
