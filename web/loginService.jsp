<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/30
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.JDBC.Appl.DBoperator" %>
<%@ page import="com.JDBC.User.userAccount" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String codeInput = (String)request.getParameter("validcode");
    String Vcode = (String)session.getAttribute("rand");
    String username = (String) request.getParameter("loginname");
    String userpwd = (String) request.getParameter("userpwd");
    String model = (String)request.getParameter("inputtype");
    if(codeInput.toUpperCase().equals(Vcode.toUpperCase())) {
        int modelnum;
        if (model.equals("name")) modelnum = 1;
        else if (model.equals("email")) modelnum = 2;
        else modelnum = 3;
        DBoperator dBoperator = new DBoperator();
        userAccount account = dBoperator.loginAccount(username, modelnum);
        if (account != null) {
            if(account.getUserpwd().equals(userpwd))
            {
                session.setAttribute("user",account);
                if(dBoperator.isAdmin(account.getUsertel()))
                    session.setAttribute("admin","admin");
                else
                    session.setAttribute("admin",null);
                response.sendRedirect("index.jsp");
            }
            else
            {
                session.setAttribute("validAccount","密码错误");
                %>
                <jsp:forward page="login.jsp"/>
                <%
            }
        }
        else
        {
            session.setAttribute("vaildAccount","找不到该用户");
            %>
            <jsp:forward page="login.jsp"/>
            <%
        }
    }
    else{
        session.setAttribute("va","验证码错误");
    %>
    <jsp:forward page="login.jsp"/>
    <%
    }
%>
</body>
</html>
