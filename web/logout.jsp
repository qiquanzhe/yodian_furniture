<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/30
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    session.removeAttribute("user");
    session.removeAttribute("admin");
    response.sendRedirect("index.jsp");
%>
</body>
</html>
