

<jsp:useBean id="user" class="com.preet.mvc.modal.User"></jsp:useBean>
<jsp:useBean id="userDao" class="com.preet.mvc.dao.UserDaoImpl"></jsp:useBean>
<%--
String userName=request.getParameter("userName");
String userPassword=request.getParameter("userPassword");



--%>

<%--
<jsp:setProperty property="userName" name="user" value="<%=userName %>"/>
<jsp:setProperty property="userPassword" name="user" value="<%=userPassword %>"/>
user.setUserName(userName);
 --%>



<%--
 <jsp:setProperty property="userName" name="user" param="userName"/>
<jsp:setProperty property="userPassword" name="user" param="userPassword"/>
 --%>
 <jsp:setProperty property="*" name="user" />
 

<%
String res=userDao.validate(user)+".jsp";

application.setAttribute("un",user.getName());


%>
<%--response.sendRedirect(res+".jsp"); --%>

<jsp:forward page="<%=res %>">
<jsp:param value="<%=user.getName() %>" name="un"></jsp:param>
</jsp:forward>

<!-- if(res){
	
	response.sendRedirect("welcome.jsp");
	
}
else{
	response.sendRedirect("error.jsp");
	
} 
page import="com.preet.mvc.dao.UserDao"%>
@page import="com.preet.mvc.dao.UserDaoImpl"%>
%@page import="com.preet.mvc.modal.User"%> -->