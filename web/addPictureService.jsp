<%@ page import="java.util.ArrayList" %>
<%@ page import="com.JDBC.Appl.IMDBoperator" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/1
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    //out.print(session.getAttribute("imMess"));
    String imMess = (String) session.getAttribute("imMess");
    String[] propertis = imMess.split(";");
    int fid = Integer.parseInt(propertis[0]);
    ArrayList<String> images = new ArrayList<String>();
    IMDBoperator imdBoperator = new IMDBoperator();
    for(int i = 1;i < propertis.length;i++)
    {
        images.add(propertis[i]);
    }
    for(String image:images)
    {
        if(imdBoperator.addImage(fid,image))
        {
            session.setAttribute("picMess","修改成功");
        }
        else
        {
            session.setAttribute("picMess","修改失败");
        }
    }
%>
<jsp:forward page="picture-add.jsp"/>
</body>
</html>
