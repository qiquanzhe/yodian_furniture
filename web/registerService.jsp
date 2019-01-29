<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/29
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.JDBC.Appl.DBoperator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<div style="font-size: 144px;font-family: '萝莉体 第二版'">
    <%
        String username = (String)request.getParameter("username");
        String password = (String)request.getParameter("userpwd");
        String usertel = (String)request.getParameter("usertel");
        String useremail = (String)request.getParameter("useremail");
        String codeInput = (String)request.getParameter("validcode");
        String Vcode = (String)session.getAttribute("rand");
        if(codeInput.equals(Vcode)) {
            session.setAttribute("va",null);
            DBoperator dBoperator = new DBoperator();
            int num = dBoperator.registerAccount(username, password, useremail, usertel);
            if (num == 0) {
                session.removeAttribute("vaildAccount");
                session.setAttribute("username",username);
                %>
                    <jsp:forward page="index.jsp"/>
                <%
                //操作
            }
            else if(num == 1)
            {
                session.setAttribute("vaildAccount","用户名已存在");
                %>
                    <jsp:forward page="register.jsp"/>
                <%
            }
            else if(num == 2)
            {
                session.setAttribute("vaildAccount","邮箱已存在");
                %>
                    <jsp:forward page="register.jsp"/>
                <%
            }
            else if(num == 3)
            {
                session.setAttribute("vaildAccount","手机号已存在");
                %>
                    <jsp:forward page="register.jsp"/>
                <%
            }
        }
        else{
            session.setAttribute("va","验证码错误");
            %>
                <jsp:forward page="register.jsp"/>
            <%
        }
    %>
</div>
</html>
