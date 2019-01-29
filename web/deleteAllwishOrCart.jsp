<%@ page import="com.JDBC.User.userAccount" %>
<%@ page import="com.JDBC.Appl.WCDBoperator" %>
<%@ page import="com.JDBC.Appl.FDBoperator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/3
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    userAccount ua = (userAccount) session.getAttribute("user");
    int stype = Integer.parseInt(request.getParameter("stype"));
    WCDBoperator wcdBoperator = new WCDBoperator();
    wcdBoperator.cleanWishCart(ua,stype);
%>
<script>
    window.history.back(-1);
</script>
</body>
</html>
