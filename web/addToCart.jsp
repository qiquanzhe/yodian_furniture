<%@ page import="com.JDBC.User.userAccount" %>
<%@ page import="com.JDBC.Appl.WCDBoperator" %>
<%@ page import="com.JDBC.Appl.FDBoperator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/3
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    userAccount ua = (userAccount)session.getAttribute("user");
    if(ua == null)
        response.sendRedirect("login.jsp");
    else {
        int fid = Integer.parseInt(request.getParameter("fid"));
        System.out.println(ua+"  "+fid);
        WCDBoperator wcdBoperator = new WCDBoperator();
        wcdBoperator.addWishCart(ua,(new FDBoperator()).searchFurnitureById(fid),1,1);
        System.out.println((new FDBoperator()).searchFurnitureById(fid));
%>
<script>
    window.history.back(-1);
</script>
<%
    }
%>
</body>
</html>
