<!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@page import="java.security.SecureRandom"%>
<%
SecureRandom generator= new SecureRandom();
float range = (99 - 10);
int fraction = (int)((range) * generator.nextFloat());
%>
<script>
var GLSHOME = "<%=request.getContextPath()%>";
var fractionJS = <%=fraction%>;
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">	
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript" src="js/tpyrcne.jsp"></script>	
<title>Salt Login Example</title>
</head>
<body>
	Salt login Example
	<br>
	<br>
	<form name="frm_login" method="post">
		<input type=hidden name="mdiresu" value=""> 
		<input type=hidden name="mdwp" value=""> 
		<input type=hidden name="shadwp" value=""> 
		<input type="hidden" name="id" value="">
		Enter Username :<input type="text" name="userName"> <br>
		Enter Password :<input type="password" name="password"><br>
		<input id="login" type="button" value="Login" onClick="onSubmit();">		
	</form>
</body>
</html>