<%
Integer num1=Integer.parseInt(request.getParameter("num1"));
for(int i=1;i<=10;i++){
	out.println(num1*i+"<br>");
}
%>

<a href="index.jsp">Back</a>