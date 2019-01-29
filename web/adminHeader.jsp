<%@ page import="com.JDBC.User.userAccount" %>
<%@ page import="com.JDBC.Appl.DBoperator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/1
  Time: 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="product-list.jsp">后台管理</a>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs">&#xe667;</a>
            <nav class="nav navbar-nav">
                <ul class="cl">
                    <li class="navbar-levelone">
                        <a href="index.jsp">返回首页</a>
                    </li>
                </ul>
            </nav>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li><%
                        userAccount user=(userAccount) session.getAttribute("user");
                        if(user == null || !(new DBoperator()).isAdmin(user.getUsertel()))
                        {
                    %>
                        <script>alert("无权限访问！");
                        </script>
                        <jsp:forward page="login.jsp"/>
                        <%
                        }
                        else
                        {
                            out.print(user.getUsername());
                        }
                        %></li>
                    <li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
</body>
</html>
